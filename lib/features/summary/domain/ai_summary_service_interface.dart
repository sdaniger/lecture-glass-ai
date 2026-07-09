import '../domain/topic.dart';
import '../domain/lecture_summary.dart';

class ChunkSegment {
  final double startSeconds;
  final double endSeconds;
  final String text;

  const ChunkSegment({
    required this.startSeconds,
    required this.endSeconds,
    required this.text,
  });
}

class SummaryResult {
  final LectureSummary summary;
  final List<Topic> topics;

  const SummaryResult({
    required this.summary,
    required this.topics,
  });
}

abstract class AiSummaryService {
  Future<SummaryResult> generateSummary(AiSummaryRequest request);
}

class AiSummaryRequest {
  final String lectureTitle;
  final List<ChunkSegment> segments;
  final String? apiKey;
  final String? modelName;
  final String? baseUrl;

  const AiSummaryRequest({
    required this.lectureTitle,
    required this.segments,
    this.apiKey,
    this.modelName,
    this.baseUrl,
  });
}