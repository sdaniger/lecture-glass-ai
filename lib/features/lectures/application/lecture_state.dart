import '../domain/lecture.dart';

enum LectureLoadState { initial, loading, loaded, error }

class LectureState {
  final LectureLoadState loadState;
  final List<Lecture> lectures;
  final Lecture? selectedLecture;
  final String? errorMessage;
  final bool isCreating;

  const LectureState({
    this.loadState = LectureLoadState.initial,
    this.lectures = const [],
    this.selectedLecture,
    this.errorMessage,
    this.isCreating = false,
  });

  LectureState copyWith({
    LectureLoadState? loadState,
    List<Lecture>? lectures,
    Lecture? selectedLecture,
    String? errorMessage,
    bool? isCreating,
  }) {
    return LectureState(
      loadState: loadState ?? this.loadState,
      lectures: lectures ?? this.lectures,
      selectedLecture: selectedLecture ?? this.selectedLecture,
      errorMessage: errorMessage ?? this.errorMessage,
      isCreating: isCreating ?? this.isCreating,
    );
  }
}