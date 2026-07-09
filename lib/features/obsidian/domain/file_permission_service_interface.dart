abstract class FilePermissionService {
  Future<String?> pickFolder();
  Future<bool> hasWritePermission(String path);
  Future<bool> requestWritePermission(String path);
}
