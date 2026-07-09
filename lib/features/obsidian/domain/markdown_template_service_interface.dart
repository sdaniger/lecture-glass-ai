import '../../summary/domain/topic.dart';
import '../../summary/domain/lecture_summary.dart';

abstract class MarkdownTemplateService {
  String generateLectureNote({
    required String title,
    required DateTime date,
    required String overallSummary,
    required List<Topic> topics,
    required List<String> reviewPoints,
    required List<String> examPoints,
    required List<KeywordExplanation> keywords,
    required String transcript,
  });
}

class DefaultMarkdownTemplate implements MarkdownTemplateService {
  @override
  String generateLectureNote({
    required String title,
    required DateTime date,
    required String overallSummary,
    required List<Topic> topics,
    required List<String> reviewPoints,
    required List<String> examPoints,
    required List<KeywordExplanation> keywords,
    required String transcript,
  }) {
    final dateStr =
        '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

    final topicsTable = topics.isNotEmpty
        ? topics
            .map((t) => '| ${t.formattedRange} | ${t.title} | ${t.importance} | ${t.summary} |')
            .join('\n')
        : '| - | - | - | - |';

    final reviewBullets = reviewPoints.isNotEmpty
        ? reviewPoints.map((p) => '- $p').join('\n')
        : '- なし';

    final examBullets = examPoints.isNotEmpty
        ? examPoints.map((p) => '- $p').join('\n')
        : '- なし';

    final keywordSection = keywords.isNotEmpty
        ? keywords
            .map((k) => '- **${k.word}**: ${k.explanation}')
            .join('\n')
        : '- なし';

    return '''---
type: lecture
title: $title
date: $dateStr
source: LectureGlass AI
tags:
  - 大学
  - 講義
---

# $title

## 全体要約

$overallSummary

## 重要話題表

| 時間 | 話題 | 重要度 | 要約 |
|---|---:|---:|---|
$topicsTable

## 復習ポイント

$reviewBullets

## 試験に出そうなポイント

$examBullets

## キーワード

$keywordSection

## 文字起こし

$transcript
''';
  }
}