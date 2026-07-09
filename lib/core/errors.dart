sealed class AppError {
  const AppError();
  String get message;
}

final class AudioFileError extends AppError {
  final String details;
  const AudioFileError(this.details);
  @override
  String get message => '音声ファイルエラー: $details';
}

final class AudioConversionError extends AppError {
  final String details;
  const AudioConversionError(this.details);
  @override
  String get message => '音声変換エラー: $details';
}

final class RecordingError extends AppError {
  final String details;
  const RecordingError(this.details);
  @override
  String get message => '録音エラー: $details';
}

final class TranscriptionError extends AppError {
  final String details;
  const TranscriptionError(this.details);
  @override
  String get message => '文字起こしエラー: $details';
}

final class WhisperModelError extends AppError {
  final String details;
  const WhisperModelError(this.details);
  @override
  String get message => 'Whisperモデルエラー: $details';
}

final class ApiKeyNotSetError extends AppError {
  const ApiKeyNotSetError();
  @override
  String get message => 'APIキーが設定されていません。設定画面からAPIキーを入力してください。';
}

final class AiApiError extends AppError {
  final String details;
  const AiApiError(this.details);
  @override
  String get message => 'AI APIエラー: $details';
}

final class JsonParseError extends AppError {
  final String details;
  const JsonParseError(this.details);
  @override
  String get message => 'JSONパースエラー: $details';
}

final class SyncError extends AppError {
  final String details;
  const SyncError(this.details);
  @override
  String get message => '同期エラー: $details';
}

final class ObsidianExportError extends AppError {
  final String details;
  const ObsidianExportError(this.details);
  @override
  String get message => 'Obsidian出力エラー: $details';
}

final class PermissionError extends AppError {
  final String details;
  const PermissionError(this.details);
  @override
  String get message => '権限エラー: $details';
}

final class DatabaseError extends AppError {
  final String details;
  const DatabaseError(this.details);
  @override
  String get message => 'データベースエラー: $details';
}

final class UnknownError extends AppError {
  final String details;
  const UnknownError(this.details);
  @override
  String get message => '予期しないエラー: $details';
}
