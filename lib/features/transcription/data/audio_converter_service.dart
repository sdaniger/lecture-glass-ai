import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/errors.dart';
import '../../../core/logger.dart';

final audioConverterServiceProvider = Provider<AudioConverterService>((ref) {
  return AudioConverterServiceImpl();
});

abstract class AudioConverterService {
  Future<String> convertToWav(String sourcePath);
}

class AudioConverterServiceImpl implements AudioConverterService {
  @override
  Future<String> convertToWav(String sourcePath) async {
    final sourceFile = File(sourcePath);
    if (!await sourceFile.exists()) {
      throw AudioConversionError('音声ファイルが見つかりません: $sourcePath');
    }

    final ext = sourcePath.split('.').last.toLowerCase();
    if (ext == 'wav') {
      AppLogger.i('Audio is already WAV: $sourcePath');
      return sourcePath;
    }

    AppLogger.w('WAV conversion not yet available (FFmpeg dependency pending)');
    throw AudioConversionError(
        'WAV以外の形式($ext)の変換は現在対応していません。WAVファイルを選択してください。');
  }
}
