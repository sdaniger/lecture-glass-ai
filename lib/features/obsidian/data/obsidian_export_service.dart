import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/errors.dart';
import '../../../core/logger.dart';
import '../domain/markdown_template_service_interface.dart';
import '../domain/obsidian_export_service_interface.dart';

final obsidianExportServiceProvider = Provider<ObsidianExportService>((ref) {
  final templateService = ref.watch(markdownTemplateServiceProvider);
  return ObsidianExportServiceImpl(templateService);
});

final markdownTemplateServiceProvider = Provider<MarkdownTemplateService>((ref) {
  return DefaultMarkdownTemplate();
});

class ObsidianExportServiceImpl implements ObsidianExportService {
  final MarkdownTemplateService _templateService;

  ObsidianExportServiceImpl(this._templateService);

  @override
  Future<ObsidianExportResult> export(ObsidianExportRequest request) async {
    try {
      final dateStr =
          '${request.date.year}-${request.date.month.toString().padLeft(2, '0')}-${request.date.day.toString().padLeft(2, '0')}';
      final sanitizedTitle =
          request.title.replaceAll(RegExp(r'[/\\?%*:|"<>]'), '_');
      final fileName = '${dateStr}_$sanitizedTitle.md';

      final vaultDir = Directory(request.vaultPath);
      if (!await vaultDir.exists()) {
        throw ObsidianExportError('Vaultフォルダが見つかりません: ${request.vaultPath}');
      }

      final targetDir = Directory(
          '${request.vaultPath}${Platform.pathSeparator}${request.folderName}');
      if (!await targetDir.exists()) {
        await targetDir.create(recursive: true);
      }

      final filePath =
          '${targetDir.path}${Platform.pathSeparator}$fileName';
      final file = File(filePath);

      // Handle existing file
      if (await file.exists()) {
        switch (request.existingFileBehavior) {
          case ExistingFileBehavior.skip:
            AppLogger.i('Existing file skipped: $filePath');
            return ObsidianExportResult(
              filePath: filePath,
              success: false,
              errorMessage: 'ファイルが既に存在するためスキップしました',
            );
          case ExistingFileBehavior.append:
            final existing = await file.readAsString();
            final content = _templateService.generateLectureNote(
              title: request.title,
              date: request.date,
              overallSummary: request.overallSummary,
              topics: request.topics,
              reviewPoints: request.reviewPoints,
              examPoints: request.examPoints,
              keywords: request.keywords,
              transcript: request.transcript,
            );
            await file.writeAsString('$existing\n\n$content');
            break;
          case ExistingFileBehavior.overwrite:
            await _writeFile(file, request);
            break;
        }
      } else {
        await _writeFile(file, request);
      }

      AppLogger.i('Obsidian export completed: $filePath');

      if (request.openAfterExport) {
        await openInObsidian(filePath);
      }

      return ObsidianExportResult(
        filePath: filePath,
        success: true,
      );
    } catch (e) {
      AppLogger.e('Obsidian export failed', e);
      return ObsidianExportResult(
        filePath: '',
        success: false,
        errorMessage: e is AppError
            ? e.message
            : 'Obsidian出力に失敗しました: $e',
      );
    }
  }

  Future<void> _writeFile(File file, ObsidianExportRequest request) async {
    final content = _templateService.generateLectureNote(
      title: request.title,
      date: request.date,
      overallSummary: request.overallSummary,
      topics: request.topics,
      reviewPoints: request.reviewPoints,
      examPoints: request.examPoints,
      keywords: request.keywords,
      transcript: request.transcript,
    );
    await file.writeAsString(content);
  }

  @override
  Future<bool> openInObsidian(String filePath) async {
    try {
      final encodedPath = Uri.encodeComponent(filePath);
      final uri = Uri.parse('obsidian://open?path=$encodedPath');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
        return true;
      }
      return false;
    } catch (e) {
      AppLogger.e('Failed to open Obsidian', e);
      return false;
    }
  }
}