import '../domain/topic.dart';
import '../domain/lecture_summary.dart';

enum SummaryLoadState { initial, loading, generating, loaded, error }

class SummaryState {
  final SummaryLoadState loadState;
  final LectureSummary? summary;
  final List<Topic> topics;
  final String? errorMessage;

  const SummaryState({
    this.loadState = SummaryLoadState.initial,
    this.summary,
    this.topics = const [],
    this.errorMessage,
  });

  SummaryState copyWith({
    SummaryLoadState? loadState,
    LectureSummary? summary,
    List<Topic>? topics,
    String? errorMessage,
  }) {
    return SummaryState(
      loadState: loadState ?? this.loadState,
      summary: summary ?? this.summary,
      topics: topics ?? this.topics,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}