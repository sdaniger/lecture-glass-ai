class TranscriptSegment {
  final int id;
  final String? remoteId;
  final int lectureId;
  final double startSeconds;
  final double endSeconds;
  final String text;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TranscriptSegment({
    required this.id,
    this.remoteId,
    required this.lectureId,
    required this.startSeconds,
    required this.endSeconds,
    required this.text,
    required this.createdAt,
    required this.updatedAt,
  });

  String get formattedStart {
    final m = (startSeconds ~/ 60).toInt();
    final s = (startSeconds % 60).toInt();
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  String get formattedEnd {
    final m = (endSeconds ~/ 60).toInt();
    final s = (endSeconds % 60).toInt();
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }
}
