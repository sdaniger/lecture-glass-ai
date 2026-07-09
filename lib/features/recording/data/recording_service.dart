import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:record/record.dart';
import '../../../core/errors.dart';
import '../../../core/logger.dart';
import '../domain/recording_service_interface.dart';

final recordingServiceProvider = Provider<RecordingService>((ref) {
  return RecordingServiceImpl();
});

class RecordingServiceImpl implements RecordingService {
  final _recorder = AudioRecorder();
  RecordingState _state = RecordingState.idle;
  Duration _elapsed = Duration.zero;
  String? _filePath;
  Timer? _timer;

  final _stateController = StreamController<RecordingState>.broadcast();
  final _elapsedController = StreamController<Duration>.broadcast();

  @override
  RecordingState get state => _state;

  @override
  Duration get elapsed => _elapsed;

  @override
  String? get filePath => _filePath;

  @override
  Stream<RecordingState> watchState() => _stateController.stream;

  @override
  Stream<Duration> watchElapsed() => _elapsedController.stream;

  void _setState(RecordingState s) {
    _state = s;
    _stateController.add(s);
  }

  @override
  Future<void> startRecording({required String outputPath}) async {
    if (_state == RecordingState.recording) return;

    try {
      final perm = await hasPermission();
      if (!perm) {
        throw PermissionError('マイクの権限がありません');
      }

      await _recorder.start(
        const RecordConfig(
          encoder: AudioEncoder.wav,
          sampleRate: 16000,
          numChannels: 1,
        ),
        path: outputPath,
      );

      _filePath = outputPath;
      _elapsed = Duration.zero;
      _setState(RecordingState.recording);

      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        _elapsed += const Duration(seconds: 1);
        _elapsedController.add(_elapsed);
      });

      AppLogger.i('Recording started: $outputPath');
    } on Exception catch (e) {
      AppLogger.e('Failed to start recording', e);
      _setState(RecordingState.error);
      if (e is AppError) rethrow;
      throw RecordingError('録音の開始に失敗しました: $e');
    }
  }

  @override
  Future<String?> stopRecording() async {
    if (_state != RecordingState.recording) return null;

    try {
      _timer?.cancel();
      _timer = null;
      final path = await _recorder.stop();
      _setState(RecordingState.completed);
      AppLogger.i('Recording stopped: $path');
      return path;
    } on Exception catch (e) {
      AppLogger.e('Failed to stop recording', e);
      _setState(RecordingState.error);
      return null;
    }
  }

  @override
  Future<void> cancelRecording() async {
    _timer?.cancel();
    _timer = null;
    _elapsed = Duration.zero;
    _filePath = null;
    if (_state == RecordingState.recording) {
      await _recorder.cancel();
    }
    _setState(RecordingState.idle);
  }

  @override
  Future<bool> hasPermission() async {
    return await _recorder.hasPermission();
  }

  void dispose() {
    _timer?.cancel();
    _stateController.close();
    _elapsedController.close();
    _recorder.dispose();
  }
}
