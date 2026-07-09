import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/errors.dart';
import '../../../core/logger.dart';
import '../data/audio_converter_service.dart';
import '../data/local_transcription_service.dart';
import '../data/transcript_repository.dart';
import '../domain/transcript_segment.dart';
import 'transcription_state.dart';

final transcriptionStateProvider = StateNotifierProvider.family<
    TranscriptionNotifier, TranscriptionState, int>((ref, lectureId) {
  return TranscriptionNotifier(
    ref: ref,
    lectureId: lectureId,
  );
});

class TranscriptionNotifier extends StateNotifier<TranscriptionState> {
  final Ref _ref;
  final int _lectureId;

  TranscriptionNotifier({
    required Ref ref,
    required int lectureId,
  }) : _ref = ref,
       _lectureId = lectureId,
       super(const TranscriptionState());

  Future<void> loadSegments() async {
    state = state.copyWith(loadState: TranscriptionLoadState.loading);
    try {
      final repo = _ref.read(transcriptRepositoryProvider);
      final segments = await repo.getByLectureId(_lectureId);
      state = state.copyWith(
        loadState: TranscriptionLoadState.loaded,
        segments: segments,
      );
    } catch (e) {
      AppLogger.e('Failed to load segments', e);
      state = state.copyWith(
        loadState: TranscriptionLoadState.error,
        errorMessage: '文字起こしの読み込みに失敗しました',
      );
    }
  }

  Future<void> startTranscription({
    required String audioPath,
    required String wavPath,
  }) async {
    state = state.copyWith(isTranscribing: true, errorMessage: null);
    try {
      final converter = _ref.read(audioConverterServiceProvider);
      final wav = await converter.convertToWav(audioPath);

      final transcriptionService = _ref.read(transcriptionServiceProvider);
      final segments = await transcriptionService.transcribe(
        audioPath: wav,
        lectureId: _lectureId,
      );

      final repo = _ref.read(transcriptRepositoryProvider);
      await repo.saveSegments(_lectureId, segments);

      state = state.copyWith(
        isTranscribing: false,
        segments: segments,
        loadState: TranscriptionLoadState.loaded,
      );
    } catch (e) {
      AppLogger.e('Transcription failed', e);
      state = state.copyWith(
        isTranscribing: false,
        errorMessage: e is AppError
            ? e.message
            : '文字起こしに失敗しました: $e',
      );
    }
  }

  Stream<List<TranscriptSegment>> watchSegments() {
    final repo = _ref.read(transcriptRepositoryProvider);
    return repo.watchByLectureId(_lectureId);
  }
}