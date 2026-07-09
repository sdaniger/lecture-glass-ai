import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../domain/recording_service_interface.dart';
import '../data/recording_service.dart';
import '../../lectures/domain/lecture.dart';
import '../../lectures/data/lecture_repository.dart';

final recordingNotifierProvider =
    NotifierProvider<RecordingNotifier, RecordingUIState>(
  RecordingNotifier.new,
);

class RecordingUIState {
  final RecordingState recordingState;
  final Duration elapsed;
  final String? filePath;
  final String title;
  final int? lectureId;
  final bool isSaving;

  const RecordingUIState({
    this.recordingState = RecordingState.idle,
    this.elapsed = Duration.zero,
    this.filePath,
    this.title = '',
    this.lectureId,
    this.isSaving = false,
  });

  RecordingUIState copyWith({
    RecordingState? recordingState,
    Duration? elapsed,
    String? filePath,
    String? title,
    int? lectureId,
    bool? isSaving,
  }) {
    return RecordingUIState(
      recordingState: recordingState ?? this.recordingState,
      elapsed: elapsed ?? this.elapsed,
      filePath: filePath ?? this.filePath,
      title: title ?? this.title,
      lectureId: lectureId ?? this.lectureId,
      isSaving: isSaving ?? this.isSaving,
    );
  }
}

class RecordingNotifier extends Notifier<RecordingUIState> {
  StreamSubscription<RecordingState>? _stateSub;
  StreamSubscription<Duration>? _elapsedSub;

  @override
  RecordingUIState build() {
    final service = ref.watch(recordingServiceProvider);
    _stateSub = service.watchState().listen((s) {
      state = state.copyWith(recordingState: s);
    });
    _elapsedSub = service.watchElapsed().listen((d) {
      state = state.copyWith(elapsed: d);
    });
    ref.onDispose(() {
      _stateSub?.cancel();
      _elapsedSub?.cancel();
    });
    return const RecordingUIState();
  }

  void setTitle(String t) => state = state.copyWith(title: t);

  Future<void> startRecording() async {
    final dir = await getApplicationDocumentsDirectory();
    final audioDir = Directory('${dir.path}/recordings');
    if (!await audioDir.exists()) await audioDir.create(recursive: true);

    final path = '${audioDir.path}/${const Uuid().v4()}.wav';
    final service = ref.read(recordingServiceProvider);
    await service.startRecording(outputPath: path);
  }

  Future<void> stopRecordingAndSave() async {
    final service = ref.read(recordingServiceProvider);
    final path = await service.stopRecording();
    if (path == null) return;

    state = state.copyWith(filePath: path, isSaving: true);

    try {
      final lectureRepo = ref.read(lectureRepositoryProvider);
      final lecture = await lectureRepo.create(Lecture(
        id: 0,
        title: state.title.isEmpty ? '録音講義 ${DateTime.now().toString().substring(0, 16)}' : state.title,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deviceId: 'local',
        audioPath: path,
        durationSeconds: state.elapsed.inSeconds.toDouble(),
        transcriptionStatus: 'notStarted',
      ));
      state = state.copyWith(lectureId: lecture.id, isSaving: false);
    } on Exception {
      state = state.copyWith(isSaving: false);
      rethrow;
    }
    await cancel();
  }

  Future<void> cancel() async {
    final service = ref.read(recordingServiceProvider);
    await service.cancelRecording();
    state = const RecordingUIState();
  }
}
