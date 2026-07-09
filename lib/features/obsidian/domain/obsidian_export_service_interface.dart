import '../../../features/summary/domain/topic.dart';
import '../../../features/summary/domain/lecture_summary.dart';

enum ExistingFileBehavior {
  overwrite,
  append,
  skip,
}

class ObsidianExportRequest {
  final String vaultPath;
  final String folderName;
  final String title;
  final DateTime date;
  final String overallSummary;
  final List<Topic> topics;
  final List<String> reviewPoints;
  final List<String> examPoints;
  final List<KeywordExplanation> keywords;
  final String transcript;
  final ExistingFileBehavior existingFileBehavior;
  final bool openAfterExport;

  const ObsidianExportRequest({
    required this.vaultPath,
    this.folderName = '大学講義',
    required this.title,
    required this.date,
    required this.overallSummary,
    this.topics = const [],
    this.reviewPoints = const [],
    this.examPoints = const [],
    this.keywords = const [],
    this.transcript = '',
    this.existingFileBehavior = ExistingFileBehavior.overwrite,
    this.openAfterExport = false,
  });
}

class ObsidianExportResult {
  final String filePath;
  final bool success;
  final String? errorMessage;

  const ObsidianExportResult({
    required this.filePath,
    required this.success,
    this.errorMessage,
  });
}

abstract class ObsidianExportService {
  Future<ObsidianExportResult> export(ObsidianExportRequest request);
  Future<bool> openInObsidian(String filePath);
}