import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/logger.dart';
import '../../../core/platform/platform_info.dart';
import '../data/lecture_repository.dart';
import '../domain/lecture.dart';
import 'lecture_state.dart';

final lectureStateProvider =
    StateNotifierProvider<LectureNotifier, LectureState>((ref) {
  final repo = ref.watch(lectureRepositoryProvider);
  return LectureNotifier(repo);
});

class LectureNotifier extends StateNotifier<LectureState> {
  final LectureRepository _repo;

  LectureNotifier(this._repo) : super(const LectureState());

  Future<void> loadLectures() async {
    state = state.copyWith(loadState: LectureLoadState.loading);
    try {
      final lectures = await _repo.getAll();
      state = state.copyWith(
        loadState: LectureLoadState.loaded,
        lectures: lectures,
      );
    } catch (e) {
      AppLogger.e('Failed to load lectures', e);
      state = state.copyWith(
        loadState: LectureLoadState.error,
        errorMessage: '講義一覧の読み込みに失敗しました',
      );
    }
  }

  Stream<List<Lecture>> watchLectures() {
    return _repo.watchAll();
  }

  Future<Lecture> createLecture({
    required String title,
    String? audioPath,
    double? durationSeconds,
  }) async {
    state = state.copyWith(isCreating: true);
    try {
      final lecture = Lecture(
        id: 0,
        title: title,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        audioPath: audioPath,
        durationSeconds: durationSeconds,
        deviceId: PlatformInfo.isWindows ? 'windows' : 'android',
      );
      final created = await _repo.create(lecture);
      await loadLectures();
      state = state.copyWith(isCreating: false);
      return created;
    } catch (e) {
      state = state.copyWith(isCreating: false);
      rethrow;
    }
  }

  Future<void> refresh() async {
    await loadLectures();
  }
}