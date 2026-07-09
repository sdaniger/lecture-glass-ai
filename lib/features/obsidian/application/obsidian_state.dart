class ObsidianState {
  final bool isEnabled;
  final String? vaultPath;
  final String folderName;
  final bool autoExport;
  final String existingFileBehavior;
  final bool openAfterExport;
  final DateTime? lastExportDate;

  const ObsidianState({
    this.isEnabled = false,
    this.vaultPath,
    this.folderName = '大学講義',
    this.autoExport = false,
    this.existingFileBehavior = 'overwrite',
    this.openAfterExport = true,
    this.lastExportDate,
  });

  ObsidianState copyWith({
    bool? isEnabled,
    String? vaultPath,
    String? folderName,
    bool? autoExport,
    String? existingFileBehavior,
    bool? openAfterExport,
    DateTime? lastExportDate,
  }) {
    return ObsidianState(
      isEnabled: isEnabled ?? this.isEnabled,
      vaultPath: vaultPath ?? this.vaultPath,
      folderName: folderName ?? this.folderName,
      autoExport: autoExport ?? this.autoExport,
      existingFileBehavior: existingFileBehavior ?? this.existingFileBehavior,
      openAfterExport: openAfterExport ?? this.openAfterExport,
      lastExportDate: lastExportDate ?? this.lastExportDate,
    );
  }
}
