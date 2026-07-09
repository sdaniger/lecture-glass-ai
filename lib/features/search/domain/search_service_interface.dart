class SearchResult {
  final int lectureId;
  final String lectureTitle;
  final double? matchStartSeconds;
  final String? matchedText;
  final String source; // 'lecture' | 'transcript' | 'topic'
  final double relevance;

  const SearchResult({
    required this.lectureId,
    required this.lectureTitle,
    this.matchStartSeconds,
    this.matchedText,
    required this.source,
    this.relevance = 1.0,
  });
}

abstract class SearchService {
  Future<List<SearchResult>> search(String query);
}
