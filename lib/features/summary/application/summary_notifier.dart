import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/errors.dart';
import '../../../core/logger.dart';
import '../../lectures/data/lecture_repository.dart';
import '../../transcription/data/transcript_repository.dart';
import '../data/ai_summary_service.dart';
import '../data/topic_repository.dart';
import '../domain/ai_summary_service_interface.dart';
import 'summary_state.dart';

final summaryStateProvider = StateNotifierProvider.family<
    SummaryNotifier, SummaryState, int>((ref, lectureId) {
  return SummaryNotifier(ref, lectureId);
});

class SummaryNotifier extends StateNotifier<SummaryState> {
  final Ref _ref;
  final int _lectureId;

  SummaryNotifier(this._ref, this._lectureId)
      : super(const SummaryState());

  Future<void> loadSummary() async {
    if (state.summary != null) return;
    state = state.copyWith(loadState: SummaryLoadState.loading);
    try {
      final topicRepo = _ref.read(topicRepositoryProvider);
      final summaryRepo = _ref.read(summaryRepositoryProvider);

      final topics = await topicRepo.getByLectureId(_lectureId);
      final summary = await summaryRepo.getByLectureId(_lectureId);

      state = state.copyWith(
        loadState: SummaryLoadState.loaded,
        topics: topics,
        summary: summary,
      );
    } catch (e) {
      AppLogger.e('Failed to load summary', e);
      state = state.copyWith(
        loadState: SummaryLoadState.error,
        errorMessage: '要約の読み込みに失敗しました',
      );
    }
  }

  Future<void> generateSummary({String? apiKey, String? modelName}) async {
    state = state.copyWith(
      loadState: SummaryLoadState.generating,
      errorMessage: null,
    );
    try {
      final lectureRepo = _ref.read(lectureRepositoryProvider);
      final lecture = await lectureRepo.getById(_lectureId);
      if (lecture == null) {
        throw const UnknownError('講義が見つかりません');
      }

      final transcriptRepo = _ref.read(transcriptRepositoryProvider);
      final segments = await transcriptRepo.getByLectureId(_lectureId);
      if (segments.isEmpty) {
        throw const UnknownError('文字起こしがありません');
      }

      final chunkSegments = segments
          .map((s) => ChunkSegment(
                startSeconds: s.startSeconds,
                endSeconds: s.endSeconds,
                text: s.text,
              ))
          .toList();

      final aiService = _ref.read(aiSummaryServiceProvider);
      final result = await aiService.generateSummary(
        AiSummaryRequest(
          lectureTitle: lecture.title,
          segments: chunkSegments,
          apiKey: apiKey,
          modelName: modelName,
        ),
      );

      final topicRepo = _ref.read(topicRepositoryProvider);
      await topicRepo.saveTopics(
        _lectureId,
        result.topics.map((t) => t.copyWith(lectureId: _lectureId)).toList(),
      );

      final summaryRepo = _ref.read(summaryRepositoryProvider);
      await summaryRepo.saveSummary(
        _lectureId,
        result.summary.copyWith(lectureId: _lectureId),
      );

      await lectureRepo.update(lecture.copyWith(summaryStatus: 'completed'));

      state = state.copyWith(
        loadState: SummaryLoadState.loaded,
        summary: result.summary.copyWith(lectureId: _lectureId),
        topics: result.topics
            .map((t) => t.copyWith(lectureId: _lectureId))
            .toList(),
      );
    } catch (e) {
      AppLogger.e('Summary generation failed', e);
      state = state.copyWith(
        loadState: SummaryLoadState.error,
        errorMessage:
            e is AppError ? e.message : '要約の生成に失敗しました: $e',
      );
    }
  }
}