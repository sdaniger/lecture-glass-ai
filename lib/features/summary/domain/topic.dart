class Topic {
  final int id;
  final String? remoteId;
  final int lectureId;
  final double startSeconds;
  final double endSeconds;
  final String title;
  final String summary;
  final int importance;
  final List<String> keywords;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Topic({
    required this.id,
    this.remoteId,
    required this.lectureId,
    required this.startSeconds,
    required this.endSeconds,
    required this.title,
    required this.summary,
    this.importance = 3,
    this.keywords = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  String get formattedRange {
    final sM = (startSeconds ~/ 60).toInt();
    final sS = (startSeconds % 60).toInt();
    final eM = (endSeconds ~/ 60).toInt();
    final eS = (endSeconds % 60).toInt();
    return '${sM.toString().padLeft(2, '0')}:${sS.toString().padLeft(2, '0')} - ${eM.toString().padLeft(2, '0')}:${eS.toString().padLeft(2, '0')}';
  }

  Topic copyWith({
    int? id,
    String? remoteId,
    int? lectureId,
    double? startSeconds,
    double? endSeconds,
    String? title,
    String? summary,
    int? importance,
    List<String>? keywords,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Topic(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      lectureId: lectureId ?? this.lectureId,
      startSeconds: startSeconds ?? this.startSeconds,
      endSeconds: endSeconds ?? this.endSeconds,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      importance: importance ?? this.importance,
      keywords: keywords ?? this.keywords,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
