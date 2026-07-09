import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import '../../../core/platform/platform_info.dart';
import '../../../core/logger.dart';
import '../domain/file_permission_service_interface.dart';

final filePermissionServiceProvider = Provider<FilePermissionService>((ref) {
  return FilePermissionServiceImpl();
});

class FilePermissionServiceImpl implements FilePermissionService {
  @override
  Future<String?> pickFolder() async {
    try {
      final result = await FilePicker.platform.getDirectoryPath();
      return result;
    } catch (e) {
      AppLogger.e('Failed to pick folder', e);
      return null;
    }
  }

  @override
  Future<bool> hasWritePermission(String path) async {
    try {
      if (PlatformInfo.isWindows) {
        final dir = Directory(path);
        return await dir.exists();
      }
      // Android: SAF handles permissions differently
      final dir = Directory(path);
      return await dir.exists();
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> requestWritePermission(String path) async {
    // On modern Android (API 30+), SAF provides access.
    // On Windows, filesystem access is generally unrestricted.
    try {
      final dir = Directory(path);
      if (!await dir.exists()) {
        await dir.create(recursive: true);
      }
      return true;
    } catch (e) {
      AppLogger.e('Failed to request permission', e);
      return false;
    }
  }
}