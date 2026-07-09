import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors.dart';
import '../../../core/logger.dart';
import '../../settings/data/llm_settings_repository.dart';
import '../../settings/domain/llm_provider.dart';
import '../../settings/domain/llm_settings.dart';
import '../domain/ai_summary_service_interface.dart';
import '../domain/lecture_summary.dart';
import '../domain/topic.dart';

final aiSummaryServiceProvider = Provider<AiSummaryService>((ref) {
  return ProviderAwareSummaryService(
    ref.watch(llmSettingsRepositoryProvider),
  );
});

class ProviderAwareSummaryService implements AiSummaryService {
  final LlmSettingsRepository _settingsRepository;
  final Dio _dio = Dio();

  ProviderAwareSummaryService(this._settingsRepository);

  @override
  Future<SummaryResult> generateSummary(AiSummaryRequest request) async {
    final settings = await _settingsRepository.load();
    AppLogger.i('Generating summary with ${settings.provider.label}');

    return switch (settings.provider) {
      LlmProvider.gemini => _generateWithGemini(request, settings),
      LlmProvider.groq || LlmProvider.openRouter || LlmProvider.m365Proxy =>
        _generateWithOpenAiCompatible(request, settings),
    };
  }

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

  Future<SummaryResult> _generateWithOpenAiCompatible(
    AiSummaryRequest request,
    LlmSettings settings,
  ) async {
    final apiKey = settings.apiKey.trim();
    if (apiKey.isEmpty) {
      throw const ApiKeyNotSetError();
    }

    final baseUrl = settings.resolvedBaseUrl;
    final model = settings.resolvedModelName;
    final prompt = _buildPrompt(request.lectureTitle, request.segments);

    final headers = <String, String>{
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    };

    if (settings.provider == LlmProvider.openRouter) {
      headers['HTTP-Referer'] = 'https://lectureglass.local';
      headers['X-Title'] = 'LectureGlass AI';
    }

    final response = await _dio.post(
      '$baseUrl/chat/completions',
      options: Options(headers: headers),
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
      throw const AiApiError('APIからの応答が空でした');
    }

    return _parseResult(jsonDecode(content) as Map<String, dynamic>);
  }

  Future<SummaryResult> _generateWithGemini(
    AiSummaryRequest request,
    LlmSettings settings,
  ) async {
    final apiKey = settings.apiKey.trim();
    if (apiKey.isEmpty) {
      throw const ApiKeyNotSetError();
    }

    final model = settings.resolvedModelName;
    final prompt = _buildPrompt(request.lectureTitle, request.segments);
    final baseUrl = settings.resolvedBaseUrl;
    final endpoint = '$baseUrl/models/$model:generateContent?key=$apiKey';

    final response = await _dio.post(
      endpoint,
      options: Options(headers: const {
        'Content-Type': 'application/json',
      }),
      data: {
        'contents': [
          {
            'role': 'user',
            'parts': [
              {'text': prompt},
            ],
          },
        ],
        'generationConfig': {
          'temperature': 0.3,
          'responseMimeType': 'application/json',
        },
      },
    );

    final data = response.data as Map<String, dynamic>;
    final candidates = data['candidates'] as List<dynamic>? ?? const [];
    if (candidates.isEmpty) {
      throw const AiApiError('Geminiからの応答が空でした');
    }

    final content = candidates.first as Map<String, dynamic>;
    final parts = ((content['content'] as Map<String, dynamic>?)?['parts']
            as List<dynamic>?)
        ?.map((part) => (part as Map<String, dynamic>)['text']?.toString() ?? '')
        .where((text) => text.isNotEmpty)
        .toList() ??
        const [];

    final jsonText = parts.join().trim();
    if (jsonText.isEmpty) {
      throw const AiApiError('Gemini応答の本文が空でした');
    }

    return _parseResult(jsonDecode(jsonText) as Map<String, dynamic>);
  }

  SummaryResult _parseResult(Map<String, dynamic> json) {
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
              const [],
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
        reviewPoints: rawReviewPoints.map((e) => e.toString()).toList(),
        examPoints: rawExamPoints.map((e) => e.toString()).toList(),
        keywords: keywords,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      return SummaryResult(summary: summary, topics: topics);
    } catch (e) {
      AppLogger.e('Failed to parse AI response', e);
      throw const JsonParseError('要約結果のパースに失敗しました');
    }
  }
}
