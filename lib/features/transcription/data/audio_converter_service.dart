import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_min_gpl/return_code.dart';
import 'package:uuid/uuid.dart';
import '../../../core/errors.dart';
import '../../../core/logger.dart';

final audioConverterServiceProvider = Provider<AudioConverterService>((ref) {
  return AudioConverterServiceImpl();
});

abstract class AudioConverterService {
  Future<String> convertToWav(String sourcePath);
}

class AudioConverterServiceImpl implements AudioConverterService {
  final _uuid = const Uuid();

  @override
  Future<String> convertToWav(String sourcePath) async {
    try {
      final sourceFile = File(sourcePath);
      if (!await sourceFile.exists()) {
        throw AudioConversionError('音声ファイルが見つかりません: $sourcePath');
      }

      final wavDir = Directory(
          '${sourceFile.parent.path}${Platform.pathSeparator}wav');
      if (!await wavDir.exists()) {
        await wavDir.create(recursive: true);
      }

      final wavName = '${_uuid.v4()}.wav';
      final wavPath =
          '${wavDir.path}${Platform.pathSeparator}$wavName';

      // Convert to 16kHz mono 16-bit PCM WAV
      final command =
          '-i "$sourcePath" -ar 16000 -ac 1 -sample_fmt s16 "$wavPath"';

      final session = await FFmpegKit.execute(command);
      final returnCode = await session.getReturnCode();

      if (!ReturnCode.isSuccess(returnCode)) {
        final logs = await session.getAllLogsAsString();
        AppLogger.e('FFmpeg conversion failed: $logs');
        throw AudioConversionError(
            '音声変換に失敗しました。対応していない形式かもしれません。');
      }

      AppLogger.i('Audio converted to WAV: $wavPath');
      return wavPath;
    } catch (e) {
      AppLogger.e('Failed to convert audio', e);
      if (e is AppError) rethrow;
      throw AudioConversionError('音声変換に失敗しました: $e');
    }
  }
}