import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/logger.dart';
import '../domain/transcript_segment.dart';
import '../domain/transcription_service_interface.dart';

final liveTranscriptionServiceProvider =
    Provider<LiveTranscriptionService>((ref) {
  return StubLiveTranscriptionService();
});

class StubLiveTranscriptionService implements LiveTranscriptionService {
  @override
  Stream<List<TranscriptSegment>> transcribeLive({
    required String audioPath,
    required int lectureId,
    required double totalDurationSeconds,
  }) async* {
    AppLogger.i('Live transcription stub started: $audioPath');

    final dummyText = [
      '今日は前回の復習から始めます。',
      'まず、AND演算の復習です。',
      '次に、OR演算です。',
      'NOT演算は入力を反転します。',
      'これらの基本ゲートを組み合わせます。',
      '今日の本題に入ります。',
      'ANDゲートの真理値表を見ていきます。',
      'A=0, B=0 のとき出力は0です。',
      'A=1, B=1 のときだけ出力が1です。',
      '同様にORゲートも覚えておきましょう。',
    ];

    final segmentDuration = totalDurationSeconds / dummyText.length;
    final accumulated = <TranscriptSegment>[];

    for (var i = 0; i < dummyText.length; i++) {
      await Future.delayed(Duration(milliseconds: (segmentDuration * 1000).toInt()));
      final seg = TranscriptSegment(
        id: i,
        lectureId: lectureId,
        startSeconds: i * segmentDuration,
        endSeconds: (i + 1) * segmentDuration,
        text: dummyText[i],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      accumulated.add(seg);
      yield List.from(accumulated);
    }

    AppLogger.i('Live transcription stub completed');
  }
}
