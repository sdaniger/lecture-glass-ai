import 'dart:async';
import 'transcript_segment.dart';

abstract class TranscriptionService {
  Future<List<TranscriptSegment>> transcribe({
    required String audioPath,
    required int lectureId,
    String? modelPath,
  });

  Future<bool> isModelDownloaded();
  Future<void> downloadModel(String modelName);
  Future<List<String>> getAvailableModels();
}

abstract class LiveTranscriptionService {
  Stream<List<TranscriptSegment>> transcribeLive({
    required String audioPath,
    required int lectureId,
    required double totalDurationSeconds,
  });
}
