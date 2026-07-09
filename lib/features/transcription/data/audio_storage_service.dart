import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import '../../../core/errors.dart';
import '../../../core/logger.dart';

final audioStorageServiceProvider = Provider<AudioStorageService>((ref) {
  return AudioStorageServiceImpl();
});

abstract class AudioStorageService {
  Future<String> copyAudioToAppDir(String sourcePath, String fileName);
  Future<bool> deleteAudio(String path);
  Future<String> getAudioDir();
}

class AudioStorageServiceImpl implements AudioStorageService {
  final _uuid = const Uuid();

  @override
  Future<String> getAudioDir() async {
    final dir = await getApplicationDocumentsDirectory();
    final audioDir = Directory('${dir.path}${Platform.pathSeparator}audio_files');
    if (!await audioDir.exists()) {
      await audioDir.create(recursive: true);
    }
    return audioDir.path;
  }

  @override
  Future<String> copyAudioToAppDir(String sourcePath, String fileName) async {
    try {
      final audioDir = await getAudioDir();
      final extension = fileName.contains('.')
          ? '.${fileName.split('.').last}'
          : '.wav';
      final destName = '${_uuid.v4()}$extension';
      final destPath = '$audioDir${Platform.pathSeparator}$destName';

      final sourceFile = File(sourcePath);
      if (!await sourceFile.exists()) {
        throw AudioFileError('音声ファイルが見つかりません: $sourcePath');
      }

      await sourceFile.copy(destPath);
      AppLogger.i('Audio copied to: $destPath');
      return destPath;
    } catch (e) {
      AppLogger.e('Failed to copy audio', e);
      if (e is AppError) rethrow;
      throw AudioFileError('ファイルコピーに失敗しました: $e');
    }
  }

  @override
  Future<bool> deleteAudio(String path) async {
    try {
      final file = File(path);
      if (await file.exists()) {
        await file.delete();
        AppLogger.i('Audio deleted: $path');
        return true;
      }
      return false;
    } catch (e) {
      AppLogger.e('Failed to delete audio', e);
      return false;
    }
  }
}