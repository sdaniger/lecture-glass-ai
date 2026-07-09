import 'package:flutter/foundation.dart';

sealed class AppLogger {
  static void d(String message) {
    debugPrint('[LG][Debug] $message');
  }

  static void i(String message) {
    debugPrint('[LG][Info] $message');
  }

  static void w(String message) {
    debugPrint('[LG][Warning] $message');
  }

  static void e(String message, [Object? error, StackTrace? stackTrace]) {
    debugPrint('[LG][Error] $message');
    if (error != null) debugPrint('  Error: $error');
    if (stackTrace != null) debugPrint('  StackTrace: $stackTrace');
  }
}
