import 'dart:io';

abstract class PlatformInfo {
  static bool get isAndroid => Platform.isAndroid;
  static bool get isWindows => Platform.isWindows;
  static bool get isDesktop => isWindows;
  static bool get isMobile => isAndroid;
}
