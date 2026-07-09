import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/logger.dart';
import '../domain/transcript_segment.dart';
import '../domain/transcription_service_interface.dart';

final transcriptionServiceProvider =
    Provider<TranscriptionService>((ref) {
  return StubTranscriptionService();
});

class StubTranscriptionService implements TranscriptionService {
  @override
  Future<List<TranscriptSegment>> transcribe({
    required String audioPath,
    required int lectureId,
    String? modelPath,
  }) async {
    AppLogger.i('Stub transcription for: $audioPath');
    AppLogger.w(
        'LocalTranscriptionService: whisper_ggml_plus not available yet. '
        'Returning dummy segments. Implement with whisper_ggml_plus or custom FFI.');

    // Return dummy segments for UI development
    final dummyText = [
      '今日は前回の復習から始めます。前回は2進数と基本的な論理演算について学びました。',
      'まず、AND演算の復習です。AND演算は入力がすべて1のときだけ出力が1になります。',
      '次に、OR演算です。OR演算は入力の少なくとも1つが1なら出力が1になります。',
      'NOT演算は入力を反転します。0を1に、1を0に変換します。',
      'これらの基本ゲートを組み合わせることで、様々な論理回路を実現できます。',
      '今日の本題に入ります。論理ゲートと真理値表について詳しく見ていきます。',
      'ANDゲートの真理値表は、入力Aと入力Bに対して出力がどうなるかを示します。',
      'A=0, B=0のとき出力は0、A=0, B=1のとき出力は0です。',
      'A=1, B=0のとき出力は0、A=1, B=1のときだけ出力が1になります。',
      '同様に、ORゲートとNOTゲートの真理値表も覚えておきましょう。',
      'これらの真理値表は、デジタル回路設計の基礎となります。',
      '実際の回路では、これらのゲートを何百、何千と組み合わせて使います。',
      '論理式から真理値表を作成する練習をしましょう。',
      'まずは簡単な例として、式 Y = A AND B の真理値表を作成します。',
      '次に、式 Y = (A AND B) OR (NOT C) の真理値表に挑戦してみましょう。',
      'このように、複雑な論理式も基本ゲートの組み合わせで表現できます。',
    ];

    final segments = <TranscriptSegment>[];
    for (var i = 0; i < dummyText.length; i++) {
      segments.add(TranscriptSegment(
        id: i,
        lectureId: lectureId,
        startSeconds: i * 15.0,
        endSeconds: (i + 1) * 15.0,
        text: dummyText[i],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ));
    }

    // Simulate processing delay
    await Future.delayed(const Duration(seconds: 2));
    return segments;
  }

  @override
  Future<bool> isModelDownloaded() async {
    // Always false for stub
    return false;
  }

  @override
  Future<void> downloadModel(String modelName) async {
    AppLogger.i('Stub: Model download requested: $modelName');
    AppLogger.w(
        'Real whisper model download not implemented. '
        'Implement with whisper_ggml_plus when available.');
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<List<String>> getAvailableModels() async {
    return [
      'tiny',
      'base',
      'small',
      'medium',
      'large-v3',
    ];
  }
}