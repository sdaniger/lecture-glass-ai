enum RecordingState {
  idle,
  recording,
  paused,
  completed,
  error,
}

abstract class RecordingService {
  RecordingState get state;
  Duration get elapsed;
  String? get filePath;

  Stream<RecordingState> watchState();
  Stream<Duration> watchElapsed();

  Future<void> startRecording({required String outputPath});
  Future<String?> stopRecording();
  Future<void> cancelRecording();
  Future<bool> hasPermission();
}
