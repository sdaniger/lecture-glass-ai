import '../../lectures/domain/lecture.dart';
import '../../transcription/domain/transcript_segment.dart';
import '../../summary/domain/topic.dart';
import '../../summary/domain/lecture_summary.dart';

abstract class RemoteLectureRepository {
  Future<void> connect({required String url, required String publishableKey});
  Future<void> disconnect();
  bool get isConnected;

  Future<void> uploadLecture(Lecture lecture);
  Future<void> updateLecture(Lecture lecture);
  Future<void> deleteLecture(String remoteId);
  Future<List<Lecture>> fetchLectures({
    required String deviceId,
    required DateTime since,
  });

  Future<void> uploadSegments(List<TranscriptSegment> segments);
  Future<List<TranscriptSegment>> fetchSegments({
    required String lectureRemoteId,
    required DateTime since,
  });

  Future<void> uploadTopics(List<Topic> topics);
  Future<List<Topic>> fetchTopics({
    required String lectureRemoteId,
    required DateTime since,
  });

  Future<void> uploadSummary(LectureSummary summary);
  Future<LectureSummary?> fetchSummary({
    required String lectureRemoteId,
    required DateTime since,
  });
}
