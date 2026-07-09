class LectureSummary {
  final int id;
  final int lectureId;
  final String? remoteId;
  final String overallSummary;
  final List<String> reviewPoints;
  final List<String> examPoints;
  final List<KeywordExplanation> keywords;
  final DateTime createdAt;
  final DateTime updatedAt;

  const LectureSummary({
    required this.id,
    required this.lectureId,
    this.remoteId,
    required this.overallSummary,
    this.reviewPoints = const [],
    this.examPoints = const [],
    this.keywords = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  LectureSummary copyWith({
    int? id,
    int? lectureId,
    String? remoteId,
    String? overallSummary,
    List<String>? reviewPoints,
    List<String>? examPoints,
    List<KeywordExplanation>? keywords,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return LectureSummary(
      id: id ?? this.id,
      lectureId: lectureId ?? this.lectureId,
      remoteId: remoteId ?? this.remoteId,
      overallSummary: overallSummary ?? this.overallSummary,
      reviewPoints: reviewPoints ?? this.reviewPoints,
      examPoints: examPoints ?? this.examPoints,
      keywords: keywords ?? this.keywords,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class KeywordExplanation {
  final String word;
  final String explanation;

  const KeywordExplanation({
    required this.word,
    required this.explanation,
  });
}
