import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/errors.dart';
import '../../../core/logger.dart';
import '../domain/ai_summary_service_interface.dart';
import '../domain/topic.dart';
import '../domain/lecture_summary.dart';

final aiSummaryServiceProvider = Provider<AiSummaryService>((ref) {
  return OpenAiSummaryService();
});

class OpenAiSummaryService implements AiSummaryService {
  final _dio = Dio();

  // Json encode text to avoid escaping issues
  String _buildPrompt(String title, List<ChunkSegment> segments) {
    final segmentsJson = segments
        .map((s) => {
              'start_seconds': s.startSeconds.toInt(),
              'end_seconds': s.endSeconds.toInt(),
              'text': s.text,
            })
        .toList();

    return '''
You are an AI assistant that creates structured lecture summaries in JSON.
Given a lecture transcript, produce the following JSON structure:

{
  "overall_summary": "string",
  "topics": [
    {
      "start_seconds": 0,
      "end_seconds": 0,
      "title": "string",
      "summary": "string",
      "importance": 1-5,
      "keywords": ["string"]
    }
  ],
  "review_points": ["string"],
  "exam_points": ["string"],
  "keywords": [
    {
      "word": "string",
      "explanation": "string"
    }
  ]
}

Lecture title: $title
Transcript segments (JSON):
${jsonEncode(segmentsJson)}
''';
  }

  @override
  Future<SummaryResult> generateSummary(AiSummaryRequest request) async {
    try {
      final apiKey = request.apiKey;
      if (apiKey == null || apiKey.isEmpty) {
        throw ApiKeyNotSetError();
      }

      final baseUrl = request.baseUrl ?? 'https://api.openai.com/v1';
      final model = request.modelName ?? 'gpt-4o-mini';

      final prompt = _buildPrompt(request.lectureTitle, request.segments);

      AppLogger.i('Sending summary request to LLM ($model)...');

      final response = await _dio.post(
        '$baseUrl/chat/completions',
        options: Options(headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        }),
        data: {
          'model': model,
          'messages': [
            {
              'role': 'system',
              'content':
                  'You are a precise JSON generator. Always respond with valid JSON only.',
            },
            {'role': 'user', 'content': prompt},
          ],
          'response_format': {'type': 'json_object'},
          'temperature': 0.3,
        },
      );

      final data = response.data as Map<String, dynamic>;
      final content = data['choices']?[0]?['message']?['content'] as String?;

      if (content == null || content.isEmpty) {
        throw AiApiError('APIからの応答が空でした');
      }

      final parsed = jsonDecode(content) as Map<String, dynamic>;

      return _parseResult(parsed, request.segments);
    } on DioException catch (e) {
      AppLogger.e('API request failed', e);
      throw AiApiError('APIリクエストに失敗しました: ${e.message}');
    } on FormatException catch (e) {
      throw JsonParseError('JSONパースに失敗しました: ${e.message}');
    }
  }

  SummaryResult _parseResult(
      Map<String, dynamic> json, List<ChunkSegment> segments) {
    try {
      final overallSummary =
          json['overall_summary'] as String? ?? '要約を生成できませんでした';
      final rawTopics = json['topics'] as List<dynamic>? ?? [];
      final rawReviewPoints = json['review_points'] as List<dynamic>? ?? [];
      final rawExamPoints = json['exam_points'] as List<dynamic>? ?? [];
      final rawKeywords = json['keywords'] as List<dynamic>? ?? [];

      final topics = rawTopics.asMap().entries.map((entry) {
        final t = entry.value as Map<String, dynamic>;
        return Topic(
          id: -entry.key,
          lectureId: 0,
          startSeconds: (t['start_seconds'] as num?)?.toDouble() ?? 0,
          endSeconds: (t['end_seconds'] as num?)?.toDouble() ?? 0,
          title: t['title'] as String? ?? '',
          summary: t['summary'] as String? ?? '',
          importance: (t['importance'] as num?)?.toInt() ?? 3,
          keywords: (t['keywords'] as List<dynamic>?)
                  ?.map((e) => e.toString())
                  .toList() ??
              [],
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
      }).toList();

      final keywords = rawKeywords.map((k) {
        final kw = k as Map<String, dynamic>;
        return KeywordExplanation(
          word: kw['word'] as String? ?? '',
          explanation: kw['explanation'] as String? ?? '',
        );
      }).toList();

      final summary = LectureSummary(
        id: 0,
        lectureId: 0,
        overallSummary: overallSummary,
        reviewPoints:
            rawReviewPoints.map((e) => e.toString()).toList(),
        examPoints: rawExamPoints.map((e) => e.toString()).toList(),
        keywords: keywords,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      return SummaryResult(summary: summary, topics: topics);
    } catch (e) {
      AppLogger.e('Failed to parse AI response', e);
      throw JsonParseError('要約結果のパースに失敗しました');
    }
  }
}