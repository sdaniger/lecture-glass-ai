import '../domain/transcript_segment.dart';

enum TranscriptionLoadState { initial, loading, loaded, error }

class TranscriptionState {
  final TranscriptionLoadState loadState;
  final List<TranscriptSegment> segments;
  final String? errorMessage;
  final bool isTranscribing;

  const TranscriptionState({
    this.loadState = TranscriptionLoadState.initial,
    this.segments = const [],
    this.errorMessage,
    this.isTranscribing = false,
  });

  TranscriptionState copyWith({
    TranscriptionLoadState? loadState,
    List<TranscriptSegment>? segments,
    String? errorMessage,
    bool? isTranscribing,
  }) {
    return TranscriptionState(
      loadState: loadState ?? this.loadState,
      segments: segments ?? this.segments,
      errorMessage: errorMessage ?? this.errorMessage,
      isTranscribing: isTranscribing ?? this.isTranscribing,
    );
  }
}
