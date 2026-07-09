class Lecture {
  final int id;
  final String? remoteId;
  final String title;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String deviceId;
  final int version;
  final String? audioPath;
  final String? wavPath;
  final double? durationSeconds;
  final String transcriptionStatus;
  final String summaryStatus;
  final String obsidianExportStatus;

  const Lecture({
    required this.id,
    this.remoteId,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.syncStatus = 'localOnly',
    this.deviceId = '',
    this.version = 1,
    this.audioPath,
    this.wavPath,
    this.durationSeconds,
    this.transcriptionStatus = 'notStarted',
    this.summaryStatus = 'notStarted',
    this.obsidianExportStatus = 'notExported',
  });

  String get formattedDuration {
    if (durationSeconds == null) return '--:--';
    final minutes = durationSeconds! ~/ 60;
    final seconds = (durationSeconds! % 60).toInt();
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  Lecture copyWith({
    int? id,
    String? remoteId,
    String? title,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    String? syncStatus,
    String? deviceId,
    int? version,
    String? audioPath,
    String? wavPath,
    double? durationSeconds,
    String? transcriptionStatus,
    String? summaryStatus,
    String? obsidianExportStatus,
  }) {
    return Lecture(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      deviceId: deviceId ?? this.deviceId,
      version: version ?? this.version,
      audioPath: audioPath ?? this.audioPath,
      wavPath: wavPath ?? this.wavPath,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      transcriptionStatus: transcriptionStatus ?? this.transcriptionStatus,
      summaryStatus: summaryStatus ?? this.summaryStatus,
      obsidianExportStatus: obsidianExportStatus ?? this.obsidianExportStatus,
    );
  }
}