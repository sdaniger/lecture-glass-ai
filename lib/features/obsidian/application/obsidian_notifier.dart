import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../summary/domain/topic.dart';
import '../../summary/domain/lecture_summary.dart';
import '../data/obsidian_export_service.dart';
import '../data/file_permission_service.dart';
import '../domain/obsidian_export_service_interface.dart';
import 'obsidian_state.dart';

final obsidianStateProvider =
    StateNotifierProvider<ObsidianNotifier, ObsidianState>((ref) {
  return ObsidianNotifier(ref);
});

class ObsidianNotifier extends StateNotifier<ObsidianState> {
  final Ref _ref;

  ObsidianNotifier(this._ref) : super(const ObsidianState());

  Future<String?> pickVaultFolder() async {
    final permissionService = _ref.read(filePermissionServiceProvider);
    final path = await permissionService.pickFolder();
    if (path != null) {
      state = state.copyWith(vaultPath: path);
    }
    return path;
  }

  void setEnabled(bool value) {
    state = state.copyWith(isEnabled: value);
  }

  void setAutoExport(bool value) {
    state = state.copyWith(autoExport: value);
  }

  void setOpenAfterExport(bool value) {
    state = state.copyWith(openAfterExport: value);
  }

  void setExistingFileBehavior(String value) {
    state = state.copyWith(existingFileBehavior: value);
  }

  void setFolderName(String value) {
    state = state.copyWith(folderName: value);
  }

  Future<ObsidianExportResult> testExport() async {
    final exportService = _ref.read(obsidianExportServiceProvider);
    final result = await exportService.export(
      ObsidianExportRequest(
        vaultPath: state.vaultPath ?? '',
        title: 'テスト出力',
        date: DateTime.now(),
        overallSummary: 'これはテスト出力です。',
        existingFileBehavior: ExistingFileBehavior.overwrite,
        openAfterExport: false,
      ),
    );
    if (result.success) {
      state = state.copyWith(lastExportDate: DateTime.now());
    }
    return result;
  }

  Future<ObsidianExportResult> exportLecture({
    required String title,
    required DateTime date,
    required String overallSummary,
    required List<Topic> topics,
    required List<String> reviewPoints,
    required List<String> examPoints,
    required List<KeywordExplanation> keywords,
    required String transcript,
  }) async {
    if (!state.isEnabled || state.vaultPath == null) {
      return const ObsidianExportResult(
        filePath: '',
        success: false,
        errorMessage: 'Obsidian連携が設定されていません',
      );
    }

    final exportService = _ref.read(obsidianExportServiceProvider);
    final behavior = switch (state.existingFileBehavior) {
      'append' => ExistingFileBehavior.append,
      'skip' => ExistingFileBehavior.skip,
      _ => ExistingFileBehavior.overwrite,
    };

    final result = await exportService.export(
      ObsidianExportRequest(
        vaultPath: state.vaultPath!,
        folderName: state.folderName,
        title: title,
        date: date,
        overallSummary: overallSummary,
        topics: topics,
        reviewPoints: reviewPoints,
        examPoints: examPoints,
        keywords: keywords,
        transcript: transcript,
        existingFileBehavior: behavior,
        openAfterExport: state.openAfterExport,
      ),
    );

    if (result.success) {
      state = state.copyWith(lastExportDate: DateTime.now());
    }

    return result;
  }
}