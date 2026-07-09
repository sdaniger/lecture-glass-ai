import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../lectures/data/lecture_repository.dart';
import '../../transcription/data/transcript_repository.dart';
import '../../summary/data/topic_repository.dart';
import '../domain/search_service_interface.dart';

final searchServiceProvider = Provider<SearchService>((ref) {
  return SearchServiceImpl(
    lectureRepository: ref.watch(lectureRepositoryProvider),
    transcriptRepository: ref.watch(transcriptRepositoryProvider),
    topicRepository: ref.watch(topicRepositoryProvider),
  );
});

class SearchServiceImpl implements SearchService {
  final LectureRepository _lectures;
  final TranscriptRepository _transcripts;
  final TopicRepository _topics;

  SearchServiceImpl({
    required LectureRepository lectureRepository,
    required TranscriptRepository transcriptRepository,
    required TopicRepository topicRepository,
  })  : _lectures = lectureRepository,
        _transcripts = transcriptRepository,
        _topics = topicRepository;

  @override
  Future<List<SearchResult>> search(String query) async {
    if (query.trim().isEmpty) return [];
    final results = <SearchResult>[];
    final lowerQuery = query.toLowerCase();

    // 講義タイトル検索
    final lectures = await _lectures.search(query);
    for (final l in lectures) {
      results.add(SearchResult(
        lectureId: l.id,
        lectureTitle: l.title,
        source: 'lecture',
      ));
    }

    // 文字起こし全文検索（全講義を走査）
    final allLectures = await _lectures.getAll();
    for (final l in allLectures) {
      final segments = await _transcripts.getByLectureId(l.id);
      for (final seg in segments) {
        if (seg.text.toLowerCase().contains(lowerQuery)) {
          results.add(SearchResult(
            lectureId: l.id,
            lectureTitle: l.title,
            matchStartSeconds: seg.startSeconds,
            matchedText: seg.text,
            source: 'transcript',
          ));
        }
      }

      // 話題表検索
      final topics = await _topics.getByLectureId(l.id);
      for (final t in topics) {
        if (t.title.toLowerCase().contains(lowerQuery) ||
            t.summary.toLowerCase().contains(lowerQuery)) {
          results.add(SearchResult(
            lectureId: l.id,
            lectureTitle: l.title,
            matchStartSeconds: t.startSeconds,
            matchedText: '${t.title}: ${t.summary}',
            source: 'topic',
          ));
        }
      }
    }

    return results;
  }
}
