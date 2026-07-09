// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $LecturesTable extends Lectures with TableInfo<$LecturesTable, Lecture> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LecturesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('localOnly'));
  static const VerificationMeta _deviceIdMeta =
      const VerificationMeta('deviceId');
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
      'device_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _audioPathMeta =
      const VerificationMeta('audioPath');
  @override
  late final GeneratedColumn<String> audioPath = GeneratedColumn<String>(
      'audio_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _wavPathMeta =
      const VerificationMeta('wavPath');
  @override
  late final GeneratedColumn<String> wavPath = GeneratedColumn<String>(
      'wav_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _durationSecondsMeta =
      const VerificationMeta('durationSeconds');
  @override
  late final GeneratedColumn<double> durationSeconds = GeneratedColumn<double>(
      'duration_seconds', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _transcriptionStatusMeta =
      const VerificationMeta('transcriptionStatus');
  @override
  late final GeneratedColumn<String> transcriptionStatus =
      GeneratedColumn<String>('transcription_status', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant('notStarted'));
  static const VerificationMeta _summaryStatusMeta =
      const VerificationMeta('summaryStatus');
  @override
  late final GeneratedColumn<String> summaryStatus = GeneratedColumn<String>(
      'summary_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('notStarted'));
  static const VerificationMeta _obsidianExportStatusMeta =
      const VerificationMeta('obsidianExportStatus');
  @override
  late final GeneratedColumn<String> obsidianExportStatus =
      GeneratedColumn<String>('obsidian_export_status', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant('notExported'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        remoteId,
        title,
        createdAt,
        updatedAt,
        deletedAt,
        syncStatus,
        deviceId,
        version,
        audioPath,
        wavPath,
        durationSeconds,
        transcriptionStatus,
        summaryStatus,
        obsidianExportStatus
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lectures';
  @override
  VerificationContext validateIntegrity(Insertable<Lecture> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta));
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('audio_path')) {
      context.handle(_audioPathMeta,
          audioPath.isAcceptableOrUnknown(data['audio_path']!, _audioPathMeta));
    }
    if (data.containsKey('wav_path')) {
      context.handle(_wavPathMeta,
          wavPath.isAcceptableOrUnknown(data['wav_path']!, _wavPathMeta));
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
          _durationSecondsMeta,
          durationSeconds.isAcceptableOrUnknown(
              data['duration_seconds']!, _durationSecondsMeta));
    }
    if (data.containsKey('transcription_status')) {
      context.handle(
          _transcriptionStatusMeta,
          transcriptionStatus.isAcceptableOrUnknown(
              data['transcription_status']!, _transcriptionStatusMeta));
    }
    if (data.containsKey('summary_status')) {
      context.handle(
          _summaryStatusMeta,
          summaryStatus.isAcceptableOrUnknown(
              data['summary_status']!, _summaryStatusMeta));
    }
    if (data.containsKey('obsidian_export_status')) {
      context.handle(
          _obsidianExportStatusMeta,
          obsidianExportStatus.isAcceptableOrUnknown(
              data['obsidian_export_status']!, _obsidianExportStatusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Lecture map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Lecture(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      deviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_id'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      audioPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}audio_path']),
      wavPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}wav_path']),
      durationSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}duration_seconds']),
      transcriptionStatus: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}transcription_status'])!,
      summaryStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}summary_status'])!,
      obsidianExportStatus: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}obsidian_export_status'])!,
    );
  }

  @override
  $LecturesTable createAlias(String alias) {
    return $LecturesTable(attachedDatabase, alias);
  }
}

class Lecture extends DataClass implements Insertable<Lecture> {
  final int id;
  final String? remoteId;
  final String title;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String deviceId;
  final int version;
  final String? audioPath;
  final String? wavPath;
  final double? durationSeconds;
  final String transcriptionStatus;
  final String summaryStatus;
  final String obsidianExportStatus;
  const Lecture(
      {required this.id,
      this.remoteId,
      required this.title,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt,
      required this.syncStatus,
      required this.deviceId,
      required this.version,
      this.audioPath,
      this.wavPath,
      this.durationSeconds,
      required this.transcriptionStatus,
      required this.summaryStatus,
      required this.obsidianExportStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['title'] = Variable<String>(title);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['device_id'] = Variable<String>(deviceId);
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || audioPath != null) {
      map['audio_path'] = Variable<String>(audioPath);
    }
    if (!nullToAbsent || wavPath != null) {
      map['wav_path'] = Variable<String>(wavPath);
    }
    if (!nullToAbsent || durationSeconds != null) {
      map['duration_seconds'] = Variable<double>(durationSeconds);
    }
    map['transcription_status'] = Variable<String>(transcriptionStatus);
    map['summary_status'] = Variable<String>(summaryStatus);
    map['obsidian_export_status'] = Variable<String>(obsidianExportStatus);
    return map;
  }

  LecturesCompanion toCompanion(bool nullToAbsent) {
    return LecturesCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      title: Value(title),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      deviceId: Value(deviceId),
      version: Value(version),
      audioPath: audioPath == null && nullToAbsent
          ? const Value.absent()
          : Value(audioPath),
      wavPath: wavPath == null && nullToAbsent
          ? const Value.absent()
          : Value(wavPath),
      durationSeconds: durationSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(durationSeconds),
      transcriptionStatus: Value(transcriptionStatus),
      summaryStatus: Value(summaryStatus),
      obsidianExportStatus: Value(obsidianExportStatus),
    );
  }

  factory Lecture.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Lecture(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      title: serializer.fromJson<String>(json['title']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      version: serializer.fromJson<int>(json['version']),
      audioPath: serializer.fromJson<String?>(json['audioPath']),
      wavPath: serializer.fromJson<String?>(json['wavPath']),
      durationSeconds: serializer.fromJson<double?>(json['durationSeconds']),
      transcriptionStatus:
          serializer.fromJson<String>(json['transcriptionStatus']),
      summaryStatus: serializer.fromJson<String>(json['summaryStatus']),
      obsidianExportStatus:
          serializer.fromJson<String>(json['obsidianExportStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String?>(remoteId),
      'title': serializer.toJson<String>(title),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'deviceId': serializer.toJson<String>(deviceId),
      'version': serializer.toJson<int>(version),
      'audioPath': serializer.toJson<String?>(audioPath),
      'wavPath': serializer.toJson<String?>(wavPath),
      'durationSeconds': serializer.toJson<double?>(durationSeconds),
      'transcriptionStatus': serializer.toJson<String>(transcriptionStatus),
      'summaryStatus': serializer.toJson<String>(summaryStatus),
      'obsidianExportStatus': serializer.toJson<String>(obsidianExportStatus),
    };
  }

  Lecture copyWith(
          {int? id,
          Value<String?> remoteId = const Value.absent(),
          String? title,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent(),
          String? syncStatus,
          String? deviceId,
          int? version,
          Value<String?> audioPath = const Value.absent(),
          Value<String?> wavPath = const Value.absent(),
          Value<double?> durationSeconds = const Value.absent(),
          String? transcriptionStatus,
          String? summaryStatus,
          String? obsidianExportStatus}) =>
      Lecture(
        id: id ?? this.id,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        title: title ?? this.title,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        syncStatus: syncStatus ?? this.syncStatus,
        deviceId: deviceId ?? this.deviceId,
        version: version ?? this.version,
        audioPath: audioPath.present ? audioPath.value : this.audioPath,
        wavPath: wavPath.present ? wavPath.value : this.wavPath,
        durationSeconds: durationSeconds.present
            ? durationSeconds.value
            : this.durationSeconds,
        transcriptionStatus: transcriptionStatus ?? this.transcriptionStatus,
        summaryStatus: summaryStatus ?? this.summaryStatus,
        obsidianExportStatus: obsidianExportStatus ?? this.obsidianExportStatus,
      );
  Lecture copyWithCompanion(LecturesCompanion data) {
    return Lecture(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      title: data.title.present ? data.title.value : this.title,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      version: data.version.present ? data.version.value : this.version,
      audioPath: data.audioPath.present ? data.audioPath.value : this.audioPath,
      wavPath: data.wavPath.present ? data.wavPath.value : this.wavPath,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
      transcriptionStatus: data.transcriptionStatus.present
          ? data.transcriptionStatus.value
          : this.transcriptionStatus,
      summaryStatus: data.summaryStatus.present
          ? data.summaryStatus.value
          : this.summaryStatus,
      obsidianExportStatus: data.obsidianExportStatus.present
          ? data.obsidianExportStatus.value
          : this.obsidianExportStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Lecture(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('title: $title, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('audioPath: $audioPath, ')
          ..write('wavPath: $wavPath, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('transcriptionStatus: $transcriptionStatus, ')
          ..write('summaryStatus: $summaryStatus, ')
          ..write('obsidianExportStatus: $obsidianExportStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      remoteId,
      title,
      createdAt,
      updatedAt,
      deletedAt,
      syncStatus,
      deviceId,
      version,
      audioPath,
      wavPath,
      durationSeconds,
      transcriptionStatus,
      summaryStatus,
      obsidianExportStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Lecture &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.title == this.title &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.deviceId == this.deviceId &&
          other.version == this.version &&
          other.audioPath == this.audioPath &&
          other.wavPath == this.wavPath &&
          other.durationSeconds == this.durationSeconds &&
          other.transcriptionStatus == this.transcriptionStatus &&
          other.summaryStatus == this.summaryStatus &&
          other.obsidianExportStatus == this.obsidianExportStatus);
}

class LecturesCompanion extends UpdateCompanion<Lecture> {
  final Value<int> id;
  final Value<String?> remoteId;
  final Value<String> title;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String> deviceId;
  final Value<int> version;
  final Value<String?> audioPath;
  final Value<String?> wavPath;
  final Value<double?> durationSeconds;
  final Value<String> transcriptionStatus;
  final Value<String> summaryStatus;
  final Value<String> obsidianExportStatus;
  const LecturesCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.title = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
    this.audioPath = const Value.absent(),
    this.wavPath = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.transcriptionStatus = const Value.absent(),
    this.summaryStatus = const Value.absent(),
    this.obsidianExportStatus = const Value.absent(),
  });
  LecturesCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    required String title,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required String deviceId,
    this.version = const Value.absent(),
    this.audioPath = const Value.absent(),
    this.wavPath = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.transcriptionStatus = const Value.absent(),
    this.summaryStatus = const Value.absent(),
    this.obsidianExportStatus = const Value.absent(),
  })  : title = Value(title),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        deviceId = Value(deviceId);
  static Insertable<Lecture> custom({
    Expression<int>? id,
    Expression<String>? remoteId,
    Expression<String>? title,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? deviceId,
    Expression<int>? version,
    Expression<String>? audioPath,
    Expression<String>? wavPath,
    Expression<double>? durationSeconds,
    Expression<String>? transcriptionStatus,
    Expression<String>? summaryStatus,
    Expression<String>? obsidianExportStatus,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (title != null) 'title': title,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (deviceId != null) 'device_id': deviceId,
      if (version != null) 'version': version,
      if (audioPath != null) 'audio_path': audioPath,
      if (wavPath != null) 'wav_path': wavPath,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (transcriptionStatus != null)
        'transcription_status': transcriptionStatus,
      if (summaryStatus != null) 'summary_status': summaryStatus,
      if (obsidianExportStatus != null)
        'obsidian_export_status': obsidianExportStatus,
    });
  }

  LecturesCompanion copyWith(
      {Value<int>? id,
      Value<String?>? remoteId,
      Value<String>? title,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<String>? syncStatus,
      Value<String>? deviceId,
      Value<int>? version,
      Value<String?>? audioPath,
      Value<String?>? wavPath,
      Value<double?>? durationSeconds,
      Value<String>? transcriptionStatus,
      Value<String>? summaryStatus,
      Value<String>? obsidianExportStatus}) {
    return LecturesCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      deviceId: deviceId ?? this.deviceId,
      version: version ?? this.version,
      audioPath: audioPath ?? this.audioPath,
      wavPath: wavPath ?? this.wavPath,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      transcriptionStatus: transcriptionStatus ?? this.transcriptionStatus,
      summaryStatus: summaryStatus ?? this.summaryStatus,
      obsidianExportStatus: obsidianExportStatus ?? this.obsidianExportStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (audioPath.present) {
      map['audio_path'] = Variable<String>(audioPath.value);
    }
    if (wavPath.present) {
      map['wav_path'] = Variable<String>(wavPath.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<double>(durationSeconds.value);
    }
    if (transcriptionStatus.present) {
      map['transcription_status'] = Variable<String>(transcriptionStatus.value);
    }
    if (summaryStatus.present) {
      map['summary_status'] = Variable<String>(summaryStatus.value);
    }
    if (obsidianExportStatus.present) {
      map['obsidian_export_status'] =
          Variable<String>(obsidianExportStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LecturesCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('title: $title, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version, ')
          ..write('audioPath: $audioPath, ')
          ..write('wavPath: $wavPath, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('transcriptionStatus: $transcriptionStatus, ')
          ..write('summaryStatus: $summaryStatus, ')
          ..write('obsidianExportStatus: $obsidianExportStatus')
          ..write(')'))
        .toString();
  }
}

class $TranscriptSegmentsTable extends TranscriptSegments
    with TableInfo<$TranscriptSegmentsTable, TranscriptSegment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TranscriptSegmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lectureIdMeta =
      const VerificationMeta('lectureId');
  @override
  late final GeneratedColumn<int> lectureId = GeneratedColumn<int>(
      'lecture_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _startSecondsMeta =
      const VerificationMeta('startSeconds');
  @override
  late final GeneratedColumn<double> startSeconds = GeneratedColumn<double>(
      'start_seconds', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _endSecondsMeta =
      const VerificationMeta('endSeconds');
  @override
  late final GeneratedColumn<double> endSeconds = GeneratedColumn<double>(
      'end_seconds', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('localOnly'));
  static const VerificationMeta _deviceIdMeta =
      const VerificationMeta('deviceId');
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
      'device_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        remoteId,
        lectureId,
        startSeconds,
        endSeconds,
        content,
        createdAt,
        updatedAt,
        deletedAt,
        syncStatus,
        deviceId,
        version
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transcript_segments';
  @override
  VerificationContext validateIntegrity(Insertable<TranscriptSegment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('lecture_id')) {
      context.handle(_lectureIdMeta,
          lectureId.isAcceptableOrUnknown(data['lecture_id']!, _lectureIdMeta));
    } else if (isInserting) {
      context.missing(_lectureIdMeta);
    }
    if (data.containsKey('start_seconds')) {
      context.handle(
          _startSecondsMeta,
          startSeconds.isAcceptableOrUnknown(
              data['start_seconds']!, _startSecondsMeta));
    } else if (isInserting) {
      context.missing(_startSecondsMeta);
    }
    if (data.containsKey('end_seconds')) {
      context.handle(
          _endSecondsMeta,
          endSeconds.isAcceptableOrUnknown(
              data['end_seconds']!, _endSecondsMeta));
    } else if (isInserting) {
      context.missing(_endSecondsMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta));
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TranscriptSegment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TranscriptSegment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      lectureId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}lecture_id'])!,
      startSeconds: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}start_seconds'])!,
      endSeconds: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}end_seconds'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      deviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_id'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
    );
  }

  @override
  $TranscriptSegmentsTable createAlias(String alias) {
    return $TranscriptSegmentsTable(attachedDatabase, alias);
  }
}

class TranscriptSegment extends DataClass
    implements Insertable<TranscriptSegment> {
  final int id;
  final String? remoteId;
  final int lectureId;
  final double startSeconds;
  final double endSeconds;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String deviceId;
  final int version;
  const TranscriptSegment(
      {required this.id,
      this.remoteId,
      required this.lectureId,
      required this.startSeconds,
      required this.endSeconds,
      required this.content,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt,
      required this.syncStatus,
      required this.deviceId,
      required this.version});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['lecture_id'] = Variable<int>(lectureId);
    map['start_seconds'] = Variable<double>(startSeconds);
    map['end_seconds'] = Variable<double>(endSeconds);
    map['content'] = Variable<String>(content);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['device_id'] = Variable<String>(deviceId);
    map['version'] = Variable<int>(version);
    return map;
  }

  TranscriptSegmentsCompanion toCompanion(bool nullToAbsent) {
    return TranscriptSegmentsCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      lectureId: Value(lectureId),
      startSeconds: Value(startSeconds),
      endSeconds: Value(endSeconds),
      content: Value(content),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      deviceId: Value(deviceId),
      version: Value(version),
    );
  }

  factory TranscriptSegment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TranscriptSegment(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      lectureId: serializer.fromJson<int>(json['lectureId']),
      startSeconds: serializer.fromJson<double>(json['startSeconds']),
      endSeconds: serializer.fromJson<double>(json['endSeconds']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      version: serializer.fromJson<int>(json['version']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String?>(remoteId),
      'lectureId': serializer.toJson<int>(lectureId),
      'startSeconds': serializer.toJson<double>(startSeconds),
      'endSeconds': serializer.toJson<double>(endSeconds),
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'deviceId': serializer.toJson<String>(deviceId),
      'version': serializer.toJson<int>(version),
    };
  }

  TranscriptSegment copyWith(
          {int? id,
          Value<String?> remoteId = const Value.absent(),
          int? lectureId,
          double? startSeconds,
          double? endSeconds,
          String? content,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent(),
          String? syncStatus,
          String? deviceId,
          int? version}) =>
      TranscriptSegment(
        id: id ?? this.id,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        lectureId: lectureId ?? this.lectureId,
        startSeconds: startSeconds ?? this.startSeconds,
        endSeconds: endSeconds ?? this.endSeconds,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        syncStatus: syncStatus ?? this.syncStatus,
        deviceId: deviceId ?? this.deviceId,
        version: version ?? this.version,
      );
  TranscriptSegment copyWithCompanion(TranscriptSegmentsCompanion data) {
    return TranscriptSegment(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      lectureId: data.lectureId.present ? data.lectureId.value : this.lectureId,
      startSeconds: data.startSeconds.present
          ? data.startSeconds.value
          : this.startSeconds,
      endSeconds:
          data.endSeconds.present ? data.endSeconds.value : this.endSeconds,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      version: data.version.present ? data.version.value : this.version,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TranscriptSegment(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('lectureId: $lectureId, ')
          ..write('startSeconds: $startSeconds, ')
          ..write('endSeconds: $endSeconds, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      remoteId,
      lectureId,
      startSeconds,
      endSeconds,
      content,
      createdAt,
      updatedAt,
      deletedAt,
      syncStatus,
      deviceId,
      version);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TranscriptSegment &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.lectureId == this.lectureId &&
          other.startSeconds == this.startSeconds &&
          other.endSeconds == this.endSeconds &&
          other.content == this.content &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.deviceId == this.deviceId &&
          other.version == this.version);
}

class TranscriptSegmentsCompanion extends UpdateCompanion<TranscriptSegment> {
  final Value<int> id;
  final Value<String?> remoteId;
  final Value<int> lectureId;
  final Value<double> startSeconds;
  final Value<double> endSeconds;
  final Value<String> content;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String> deviceId;
  final Value<int> version;
  const TranscriptSegmentsCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.lectureId = const Value.absent(),
    this.startSeconds = const Value.absent(),
    this.endSeconds = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
  });
  TranscriptSegmentsCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    required int lectureId,
    required double startSeconds,
    required double endSeconds,
    required String content,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required String deviceId,
    this.version = const Value.absent(),
  })  : lectureId = Value(lectureId),
        startSeconds = Value(startSeconds),
        endSeconds = Value(endSeconds),
        content = Value(content),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        deviceId = Value(deviceId);
  static Insertable<TranscriptSegment> custom({
    Expression<int>? id,
    Expression<String>? remoteId,
    Expression<int>? lectureId,
    Expression<double>? startSeconds,
    Expression<double>? endSeconds,
    Expression<String>? content,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? deviceId,
    Expression<int>? version,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (lectureId != null) 'lecture_id': lectureId,
      if (startSeconds != null) 'start_seconds': startSeconds,
      if (endSeconds != null) 'end_seconds': endSeconds,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (deviceId != null) 'device_id': deviceId,
      if (version != null) 'version': version,
    });
  }

  TranscriptSegmentsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? remoteId,
      Value<int>? lectureId,
      Value<double>? startSeconds,
      Value<double>? endSeconds,
      Value<String>? content,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<String>? syncStatus,
      Value<String>? deviceId,
      Value<int>? version}) {
    return TranscriptSegmentsCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      lectureId: lectureId ?? this.lectureId,
      startSeconds: startSeconds ?? this.startSeconds,
      endSeconds: endSeconds ?? this.endSeconds,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      deviceId: deviceId ?? this.deviceId,
      version: version ?? this.version,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (lectureId.present) {
      map['lecture_id'] = Variable<int>(lectureId.value);
    }
    if (startSeconds.present) {
      map['start_seconds'] = Variable<double>(startSeconds.value);
    }
    if (endSeconds.present) {
      map['end_seconds'] = Variable<double>(endSeconds.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TranscriptSegmentsCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('lectureId: $lectureId, ')
          ..write('startSeconds: $startSeconds, ')
          ..write('endSeconds: $endSeconds, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version')
          ..write(')'))
        .toString();
  }
}

class $TopicsTable extends Topics with TableInfo<$TopicsTable, Topic> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TopicsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lectureIdMeta =
      const VerificationMeta('lectureId');
  @override
  late final GeneratedColumn<int> lectureId = GeneratedColumn<int>(
      'lecture_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _startSecondsMeta =
      const VerificationMeta('startSeconds');
  @override
  late final GeneratedColumn<double> startSeconds = GeneratedColumn<double>(
      'start_seconds', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _endSecondsMeta =
      const VerificationMeta('endSeconds');
  @override
  late final GeneratedColumn<double> endSeconds = GeneratedColumn<double>(
      'end_seconds', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _summaryMeta =
      const VerificationMeta('summary');
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
      'summary', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _importanceMeta =
      const VerificationMeta('importance');
  @override
  late final GeneratedColumn<int> importance = GeneratedColumn<int>(
      'importance', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _keywordsJsonMeta =
      const VerificationMeta('keywordsJson');
  @override
  late final GeneratedColumn<String> keywordsJson = GeneratedColumn<String>(
      'keywords_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('localOnly'));
  static const VerificationMeta _deviceIdMeta =
      const VerificationMeta('deviceId');
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
      'device_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        remoteId,
        lectureId,
        startSeconds,
        endSeconds,
        title,
        summary,
        importance,
        keywordsJson,
        createdAt,
        updatedAt,
        deletedAt,
        syncStatus,
        deviceId,
        version
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'topics';
  @override
  VerificationContext validateIntegrity(Insertable<Topic> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('lecture_id')) {
      context.handle(_lectureIdMeta,
          lectureId.isAcceptableOrUnknown(data['lecture_id']!, _lectureIdMeta));
    } else if (isInserting) {
      context.missing(_lectureIdMeta);
    }
    if (data.containsKey('start_seconds')) {
      context.handle(
          _startSecondsMeta,
          startSeconds.isAcceptableOrUnknown(
              data['start_seconds']!, _startSecondsMeta));
    } else if (isInserting) {
      context.missing(_startSecondsMeta);
    }
    if (data.containsKey('end_seconds')) {
      context.handle(
          _endSecondsMeta,
          endSeconds.isAcceptableOrUnknown(
              data['end_seconds']!, _endSecondsMeta));
    } else if (isInserting) {
      context.missing(_endSecondsMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('summary')) {
      context.handle(_summaryMeta,
          summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta));
    } else if (isInserting) {
      context.missing(_summaryMeta);
    }
    if (data.containsKey('importance')) {
      context.handle(
          _importanceMeta,
          importance.isAcceptableOrUnknown(
              data['importance']!, _importanceMeta));
    } else if (isInserting) {
      context.missing(_importanceMeta);
    }
    if (data.containsKey('keywords_json')) {
      context.handle(
          _keywordsJsonMeta,
          keywordsJson.isAcceptableOrUnknown(
              data['keywords_json']!, _keywordsJsonMeta));
    } else if (isInserting) {
      context.missing(_keywordsJsonMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta));
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Topic map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Topic(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      lectureId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}lecture_id'])!,
      startSeconds: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}start_seconds'])!,
      endSeconds: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}end_seconds'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      summary: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}summary'])!,
      importance: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}importance'])!,
      keywordsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}keywords_json'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      deviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_id'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
    );
  }

  @override
  $TopicsTable createAlias(String alias) {
    return $TopicsTable(attachedDatabase, alias);
  }
}

class Topic extends DataClass implements Insertable<Topic> {
  final int id;
  final String? remoteId;
  final int lectureId;
  final double startSeconds;
  final double endSeconds;
  final String title;
  final String summary;
  final int importance;
  final String keywordsJson;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String deviceId;
  final int version;
  const Topic(
      {required this.id,
      this.remoteId,
      required this.lectureId,
      required this.startSeconds,
      required this.endSeconds,
      required this.title,
      required this.summary,
      required this.importance,
      required this.keywordsJson,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt,
      required this.syncStatus,
      required this.deviceId,
      required this.version});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['lecture_id'] = Variable<int>(lectureId);
    map['start_seconds'] = Variable<double>(startSeconds);
    map['end_seconds'] = Variable<double>(endSeconds);
    map['title'] = Variable<String>(title);
    map['summary'] = Variable<String>(summary);
    map['importance'] = Variable<int>(importance);
    map['keywords_json'] = Variable<String>(keywordsJson);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['device_id'] = Variable<String>(deviceId);
    map['version'] = Variable<int>(version);
    return map;
  }

  TopicsCompanion toCompanion(bool nullToAbsent) {
    return TopicsCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      lectureId: Value(lectureId),
      startSeconds: Value(startSeconds),
      endSeconds: Value(endSeconds),
      title: Value(title),
      summary: Value(summary),
      importance: Value(importance),
      keywordsJson: Value(keywordsJson),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      deviceId: Value(deviceId),
      version: Value(version),
    );
  }

  factory Topic.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Topic(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      lectureId: serializer.fromJson<int>(json['lectureId']),
      startSeconds: serializer.fromJson<double>(json['startSeconds']),
      endSeconds: serializer.fromJson<double>(json['endSeconds']),
      title: serializer.fromJson<String>(json['title']),
      summary: serializer.fromJson<String>(json['summary']),
      importance: serializer.fromJson<int>(json['importance']),
      keywordsJson: serializer.fromJson<String>(json['keywordsJson']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      version: serializer.fromJson<int>(json['version']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String?>(remoteId),
      'lectureId': serializer.toJson<int>(lectureId),
      'startSeconds': serializer.toJson<double>(startSeconds),
      'endSeconds': serializer.toJson<double>(endSeconds),
      'title': serializer.toJson<String>(title),
      'summary': serializer.toJson<String>(summary),
      'importance': serializer.toJson<int>(importance),
      'keywordsJson': serializer.toJson<String>(keywordsJson),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'deviceId': serializer.toJson<String>(deviceId),
      'version': serializer.toJson<int>(version),
    };
  }

  Topic copyWith(
          {int? id,
          Value<String?> remoteId = const Value.absent(),
          int? lectureId,
          double? startSeconds,
          double? endSeconds,
          String? title,
          String? summary,
          int? importance,
          String? keywordsJson,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent(),
          String? syncStatus,
          String? deviceId,
          int? version}) =>
      Topic(
        id: id ?? this.id,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        lectureId: lectureId ?? this.lectureId,
        startSeconds: startSeconds ?? this.startSeconds,
        endSeconds: endSeconds ?? this.endSeconds,
        title: title ?? this.title,
        summary: summary ?? this.summary,
        importance: importance ?? this.importance,
        keywordsJson: keywordsJson ?? this.keywordsJson,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        syncStatus: syncStatus ?? this.syncStatus,
        deviceId: deviceId ?? this.deviceId,
        version: version ?? this.version,
      );
  Topic copyWithCompanion(TopicsCompanion data) {
    return Topic(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      lectureId: data.lectureId.present ? data.lectureId.value : this.lectureId,
      startSeconds: data.startSeconds.present
          ? data.startSeconds.value
          : this.startSeconds,
      endSeconds:
          data.endSeconds.present ? data.endSeconds.value : this.endSeconds,
      title: data.title.present ? data.title.value : this.title,
      summary: data.summary.present ? data.summary.value : this.summary,
      importance:
          data.importance.present ? data.importance.value : this.importance,
      keywordsJson: data.keywordsJson.present
          ? data.keywordsJson.value
          : this.keywordsJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      version: data.version.present ? data.version.value : this.version,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Topic(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('lectureId: $lectureId, ')
          ..write('startSeconds: $startSeconds, ')
          ..write('endSeconds: $endSeconds, ')
          ..write('title: $title, ')
          ..write('summary: $summary, ')
          ..write('importance: $importance, ')
          ..write('keywordsJson: $keywordsJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      remoteId,
      lectureId,
      startSeconds,
      endSeconds,
      title,
      summary,
      importance,
      keywordsJson,
      createdAt,
      updatedAt,
      deletedAt,
      syncStatus,
      deviceId,
      version);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Topic &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.lectureId == this.lectureId &&
          other.startSeconds == this.startSeconds &&
          other.endSeconds == this.endSeconds &&
          other.title == this.title &&
          other.summary == this.summary &&
          other.importance == this.importance &&
          other.keywordsJson == this.keywordsJson &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.deviceId == this.deviceId &&
          other.version == this.version);
}

class TopicsCompanion extends UpdateCompanion<Topic> {
  final Value<int> id;
  final Value<String?> remoteId;
  final Value<int> lectureId;
  final Value<double> startSeconds;
  final Value<double> endSeconds;
  final Value<String> title;
  final Value<String> summary;
  final Value<int> importance;
  final Value<String> keywordsJson;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String> deviceId;
  final Value<int> version;
  const TopicsCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.lectureId = const Value.absent(),
    this.startSeconds = const Value.absent(),
    this.endSeconds = const Value.absent(),
    this.title = const Value.absent(),
    this.summary = const Value.absent(),
    this.importance = const Value.absent(),
    this.keywordsJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
  });
  TopicsCompanion.insert({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    required int lectureId,
    required double startSeconds,
    required double endSeconds,
    required String title,
    required String summary,
    required int importance,
    required String keywordsJson,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required String deviceId,
    this.version = const Value.absent(),
  })  : lectureId = Value(lectureId),
        startSeconds = Value(startSeconds),
        endSeconds = Value(endSeconds),
        title = Value(title),
        summary = Value(summary),
        importance = Value(importance),
        keywordsJson = Value(keywordsJson),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        deviceId = Value(deviceId);
  static Insertable<Topic> custom({
    Expression<int>? id,
    Expression<String>? remoteId,
    Expression<int>? lectureId,
    Expression<double>? startSeconds,
    Expression<double>? endSeconds,
    Expression<String>? title,
    Expression<String>? summary,
    Expression<int>? importance,
    Expression<String>? keywordsJson,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? deviceId,
    Expression<int>? version,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (lectureId != null) 'lecture_id': lectureId,
      if (startSeconds != null) 'start_seconds': startSeconds,
      if (endSeconds != null) 'end_seconds': endSeconds,
      if (title != null) 'title': title,
      if (summary != null) 'summary': summary,
      if (importance != null) 'importance': importance,
      if (keywordsJson != null) 'keywords_json': keywordsJson,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (deviceId != null) 'device_id': deviceId,
      if (version != null) 'version': version,
    });
  }

  TopicsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? remoteId,
      Value<int>? lectureId,
      Value<double>? startSeconds,
      Value<double>? endSeconds,
      Value<String>? title,
      Value<String>? summary,
      Value<int>? importance,
      Value<String>? keywordsJson,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<String>? syncStatus,
      Value<String>? deviceId,
      Value<int>? version}) {
    return TopicsCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      lectureId: lectureId ?? this.lectureId,
      startSeconds: startSeconds ?? this.startSeconds,
      endSeconds: endSeconds ?? this.endSeconds,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      importance: importance ?? this.importance,
      keywordsJson: keywordsJson ?? this.keywordsJson,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      deviceId: deviceId ?? this.deviceId,
      version: version ?? this.version,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (lectureId.present) {
      map['lecture_id'] = Variable<int>(lectureId.value);
    }
    if (startSeconds.present) {
      map['start_seconds'] = Variable<double>(startSeconds.value);
    }
    if (endSeconds.present) {
      map['end_seconds'] = Variable<double>(endSeconds.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (importance.present) {
      map['importance'] = Variable<int>(importance.value);
    }
    if (keywordsJson.present) {
      map['keywords_json'] = Variable<String>(keywordsJson.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TopicsCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('lectureId: $lectureId, ')
          ..write('startSeconds: $startSeconds, ')
          ..write('endSeconds: $endSeconds, ')
          ..write('title: $title, ')
          ..write('summary: $summary, ')
          ..write('importance: $importance, ')
          ..write('keywordsJson: $keywordsJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version')
          ..write(')'))
        .toString();
  }
}

class $LectureSummariesTable extends LectureSummaries
    with TableInfo<$LectureSummariesTable, LectureSummary> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LectureSummariesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _lectureIdMeta =
      const VerificationMeta('lectureId');
  @override
  late final GeneratedColumn<int> lectureId = GeneratedColumn<int>(
      'lecture_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _overallSummaryMeta =
      const VerificationMeta('overallSummary');
  @override
  late final GeneratedColumn<String> overallSummary = GeneratedColumn<String>(
      'overall_summary', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _reviewPointsJsonMeta =
      const VerificationMeta('reviewPointsJson');
  @override
  late final GeneratedColumn<String> reviewPointsJson = GeneratedColumn<String>(
      'review_points_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _examPointsJsonMeta =
      const VerificationMeta('examPointsJson');
  @override
  late final GeneratedColumn<String> examPointsJson = GeneratedColumn<String>(
      'exam_points_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _keywordsJsonMeta =
      const VerificationMeta('keywordsJson');
  @override
  late final GeneratedColumn<String> keywordsJson = GeneratedColumn<String>(
      'keywords_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('localOnly'));
  static const VerificationMeta _deviceIdMeta =
      const VerificationMeta('deviceId');
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
      'device_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        lectureId,
        remoteId,
        overallSummary,
        reviewPointsJson,
        examPointsJson,
        keywordsJson,
        createdAt,
        updatedAt,
        deletedAt,
        syncStatus,
        deviceId,
        version
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lecture_summaries';
  @override
  VerificationContext validateIntegrity(Insertable<LectureSummary> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('lecture_id')) {
      context.handle(_lectureIdMeta,
          lectureId.isAcceptableOrUnknown(data['lecture_id']!, _lectureIdMeta));
    } else if (isInserting) {
      context.missing(_lectureIdMeta);
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    }
    if (data.containsKey('overall_summary')) {
      context.handle(
          _overallSummaryMeta,
          overallSummary.isAcceptableOrUnknown(
              data['overall_summary']!, _overallSummaryMeta));
    } else if (isInserting) {
      context.missing(_overallSummaryMeta);
    }
    if (data.containsKey('review_points_json')) {
      context.handle(
          _reviewPointsJsonMeta,
          reviewPointsJson.isAcceptableOrUnknown(
              data['review_points_json']!, _reviewPointsJsonMeta));
    } else if (isInserting) {
      context.missing(_reviewPointsJsonMeta);
    }
    if (data.containsKey('exam_points_json')) {
      context.handle(
          _examPointsJsonMeta,
          examPointsJson.isAcceptableOrUnknown(
              data['exam_points_json']!, _examPointsJsonMeta));
    } else if (isInserting) {
      context.missing(_examPointsJsonMeta);
    }
    if (data.containsKey('keywords_json')) {
      context.handle(
          _keywordsJsonMeta,
          keywordsJson.isAcceptableOrUnknown(
              data['keywords_json']!, _keywordsJsonMeta));
    } else if (isInserting) {
      context.missing(_keywordsJsonMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta));
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LectureSummary map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LectureSummary(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      lectureId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}lecture_id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id']),
      overallSummary: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}overall_summary'])!,
      reviewPointsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}review_points_json'])!,
      examPointsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}exam_points_json'])!,
      keywordsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}keywords_json'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      deviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_id'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
    );
  }

  @override
  $LectureSummariesTable createAlias(String alias) {
    return $LectureSummariesTable(attachedDatabase, alias);
  }
}

class LectureSummary extends DataClass implements Insertable<LectureSummary> {
  final int id;
  final int lectureId;
  final String? remoteId;
  final String overallSummary;
  final String reviewPointsJson;
  final String examPointsJson;
  final String keywordsJson;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final String syncStatus;
  final String deviceId;
  final int version;
  const LectureSummary(
      {required this.id,
      required this.lectureId,
      this.remoteId,
      required this.overallSummary,
      required this.reviewPointsJson,
      required this.examPointsJson,
      required this.keywordsJson,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt,
      required this.syncStatus,
      required this.deviceId,
      required this.version});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['lecture_id'] = Variable<int>(lectureId);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['overall_summary'] = Variable<String>(overallSummary);
    map['review_points_json'] = Variable<String>(reviewPointsJson);
    map['exam_points_json'] = Variable<String>(examPointsJson);
    map['keywords_json'] = Variable<String>(keywordsJson);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['device_id'] = Variable<String>(deviceId);
    map['version'] = Variable<int>(version);
    return map;
  }

  LectureSummariesCompanion toCompanion(bool nullToAbsent) {
    return LectureSummariesCompanion(
      id: Value(id),
      lectureId: Value(lectureId),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      overallSummary: Value(overallSummary),
      reviewPointsJson: Value(reviewPointsJson),
      examPointsJson: Value(examPointsJson),
      keywordsJson: Value(keywordsJson),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      syncStatus: Value(syncStatus),
      deviceId: Value(deviceId),
      version: Value(version),
    );
  }

  factory LectureSummary.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LectureSummary(
      id: serializer.fromJson<int>(json['id']),
      lectureId: serializer.fromJson<int>(json['lectureId']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      overallSummary: serializer.fromJson<String>(json['overallSummary']),
      reviewPointsJson: serializer.fromJson<String>(json['reviewPointsJson']),
      examPointsJson: serializer.fromJson<String>(json['examPointsJson']),
      keywordsJson: serializer.fromJson<String>(json['keywordsJson']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      version: serializer.fromJson<int>(json['version']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lectureId': serializer.toJson<int>(lectureId),
      'remoteId': serializer.toJson<String?>(remoteId),
      'overallSummary': serializer.toJson<String>(overallSummary),
      'reviewPointsJson': serializer.toJson<String>(reviewPointsJson),
      'examPointsJson': serializer.toJson<String>(examPointsJson),
      'keywordsJson': serializer.toJson<String>(keywordsJson),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'deviceId': serializer.toJson<String>(deviceId),
      'version': serializer.toJson<int>(version),
    };
  }

  LectureSummary copyWith(
          {int? id,
          int? lectureId,
          Value<String?> remoteId = const Value.absent(),
          String? overallSummary,
          String? reviewPointsJson,
          String? examPointsJson,
          String? keywordsJson,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent(),
          String? syncStatus,
          String? deviceId,
          int? version}) =>
      LectureSummary(
        id: id ?? this.id,
        lectureId: lectureId ?? this.lectureId,
        remoteId: remoteId.present ? remoteId.value : this.remoteId,
        overallSummary: overallSummary ?? this.overallSummary,
        reviewPointsJson: reviewPointsJson ?? this.reviewPointsJson,
        examPointsJson: examPointsJson ?? this.examPointsJson,
        keywordsJson: keywordsJson ?? this.keywordsJson,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        syncStatus: syncStatus ?? this.syncStatus,
        deviceId: deviceId ?? this.deviceId,
        version: version ?? this.version,
      );
  LectureSummary copyWithCompanion(LectureSummariesCompanion data) {
    return LectureSummary(
      id: data.id.present ? data.id.value : this.id,
      lectureId: data.lectureId.present ? data.lectureId.value : this.lectureId,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      overallSummary: data.overallSummary.present
          ? data.overallSummary.value
          : this.overallSummary,
      reviewPointsJson: data.reviewPointsJson.present
          ? data.reviewPointsJson.value
          : this.reviewPointsJson,
      examPointsJson: data.examPointsJson.present
          ? data.examPointsJson.value
          : this.examPointsJson,
      keywordsJson: data.keywordsJson.present
          ? data.keywordsJson.value
          : this.keywordsJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      version: data.version.present ? data.version.value : this.version,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LectureSummary(')
          ..write('id: $id, ')
          ..write('lectureId: $lectureId, ')
          ..write('remoteId: $remoteId, ')
          ..write('overallSummary: $overallSummary, ')
          ..write('reviewPointsJson: $reviewPointsJson, ')
          ..write('examPointsJson: $examPointsJson, ')
          ..write('keywordsJson: $keywordsJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      lectureId,
      remoteId,
      overallSummary,
      reviewPointsJson,
      examPointsJson,
      keywordsJson,
      createdAt,
      updatedAt,
      deletedAt,
      syncStatus,
      deviceId,
      version);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LectureSummary &&
          other.id == this.id &&
          other.lectureId == this.lectureId &&
          other.remoteId == this.remoteId &&
          other.overallSummary == this.overallSummary &&
          other.reviewPointsJson == this.reviewPointsJson &&
          other.examPointsJson == this.examPointsJson &&
          other.keywordsJson == this.keywordsJson &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt &&
          other.syncStatus == this.syncStatus &&
          other.deviceId == this.deviceId &&
          other.version == this.version);
}

class LectureSummariesCompanion extends UpdateCompanion<LectureSummary> {
  final Value<int> id;
  final Value<int> lectureId;
  final Value<String?> remoteId;
  final Value<String> overallSummary;
  final Value<String> reviewPointsJson;
  final Value<String> examPointsJson;
  final Value<String> keywordsJson;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<String> syncStatus;
  final Value<String> deviceId;
  final Value<int> version;
  const LectureSummariesCompanion({
    this.id = const Value.absent(),
    this.lectureId = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.overallSummary = const Value.absent(),
    this.reviewPointsJson = const Value.absent(),
    this.examPointsJson = const Value.absent(),
    this.keywordsJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.version = const Value.absent(),
  });
  LectureSummariesCompanion.insert({
    this.id = const Value.absent(),
    required int lectureId,
    this.remoteId = const Value.absent(),
    required String overallSummary,
    required String reviewPointsJson,
    required String examPointsJson,
    required String keywordsJson,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required String deviceId,
    this.version = const Value.absent(),
  })  : lectureId = Value(lectureId),
        overallSummary = Value(overallSummary),
        reviewPointsJson = Value(reviewPointsJson),
        examPointsJson = Value(examPointsJson),
        keywordsJson = Value(keywordsJson),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt),
        deviceId = Value(deviceId);
  static Insertable<LectureSummary> custom({
    Expression<int>? id,
    Expression<int>? lectureId,
    Expression<String>? remoteId,
    Expression<String>? overallSummary,
    Expression<String>? reviewPointsJson,
    Expression<String>? examPointsJson,
    Expression<String>? keywordsJson,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<String>? syncStatus,
    Expression<String>? deviceId,
    Expression<int>? version,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lectureId != null) 'lecture_id': lectureId,
      if (remoteId != null) 'remote_id': remoteId,
      if (overallSummary != null) 'overall_summary': overallSummary,
      if (reviewPointsJson != null) 'review_points_json': reviewPointsJson,
      if (examPointsJson != null) 'exam_points_json': examPointsJson,
      if (keywordsJson != null) 'keywords_json': keywordsJson,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (deviceId != null) 'device_id': deviceId,
      if (version != null) 'version': version,
    });
  }

  LectureSummariesCompanion copyWith(
      {Value<int>? id,
      Value<int>? lectureId,
      Value<String?>? remoteId,
      Value<String>? overallSummary,
      Value<String>? reviewPointsJson,
      Value<String>? examPointsJson,
      Value<String>? keywordsJson,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<String>? syncStatus,
      Value<String>? deviceId,
      Value<int>? version}) {
    return LectureSummariesCompanion(
      id: id ?? this.id,
      lectureId: lectureId ?? this.lectureId,
      remoteId: remoteId ?? this.remoteId,
      overallSummary: overallSummary ?? this.overallSummary,
      reviewPointsJson: reviewPointsJson ?? this.reviewPointsJson,
      examPointsJson: examPointsJson ?? this.examPointsJson,
      keywordsJson: keywordsJson ?? this.keywordsJson,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      deviceId: deviceId ?? this.deviceId,
      version: version ?? this.version,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lectureId.present) {
      map['lecture_id'] = Variable<int>(lectureId.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (overallSummary.present) {
      map['overall_summary'] = Variable<String>(overallSummary.value);
    }
    if (reviewPointsJson.present) {
      map['review_points_json'] = Variable<String>(reviewPointsJson.value);
    }
    if (examPointsJson.present) {
      map['exam_points_json'] = Variable<String>(examPointsJson.value);
    }
    if (keywordsJson.present) {
      map['keywords_json'] = Variable<String>(keywordsJson.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LectureSummariesCompanion(')
          ..write('id: $id, ')
          ..write('lectureId: $lectureId, ')
          ..write('remoteId: $remoteId, ')
          ..write('overallSummary: $overallSummary, ')
          ..write('reviewPointsJson: $reviewPointsJson, ')
          ..write('examPointsJson: $examPointsJson, ')
          ..write('keywordsJson: $keywordsJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deviceId: $deviceId, ')
          ..write('version: $version')
          ..write(')'))
        .toString();
  }
}

class $SyncQueueTable extends SyncQueue
    with TableInfo<$SyncQueueTable, SyncQueueData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _entityTypeMeta =
      const VerificationMeta('entityType');
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
      'entity_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _entityIdMeta =
      const VerificationMeta('entityId');
  @override
  late final GeneratedColumn<int> entityId = GeneratedColumn<int>(
      'entity_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
      'action', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _retryCountMeta =
      const VerificationMeta('retryCount');
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
      'retry_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastErrorMeta =
      const VerificationMeta('lastError');
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
      'last_error', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, entityType, entityId, action, createdAt, retryCount, lastError];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue';
  @override
  VerificationContext validateIntegrity(Insertable<SyncQueueData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity_type')) {
      context.handle(
          _entityTypeMeta,
          entityType.isAcceptableOrUnknown(
              data['entity_type']!, _entityTypeMeta));
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(_entityIdMeta,
          entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta));
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('action')) {
      context.handle(_actionMeta,
          action.isAcceptableOrUnknown(data['action']!, _actionMeta));
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('retry_count')) {
      context.handle(
          _retryCountMeta,
          retryCount.isAcceptableOrUnknown(
              data['retry_count']!, _retryCountMeta));
    }
    if (data.containsKey('last_error')) {
      context.handle(_lastErrorMeta,
          lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      entityType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_type'])!,
      entityId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}entity_id'])!,
      action: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      retryCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}retry_count'])!,
      lastError: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_error']),
    );
  }

  @override
  $SyncQueueTable createAlias(String alias) {
    return $SyncQueueTable(attachedDatabase, alias);
  }
}

class SyncQueueData extends DataClass implements Insertable<SyncQueueData> {
  final int id;
  final String entityType;
  final int entityId;
  final String action;
  final DateTime createdAt;
  final int retryCount;
  final String? lastError;
  const SyncQueueData(
      {required this.id,
      required this.entityType,
      required this.entityId,
      required this.action,
      required this.createdAt,
      required this.retryCount,
      this.lastError});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<int>(entityId);
    map['action'] = Variable<String>(action);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['retry_count'] = Variable<int>(retryCount);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    return map;
  }

  SyncQueueCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueCompanion(
      id: Value(id),
      entityType: Value(entityType),
      entityId: Value(entityId),
      action: Value(action),
      createdAt: Value(createdAt),
      retryCount: Value(retryCount),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
    );
  }

  factory SyncQueueData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueData(
      id: serializer.fromJson<int>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<int>(json['entityId']),
      action: serializer.fromJson<String>(json['action']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      lastError: serializer.fromJson<String?>(json['lastError']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<int>(entityId),
      'action': serializer.toJson<String>(action),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'retryCount': serializer.toJson<int>(retryCount),
      'lastError': serializer.toJson<String?>(lastError),
    };
  }

  SyncQueueData copyWith(
          {int? id,
          String? entityType,
          int? entityId,
          String? action,
          DateTime? createdAt,
          int? retryCount,
          Value<String?> lastError = const Value.absent()}) =>
      SyncQueueData(
        id: id ?? this.id,
        entityType: entityType ?? this.entityType,
        entityId: entityId ?? this.entityId,
        action: action ?? this.action,
        createdAt: createdAt ?? this.createdAt,
        retryCount: retryCount ?? this.retryCount,
        lastError: lastError.present ? lastError.value : this.lastError,
      );
  SyncQueueData copyWithCompanion(SyncQueueCompanion data) {
    return SyncQueueData(
      id: data.id.present ? data.id.value : this.id,
      entityType:
          data.entityType.present ? data.entityType.value : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      action: data.action.present ? data.action.value : this.action,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      retryCount:
          data.retryCount.present ? data.retryCount.value : this.retryCount,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueData(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('action: $action, ')
          ..write('createdAt: $createdAt, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastError: $lastError')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, entityType, entityId, action, createdAt, retryCount, lastError);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueData &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.action == this.action &&
          other.createdAt == this.createdAt &&
          other.retryCount == this.retryCount &&
          other.lastError == this.lastError);
}

class SyncQueueCompanion extends UpdateCompanion<SyncQueueData> {
  final Value<int> id;
  final Value<String> entityType;
  final Value<int> entityId;
  final Value<String> action;
  final Value<DateTime> createdAt;
  final Value<int> retryCount;
  final Value<String?> lastError;
  const SyncQueueCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.action = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.lastError = const Value.absent(),
  });
  SyncQueueCompanion.insert({
    this.id = const Value.absent(),
    required String entityType,
    required int entityId,
    required String action,
    required DateTime createdAt,
    this.retryCount = const Value.absent(),
    this.lastError = const Value.absent(),
  })  : entityType = Value(entityType),
        entityId = Value(entityId),
        action = Value(action),
        createdAt = Value(createdAt);
  static Insertable<SyncQueueData> custom({
    Expression<int>? id,
    Expression<String>? entityType,
    Expression<int>? entityId,
    Expression<String>? action,
    Expression<DateTime>? createdAt,
    Expression<int>? retryCount,
    Expression<String>? lastError,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (action != null) 'action': action,
      if (createdAt != null) 'created_at': createdAt,
      if (retryCount != null) 'retry_count': retryCount,
      if (lastError != null) 'last_error': lastError,
    });
  }

  SyncQueueCompanion copyWith(
      {Value<int>? id,
      Value<String>? entityType,
      Value<int>? entityId,
      Value<String>? action,
      Value<DateTime>? createdAt,
      Value<int>? retryCount,
      Value<String?>? lastError}) {
    return SyncQueueCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      action: action ?? this.action,
      createdAt: createdAt ?? this.createdAt,
      retryCount: retryCount ?? this.retryCount,
      lastError: lastError ?? this.lastError,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<int>(entityId.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('action: $action, ')
          ..write('createdAt: $createdAt, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastError: $lastError')
          ..write(')'))
        .toString();
  }
}

class $ExportLogsTable extends ExportLogs
    with TableInfo<$ExportLogsTable, ExportLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExportLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _lectureIdMeta =
      const VerificationMeta('lectureId');
  @override
  late final GeneratedColumn<int> lectureId = GeneratedColumn<int>(
      'lecture_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _targetMeta = const VerificationMeta('target');
  @override
  late final GeneratedColumn<String> target = GeneratedColumn<String>(
      'target', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _filePathMeta =
      const VerificationMeta('filePath');
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
      'file_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _exportedAtMeta =
      const VerificationMeta('exportedAt');
  @override
  late final GeneratedColumn<DateTime> exportedAt = GeneratedColumn<DateTime>(
      'exported_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _errorMessageMeta =
      const VerificationMeta('errorMessage');
  @override
  late final GeneratedColumn<String> errorMessage = GeneratedColumn<String>(
      'error_message', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, lectureId, target, filePath, exportedAt, status, errorMessage];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'export_logs';
  @override
  VerificationContext validateIntegrity(Insertable<ExportLog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('lecture_id')) {
      context.handle(_lectureIdMeta,
          lectureId.isAcceptableOrUnknown(data['lecture_id']!, _lectureIdMeta));
    } else if (isInserting) {
      context.missing(_lectureIdMeta);
    }
    if (data.containsKey('target')) {
      context.handle(_targetMeta,
          target.isAcceptableOrUnknown(data['target']!, _targetMeta));
    } else if (isInserting) {
      context.missing(_targetMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(_filePathMeta,
          filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta));
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('exported_at')) {
      context.handle(
          _exportedAtMeta,
          exportedAt.isAcceptableOrUnknown(
              data['exported_at']!, _exportedAtMeta));
    } else if (isInserting) {
      context.missing(_exportedAtMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('error_message')) {
      context.handle(
          _errorMessageMeta,
          errorMessage.isAcceptableOrUnknown(
              data['error_message']!, _errorMessageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExportLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExportLog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      lectureId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}lecture_id'])!,
      target: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}target'])!,
      filePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_path'])!,
      exportedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}exported_at'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      errorMessage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}error_message']),
    );
  }

  @override
  $ExportLogsTable createAlias(String alias) {
    return $ExportLogsTable(attachedDatabase, alias);
  }
}

class ExportLog extends DataClass implements Insertable<ExportLog> {
  final int id;
  final int lectureId;
  final String target;
  final String filePath;
  final DateTime exportedAt;
  final String status;
  final String? errorMessage;
  const ExportLog(
      {required this.id,
      required this.lectureId,
      required this.target,
      required this.filePath,
      required this.exportedAt,
      required this.status,
      this.errorMessage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['lecture_id'] = Variable<int>(lectureId);
    map['target'] = Variable<String>(target);
    map['file_path'] = Variable<String>(filePath);
    map['exported_at'] = Variable<DateTime>(exportedAt);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || errorMessage != null) {
      map['error_message'] = Variable<String>(errorMessage);
    }
    return map;
  }

  ExportLogsCompanion toCompanion(bool nullToAbsent) {
    return ExportLogsCompanion(
      id: Value(id),
      lectureId: Value(lectureId),
      target: Value(target),
      filePath: Value(filePath),
      exportedAt: Value(exportedAt),
      status: Value(status),
      errorMessage: errorMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(errorMessage),
    );
  }

  factory ExportLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExportLog(
      id: serializer.fromJson<int>(json['id']),
      lectureId: serializer.fromJson<int>(json['lectureId']),
      target: serializer.fromJson<String>(json['target']),
      filePath: serializer.fromJson<String>(json['filePath']),
      exportedAt: serializer.fromJson<DateTime>(json['exportedAt']),
      status: serializer.fromJson<String>(json['status']),
      errorMessage: serializer.fromJson<String?>(json['errorMessage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lectureId': serializer.toJson<int>(lectureId),
      'target': serializer.toJson<String>(target),
      'filePath': serializer.toJson<String>(filePath),
      'exportedAt': serializer.toJson<DateTime>(exportedAt),
      'status': serializer.toJson<String>(status),
      'errorMessage': serializer.toJson<String?>(errorMessage),
    };
  }

  ExportLog copyWith(
          {int? id,
          int? lectureId,
          String? target,
          String? filePath,
          DateTime? exportedAt,
          String? status,
          Value<String?> errorMessage = const Value.absent()}) =>
      ExportLog(
        id: id ?? this.id,
        lectureId: lectureId ?? this.lectureId,
        target: target ?? this.target,
        filePath: filePath ?? this.filePath,
        exportedAt: exportedAt ?? this.exportedAt,
        status: status ?? this.status,
        errorMessage:
            errorMessage.present ? errorMessage.value : this.errorMessage,
      );
  ExportLog copyWithCompanion(ExportLogsCompanion data) {
    return ExportLog(
      id: data.id.present ? data.id.value : this.id,
      lectureId: data.lectureId.present ? data.lectureId.value : this.lectureId,
      target: data.target.present ? data.target.value : this.target,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      exportedAt:
          data.exportedAt.present ? data.exportedAt.value : this.exportedAt,
      status: data.status.present ? data.status.value : this.status,
      errorMessage: data.errorMessage.present
          ? data.errorMessage.value
          : this.errorMessage,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExportLog(')
          ..write('id: $id, ')
          ..write('lectureId: $lectureId, ')
          ..write('target: $target, ')
          ..write('filePath: $filePath, ')
          ..write('exportedAt: $exportedAt, ')
          ..write('status: $status, ')
          ..write('errorMessage: $errorMessage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, lectureId, target, filePath, exportedAt, status, errorMessage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExportLog &&
          other.id == this.id &&
          other.lectureId == this.lectureId &&
          other.target == this.target &&
          other.filePath == this.filePath &&
          other.exportedAt == this.exportedAt &&
          other.status == this.status &&
          other.errorMessage == this.errorMessage);
}

class ExportLogsCompanion extends UpdateCompanion<ExportLog> {
  final Value<int> id;
  final Value<int> lectureId;
  final Value<String> target;
  final Value<String> filePath;
  final Value<DateTime> exportedAt;
  final Value<String> status;
  final Value<String?> errorMessage;
  const ExportLogsCompanion({
    this.id = const Value.absent(),
    this.lectureId = const Value.absent(),
    this.target = const Value.absent(),
    this.filePath = const Value.absent(),
    this.exportedAt = const Value.absent(),
    this.status = const Value.absent(),
    this.errorMessage = const Value.absent(),
  });
  ExportLogsCompanion.insert({
    this.id = const Value.absent(),
    required int lectureId,
    required String target,
    required String filePath,
    required DateTime exportedAt,
    required String status,
    this.errorMessage = const Value.absent(),
  })  : lectureId = Value(lectureId),
        target = Value(target),
        filePath = Value(filePath),
        exportedAt = Value(exportedAt),
        status = Value(status);
  static Insertable<ExportLog> custom({
    Expression<int>? id,
    Expression<int>? lectureId,
    Expression<String>? target,
    Expression<String>? filePath,
    Expression<DateTime>? exportedAt,
    Expression<String>? status,
    Expression<String>? errorMessage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lectureId != null) 'lecture_id': lectureId,
      if (target != null) 'target': target,
      if (filePath != null) 'file_path': filePath,
      if (exportedAt != null) 'exported_at': exportedAt,
      if (status != null) 'status': status,
      if (errorMessage != null) 'error_message': errorMessage,
    });
  }

  ExportLogsCompanion copyWith(
      {Value<int>? id,
      Value<int>? lectureId,
      Value<String>? target,
      Value<String>? filePath,
      Value<DateTime>? exportedAt,
      Value<String>? status,
      Value<String?>? errorMessage}) {
    return ExportLogsCompanion(
      id: id ?? this.id,
      lectureId: lectureId ?? this.lectureId,
      target: target ?? this.target,
      filePath: filePath ?? this.filePath,
      exportedAt: exportedAt ?? this.exportedAt,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lectureId.present) {
      map['lecture_id'] = Variable<int>(lectureId.value);
    }
    if (target.present) {
      map['target'] = Variable<String>(target.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (exportedAt.present) {
      map['exported_at'] = Variable<DateTime>(exportedAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (errorMessage.present) {
      map['error_message'] = Variable<String>(errorMessage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExportLogsCompanion(')
          ..write('id: $id, ')
          ..write('lectureId: $lectureId, ')
          ..write('target: $target, ')
          ..write('filePath: $filePath, ')
          ..write('exportedAt: $exportedAt, ')
          ..write('status: $status, ')
          ..write('errorMessage: $errorMessage')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(Insertable<AppSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final String key;
  final String value;
  const AppSetting({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      key: Value(key),
      value: Value(value),
    );
  }

  factory AppSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  AppSetting copyWith({String? key, String? value}) => AppSetting(
        key: key ?? this.key,
        value: value ?? this.value,
      );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.key == this.key &&
          other.value == this.value);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const AppSettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  })  : key = Value(key),
        value = Value(value);
  static Insertable<AppSetting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsCompanion copyWith(
      {Value<String>? key, Value<String>? value, Value<int>? rowid}) {
    return AppSettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LecturesTable lectures = $LecturesTable(this);
  late final $TranscriptSegmentsTable transcriptSegments =
      $TranscriptSegmentsTable(this);
  late final $TopicsTable topics = $TopicsTable(this);
  late final $LectureSummariesTable lectureSummaries =
      $LectureSummariesTable(this);
  late final $SyncQueueTable syncQueue = $SyncQueueTable(this);
  late final $ExportLogsTable exportLogs = $ExportLogsTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        lectures,
        transcriptSegments,
        topics,
        lectureSummaries,
        syncQueue,
        exportLogs,
        appSettings
      ];
}

typedef $$LecturesTableCreateCompanionBuilder = LecturesCompanion Function({
  Value<int> id,
  Value<String?> remoteId,
  required String title,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  required String deviceId,
  Value<int> version,
  Value<String?> audioPath,
  Value<String?> wavPath,
  Value<double?> durationSeconds,
  Value<String> transcriptionStatus,
  Value<String> summaryStatus,
  Value<String> obsidianExportStatus,
});
typedef $$LecturesTableUpdateCompanionBuilder = LecturesCompanion Function({
  Value<int> id,
  Value<String?> remoteId,
  Value<String> title,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<String> deviceId,
  Value<int> version,
  Value<String?> audioPath,
  Value<String?> wavPath,
  Value<double?> durationSeconds,
  Value<String> transcriptionStatus,
  Value<String> summaryStatus,
  Value<String> obsidianExportStatus,
});

class $$LecturesTableFilterComposer
    extends Composer<_$AppDatabase, $LecturesTable> {
  $$LecturesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deviceId => $composableBuilder(
      column: $table.deviceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get audioPath => $composableBuilder(
      column: $table.audioPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get wavPath => $composableBuilder(
      column: $table.wavPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get durationSeconds => $composableBuilder(
      column: $table.durationSeconds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get transcriptionStatus => $composableBuilder(
      column: $table.transcriptionStatus,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get summaryStatus => $composableBuilder(
      column: $table.summaryStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get obsidianExportStatus => $composableBuilder(
      column: $table.obsidianExportStatus,
      builder: (column) => ColumnFilters(column));
}

class $$LecturesTableOrderingComposer
    extends Composer<_$AppDatabase, $LecturesTable> {
  $$LecturesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deviceId => $composableBuilder(
      column: $table.deviceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get audioPath => $composableBuilder(
      column: $table.audioPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get wavPath => $composableBuilder(
      column: $table.wavPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get durationSeconds => $composableBuilder(
      column: $table.durationSeconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transcriptionStatus => $composableBuilder(
      column: $table.transcriptionStatus,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get summaryStatus => $composableBuilder(
      column: $table.summaryStatus,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get obsidianExportStatus => $composableBuilder(
      column: $table.obsidianExportStatus,
      builder: (column) => ColumnOrderings(column));
}

class $$LecturesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LecturesTable> {
  $$LecturesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get audioPath =>
      $composableBuilder(column: $table.audioPath, builder: (column) => column);

  GeneratedColumn<String> get wavPath =>
      $composableBuilder(column: $table.wavPath, builder: (column) => column);

  GeneratedColumn<double> get durationSeconds => $composableBuilder(
      column: $table.durationSeconds, builder: (column) => column);

  GeneratedColumn<String> get transcriptionStatus => $composableBuilder(
      column: $table.transcriptionStatus, builder: (column) => column);

  GeneratedColumn<String> get summaryStatus => $composableBuilder(
      column: $table.summaryStatus, builder: (column) => column);

  GeneratedColumn<String> get obsidianExportStatus => $composableBuilder(
      column: $table.obsidianExportStatus, builder: (column) => column);
}

class $$LecturesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LecturesTable,
    Lecture,
    $$LecturesTableFilterComposer,
    $$LecturesTableOrderingComposer,
    $$LecturesTableAnnotationComposer,
    $$LecturesTableCreateCompanionBuilder,
    $$LecturesTableUpdateCompanionBuilder,
    (Lecture, BaseReferences<_$AppDatabase, $LecturesTable, Lecture>),
    Lecture,
    PrefetchHooks Function()> {
  $$LecturesTableTableManager(_$AppDatabase db, $LecturesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LecturesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LecturesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LecturesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<String> deviceId = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<String?> audioPath = const Value.absent(),
            Value<String?> wavPath = const Value.absent(),
            Value<double?> durationSeconds = const Value.absent(),
            Value<String> transcriptionStatus = const Value.absent(),
            Value<String> summaryStatus = const Value.absent(),
            Value<String> obsidianExportStatus = const Value.absent(),
          }) =>
              LecturesCompanion(
            id: id,
            remoteId: remoteId,
            title: title,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            deviceId: deviceId,
            version: version,
            audioPath: audioPath,
            wavPath: wavPath,
            durationSeconds: durationSeconds,
            transcriptionStatus: transcriptionStatus,
            summaryStatus: summaryStatus,
            obsidianExportStatus: obsidianExportStatus,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            required String title,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            required String deviceId,
            Value<int> version = const Value.absent(),
            Value<String?> audioPath = const Value.absent(),
            Value<String?> wavPath = const Value.absent(),
            Value<double?> durationSeconds = const Value.absent(),
            Value<String> transcriptionStatus = const Value.absent(),
            Value<String> summaryStatus = const Value.absent(),
            Value<String> obsidianExportStatus = const Value.absent(),
          }) =>
              LecturesCompanion.insert(
            id: id,
            remoteId: remoteId,
            title: title,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            deviceId: deviceId,
            version: version,
            audioPath: audioPath,
            wavPath: wavPath,
            durationSeconds: durationSeconds,
            transcriptionStatus: transcriptionStatus,
            summaryStatus: summaryStatus,
            obsidianExportStatus: obsidianExportStatus,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LecturesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LecturesTable,
    Lecture,
    $$LecturesTableFilterComposer,
    $$LecturesTableOrderingComposer,
    $$LecturesTableAnnotationComposer,
    $$LecturesTableCreateCompanionBuilder,
    $$LecturesTableUpdateCompanionBuilder,
    (Lecture, BaseReferences<_$AppDatabase, $LecturesTable, Lecture>),
    Lecture,
    PrefetchHooks Function()>;
typedef $$TranscriptSegmentsTableCreateCompanionBuilder
    = TranscriptSegmentsCompanion Function({
  Value<int> id,
  Value<String?> remoteId,
  required int lectureId,
  required double startSeconds,
  required double endSeconds,
  required String content,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  required String deviceId,
  Value<int> version,
});
typedef $$TranscriptSegmentsTableUpdateCompanionBuilder
    = TranscriptSegmentsCompanion Function({
  Value<int> id,
  Value<String?> remoteId,
  Value<int> lectureId,
  Value<double> startSeconds,
  Value<double> endSeconds,
  Value<String> content,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<String> deviceId,
  Value<int> version,
});

class $$TranscriptSegmentsTableFilterComposer
    extends Composer<_$AppDatabase, $TranscriptSegmentsTable> {
  $$TranscriptSegmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lectureId => $composableBuilder(
      column: $table.lectureId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get startSeconds => $composableBuilder(
      column: $table.startSeconds, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get endSeconds => $composableBuilder(
      column: $table.endSeconds, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deviceId => $composableBuilder(
      column: $table.deviceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));
}

class $$TranscriptSegmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $TranscriptSegmentsTable> {
  $$TranscriptSegmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lectureId => $composableBuilder(
      column: $table.lectureId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get startSeconds => $composableBuilder(
      column: $table.startSeconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get endSeconds => $composableBuilder(
      column: $table.endSeconds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deviceId => $composableBuilder(
      column: $table.deviceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));
}

class $$TranscriptSegmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TranscriptSegmentsTable> {
  $$TranscriptSegmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get lectureId =>
      $composableBuilder(column: $table.lectureId, builder: (column) => column);

  GeneratedColumn<double> get startSeconds => $composableBuilder(
      column: $table.startSeconds, builder: (column) => column);

  GeneratedColumn<double> get endSeconds => $composableBuilder(
      column: $table.endSeconds, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);
}

class $$TranscriptSegmentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TranscriptSegmentsTable,
    TranscriptSegment,
    $$TranscriptSegmentsTableFilterComposer,
    $$TranscriptSegmentsTableOrderingComposer,
    $$TranscriptSegmentsTableAnnotationComposer,
    $$TranscriptSegmentsTableCreateCompanionBuilder,
    $$TranscriptSegmentsTableUpdateCompanionBuilder,
    (
      TranscriptSegment,
      BaseReferences<_$AppDatabase, $TranscriptSegmentsTable, TranscriptSegment>
    ),
    TranscriptSegment,
    PrefetchHooks Function()> {
  $$TranscriptSegmentsTableTableManager(
      _$AppDatabase db, $TranscriptSegmentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TranscriptSegmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TranscriptSegmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TranscriptSegmentsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> lectureId = const Value.absent(),
            Value<double> startSeconds = const Value.absent(),
            Value<double> endSeconds = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<String> deviceId = const Value.absent(),
            Value<int> version = const Value.absent(),
          }) =>
              TranscriptSegmentsCompanion(
            id: id,
            remoteId: remoteId,
            lectureId: lectureId,
            startSeconds: startSeconds,
            endSeconds: endSeconds,
            content: content,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            deviceId: deviceId,
            version: version,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            required int lectureId,
            required double startSeconds,
            required double endSeconds,
            required String content,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            required String deviceId,
            Value<int> version = const Value.absent(),
          }) =>
              TranscriptSegmentsCompanion.insert(
            id: id,
            remoteId: remoteId,
            lectureId: lectureId,
            startSeconds: startSeconds,
            endSeconds: endSeconds,
            content: content,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            deviceId: deviceId,
            version: version,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TranscriptSegmentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TranscriptSegmentsTable,
    TranscriptSegment,
    $$TranscriptSegmentsTableFilterComposer,
    $$TranscriptSegmentsTableOrderingComposer,
    $$TranscriptSegmentsTableAnnotationComposer,
    $$TranscriptSegmentsTableCreateCompanionBuilder,
    $$TranscriptSegmentsTableUpdateCompanionBuilder,
    (
      TranscriptSegment,
      BaseReferences<_$AppDatabase, $TranscriptSegmentsTable, TranscriptSegment>
    ),
    TranscriptSegment,
    PrefetchHooks Function()>;
typedef $$TopicsTableCreateCompanionBuilder = TopicsCompanion Function({
  Value<int> id,
  Value<String?> remoteId,
  required int lectureId,
  required double startSeconds,
  required double endSeconds,
  required String title,
  required String summary,
  required int importance,
  required String keywordsJson,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  required String deviceId,
  Value<int> version,
});
typedef $$TopicsTableUpdateCompanionBuilder = TopicsCompanion Function({
  Value<int> id,
  Value<String?> remoteId,
  Value<int> lectureId,
  Value<double> startSeconds,
  Value<double> endSeconds,
  Value<String> title,
  Value<String> summary,
  Value<int> importance,
  Value<String> keywordsJson,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<String> deviceId,
  Value<int> version,
});

class $$TopicsTableFilterComposer
    extends Composer<_$AppDatabase, $TopicsTable> {
  $$TopicsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lectureId => $composableBuilder(
      column: $table.lectureId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get startSeconds => $composableBuilder(
      column: $table.startSeconds, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get endSeconds => $composableBuilder(
      column: $table.endSeconds, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get summary => $composableBuilder(
      column: $table.summary, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get importance => $composableBuilder(
      column: $table.importance, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get keywordsJson => $composableBuilder(
      column: $table.keywordsJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deviceId => $composableBuilder(
      column: $table.deviceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));
}

class $$TopicsTableOrderingComposer
    extends Composer<_$AppDatabase, $TopicsTable> {
  $$TopicsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lectureId => $composableBuilder(
      column: $table.lectureId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get startSeconds => $composableBuilder(
      column: $table.startSeconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get endSeconds => $composableBuilder(
      column: $table.endSeconds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get summary => $composableBuilder(
      column: $table.summary, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get importance => $composableBuilder(
      column: $table.importance, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get keywordsJson => $composableBuilder(
      column: $table.keywordsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deviceId => $composableBuilder(
      column: $table.deviceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));
}

class $$TopicsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TopicsTable> {
  $$TopicsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<int> get lectureId =>
      $composableBuilder(column: $table.lectureId, builder: (column) => column);

  GeneratedColumn<double> get startSeconds => $composableBuilder(
      column: $table.startSeconds, builder: (column) => column);

  GeneratedColumn<double> get endSeconds => $composableBuilder(
      column: $table.endSeconds, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<int> get importance => $composableBuilder(
      column: $table.importance, builder: (column) => column);

  GeneratedColumn<String> get keywordsJson => $composableBuilder(
      column: $table.keywordsJson, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);
}

class $$TopicsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TopicsTable,
    Topic,
    $$TopicsTableFilterComposer,
    $$TopicsTableOrderingComposer,
    $$TopicsTableAnnotationComposer,
    $$TopicsTableCreateCompanionBuilder,
    $$TopicsTableUpdateCompanionBuilder,
    (Topic, BaseReferences<_$AppDatabase, $TopicsTable, Topic>),
    Topic,
    PrefetchHooks Function()> {
  $$TopicsTableTableManager(_$AppDatabase db, $TopicsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TopicsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TopicsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TopicsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<int> lectureId = const Value.absent(),
            Value<double> startSeconds = const Value.absent(),
            Value<double> endSeconds = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> summary = const Value.absent(),
            Value<int> importance = const Value.absent(),
            Value<String> keywordsJson = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<String> deviceId = const Value.absent(),
            Value<int> version = const Value.absent(),
          }) =>
              TopicsCompanion(
            id: id,
            remoteId: remoteId,
            lectureId: lectureId,
            startSeconds: startSeconds,
            endSeconds: endSeconds,
            title: title,
            summary: summary,
            importance: importance,
            keywordsJson: keywordsJson,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            deviceId: deviceId,
            version: version,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            required int lectureId,
            required double startSeconds,
            required double endSeconds,
            required String title,
            required String summary,
            required int importance,
            required String keywordsJson,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            required String deviceId,
            Value<int> version = const Value.absent(),
          }) =>
              TopicsCompanion.insert(
            id: id,
            remoteId: remoteId,
            lectureId: lectureId,
            startSeconds: startSeconds,
            endSeconds: endSeconds,
            title: title,
            summary: summary,
            importance: importance,
            keywordsJson: keywordsJson,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            deviceId: deviceId,
            version: version,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TopicsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TopicsTable,
    Topic,
    $$TopicsTableFilterComposer,
    $$TopicsTableOrderingComposer,
    $$TopicsTableAnnotationComposer,
    $$TopicsTableCreateCompanionBuilder,
    $$TopicsTableUpdateCompanionBuilder,
    (Topic, BaseReferences<_$AppDatabase, $TopicsTable, Topic>),
    Topic,
    PrefetchHooks Function()>;
typedef $$LectureSummariesTableCreateCompanionBuilder
    = LectureSummariesCompanion Function({
  Value<int> id,
  required int lectureId,
  Value<String?> remoteId,
  required String overallSummary,
  required String reviewPointsJson,
  required String examPointsJson,
  required String keywordsJson,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  required String deviceId,
  Value<int> version,
});
typedef $$LectureSummariesTableUpdateCompanionBuilder
    = LectureSummariesCompanion Function({
  Value<int> id,
  Value<int> lectureId,
  Value<String?> remoteId,
  Value<String> overallSummary,
  Value<String> reviewPointsJson,
  Value<String> examPointsJson,
  Value<String> keywordsJson,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<String> syncStatus,
  Value<String> deviceId,
  Value<int> version,
});

class $$LectureSummariesTableFilterComposer
    extends Composer<_$AppDatabase, $LectureSummariesTable> {
  $$LectureSummariesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lectureId => $composableBuilder(
      column: $table.lectureId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get overallSummary => $composableBuilder(
      column: $table.overallSummary,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reviewPointsJson => $composableBuilder(
      column: $table.reviewPointsJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get examPointsJson => $composableBuilder(
      column: $table.examPointsJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get keywordsJson => $composableBuilder(
      column: $table.keywordsJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deviceId => $composableBuilder(
      column: $table.deviceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));
}

class $$LectureSummariesTableOrderingComposer
    extends Composer<_$AppDatabase, $LectureSummariesTable> {
  $$LectureSummariesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lectureId => $composableBuilder(
      column: $table.lectureId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get overallSummary => $composableBuilder(
      column: $table.overallSummary,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reviewPointsJson => $composableBuilder(
      column: $table.reviewPointsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get examPointsJson => $composableBuilder(
      column: $table.examPointsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get keywordsJson => $composableBuilder(
      column: $table.keywordsJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deviceId => $composableBuilder(
      column: $table.deviceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));
}

class $$LectureSummariesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LectureSummariesTable> {
  $$LectureSummariesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get lectureId =>
      $composableBuilder(column: $table.lectureId, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get overallSummary => $composableBuilder(
      column: $table.overallSummary, builder: (column) => column);

  GeneratedColumn<String> get reviewPointsJson => $composableBuilder(
      column: $table.reviewPointsJson, builder: (column) => column);

  GeneratedColumn<String> get examPointsJson => $composableBuilder(
      column: $table.examPointsJson, builder: (column) => column);

  GeneratedColumn<String> get keywordsJson => $composableBuilder(
      column: $table.keywordsJson, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);
}

class $$LectureSummariesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LectureSummariesTable,
    LectureSummary,
    $$LectureSummariesTableFilterComposer,
    $$LectureSummariesTableOrderingComposer,
    $$LectureSummariesTableAnnotationComposer,
    $$LectureSummariesTableCreateCompanionBuilder,
    $$LectureSummariesTableUpdateCompanionBuilder,
    (
      LectureSummary,
      BaseReferences<_$AppDatabase, $LectureSummariesTable, LectureSummary>
    ),
    LectureSummary,
    PrefetchHooks Function()> {
  $$LectureSummariesTableTableManager(
      _$AppDatabase db, $LectureSummariesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LectureSummariesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LectureSummariesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LectureSummariesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> lectureId = const Value.absent(),
            Value<String?> remoteId = const Value.absent(),
            Value<String> overallSummary = const Value.absent(),
            Value<String> reviewPointsJson = const Value.absent(),
            Value<String> examPointsJson = const Value.absent(),
            Value<String> keywordsJson = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<String> deviceId = const Value.absent(),
            Value<int> version = const Value.absent(),
          }) =>
              LectureSummariesCompanion(
            id: id,
            lectureId: lectureId,
            remoteId: remoteId,
            overallSummary: overallSummary,
            reviewPointsJson: reviewPointsJson,
            examPointsJson: examPointsJson,
            keywordsJson: keywordsJson,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            deviceId: deviceId,
            version: version,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int lectureId,
            Value<String?> remoteId = const Value.absent(),
            required String overallSummary,
            required String reviewPointsJson,
            required String examPointsJson,
            required String keywordsJson,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            required String deviceId,
            Value<int> version = const Value.absent(),
          }) =>
              LectureSummariesCompanion.insert(
            id: id,
            lectureId: lectureId,
            remoteId: remoteId,
            overallSummary: overallSummary,
            reviewPointsJson: reviewPointsJson,
            examPointsJson: examPointsJson,
            keywordsJson: keywordsJson,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            syncStatus: syncStatus,
            deviceId: deviceId,
            version: version,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LectureSummariesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LectureSummariesTable,
    LectureSummary,
    $$LectureSummariesTableFilterComposer,
    $$LectureSummariesTableOrderingComposer,
    $$LectureSummariesTableAnnotationComposer,
    $$LectureSummariesTableCreateCompanionBuilder,
    $$LectureSummariesTableUpdateCompanionBuilder,
    (
      LectureSummary,
      BaseReferences<_$AppDatabase, $LectureSummariesTable, LectureSummary>
    ),
    LectureSummary,
    PrefetchHooks Function()>;
typedef $$SyncQueueTableCreateCompanionBuilder = SyncQueueCompanion Function({
  Value<int> id,
  required String entityType,
  required int entityId,
  required String action,
  required DateTime createdAt,
  Value<int> retryCount,
  Value<String?> lastError,
});
typedef $$SyncQueueTableUpdateCompanionBuilder = SyncQueueCompanion Function({
  Value<int> id,
  Value<String> entityType,
  Value<int> entityId,
  Value<String> action,
  Value<DateTime> createdAt,
  Value<int> retryCount,
  Value<String?> lastError,
});

class $$SyncQueueTableFilterComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get action => $composableBuilder(
      column: $table.action, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnFilters(column));
}

class $$SyncQueueTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get action => $composableBuilder(
      column: $table.action, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnOrderings(column));
}

class $$SyncQueueTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncQueueTable> {
  $$SyncQueueTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => column);

  GeneratedColumn<int> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => column);

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);
}

class $$SyncQueueTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SyncQueueTable,
    SyncQueueData,
    $$SyncQueueTableFilterComposer,
    $$SyncQueueTableOrderingComposer,
    $$SyncQueueTableAnnotationComposer,
    $$SyncQueueTableCreateCompanionBuilder,
    $$SyncQueueTableUpdateCompanionBuilder,
    (
      SyncQueueData,
      BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueData>
    ),
    SyncQueueData,
    PrefetchHooks Function()> {
  $$SyncQueueTableTableManager(_$AppDatabase db, $SyncQueueTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> entityType = const Value.absent(),
            Value<int> entityId = const Value.absent(),
            Value<String> action = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> retryCount = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
          }) =>
              SyncQueueCompanion(
            id: id,
            entityType: entityType,
            entityId: entityId,
            action: action,
            createdAt: createdAt,
            retryCount: retryCount,
            lastError: lastError,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String entityType,
            required int entityId,
            required String action,
            required DateTime createdAt,
            Value<int> retryCount = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
          }) =>
              SyncQueueCompanion.insert(
            id: id,
            entityType: entityType,
            entityId: entityId,
            action: action,
            createdAt: createdAt,
            retryCount: retryCount,
            lastError: lastError,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SyncQueueTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SyncQueueTable,
    SyncQueueData,
    $$SyncQueueTableFilterComposer,
    $$SyncQueueTableOrderingComposer,
    $$SyncQueueTableAnnotationComposer,
    $$SyncQueueTableCreateCompanionBuilder,
    $$SyncQueueTableUpdateCompanionBuilder,
    (
      SyncQueueData,
      BaseReferences<_$AppDatabase, $SyncQueueTable, SyncQueueData>
    ),
    SyncQueueData,
    PrefetchHooks Function()>;
typedef $$ExportLogsTableCreateCompanionBuilder = ExportLogsCompanion Function({
  Value<int> id,
  required int lectureId,
  required String target,
  required String filePath,
  required DateTime exportedAt,
  required String status,
  Value<String?> errorMessage,
});
typedef $$ExportLogsTableUpdateCompanionBuilder = ExportLogsCompanion Function({
  Value<int> id,
  Value<int> lectureId,
  Value<String> target,
  Value<String> filePath,
  Value<DateTime> exportedAt,
  Value<String> status,
  Value<String?> errorMessage,
});

class $$ExportLogsTableFilterComposer
    extends Composer<_$AppDatabase, $ExportLogsTable> {
  $$ExportLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lectureId => $composableBuilder(
      column: $table.lectureId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get target => $composableBuilder(
      column: $table.target, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get exportedAt => $composableBuilder(
      column: $table.exportedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get errorMessage => $composableBuilder(
      column: $table.errorMessage, builder: (column) => ColumnFilters(column));
}

class $$ExportLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $ExportLogsTable> {
  $$ExportLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lectureId => $composableBuilder(
      column: $table.lectureId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get target => $composableBuilder(
      column: $table.target, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get filePath => $composableBuilder(
      column: $table.filePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get exportedAt => $composableBuilder(
      column: $table.exportedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get errorMessage => $composableBuilder(
      column: $table.errorMessage,
      builder: (column) => ColumnOrderings(column));
}

class $$ExportLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExportLogsTable> {
  $$ExportLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get lectureId =>
      $composableBuilder(column: $table.lectureId, builder: (column) => column);

  GeneratedColumn<String> get target =>
      $composableBuilder(column: $table.target, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<DateTime> get exportedAt => $composableBuilder(
      column: $table.exportedAt, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get errorMessage => $composableBuilder(
      column: $table.errorMessage, builder: (column) => column);
}

class $$ExportLogsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExportLogsTable,
    ExportLog,
    $$ExportLogsTableFilterComposer,
    $$ExportLogsTableOrderingComposer,
    $$ExportLogsTableAnnotationComposer,
    $$ExportLogsTableCreateCompanionBuilder,
    $$ExportLogsTableUpdateCompanionBuilder,
    (ExportLog, BaseReferences<_$AppDatabase, $ExportLogsTable, ExportLog>),
    ExportLog,
    PrefetchHooks Function()> {
  $$ExportLogsTableTableManager(_$AppDatabase db, $ExportLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExportLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExportLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExportLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> lectureId = const Value.absent(),
            Value<String> target = const Value.absent(),
            Value<String> filePath = const Value.absent(),
            Value<DateTime> exportedAt = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> errorMessage = const Value.absent(),
          }) =>
              ExportLogsCompanion(
            id: id,
            lectureId: lectureId,
            target: target,
            filePath: filePath,
            exportedAt: exportedAt,
            status: status,
            errorMessage: errorMessage,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int lectureId,
            required String target,
            required String filePath,
            required DateTime exportedAt,
            required String status,
            Value<String?> errorMessage = const Value.absent(),
          }) =>
              ExportLogsCompanion.insert(
            id: id,
            lectureId: lectureId,
            target: target,
            filePath: filePath,
            exportedAt: exportedAt,
            status: status,
            errorMessage: errorMessage,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ExportLogsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ExportLogsTable,
    ExportLog,
    $$ExportLogsTableFilterComposer,
    $$ExportLogsTableOrderingComposer,
    $$ExportLogsTableAnnotationComposer,
    $$ExportLogsTableCreateCompanionBuilder,
    $$ExportLogsTableUpdateCompanionBuilder,
    (ExportLog, BaseReferences<_$AppDatabase, $ExportLogsTable, ExportLog>),
    ExportLog,
    PrefetchHooks Function()>;
typedef $$AppSettingsTableCreateCompanionBuilder = AppSettingsCompanion
    Function({
  required String key,
  required String value,
  Value<int> rowid,
});
typedef $$AppSettingsTableUpdateCompanionBuilder = AppSettingsCompanion
    Function({
  Value<String> key,
  Value<String> value,
  Value<int> rowid,
});

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$AppSettingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (AppSetting, BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>),
    AppSetting,
    PrefetchHooks Function()> {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AppSettingsCompanion(
            key: key,
            value: value,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String key,
            required String value,
            Value<int> rowid = const Value.absent(),
          }) =>
              AppSettingsCompanion.insert(
            key: key,
            value: value,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppSettingsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (AppSetting, BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>),
    AppSetting,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LecturesTableTableManager get lectures =>
      $$LecturesTableTableManager(_db, _db.lectures);
  $$TranscriptSegmentsTableTableManager get transcriptSegments =>
      $$TranscriptSegmentsTableTableManager(_db, _db.transcriptSegments);
  $$TopicsTableTableManager get topics =>
      $$TopicsTableTableManager(_db, _db.topics);
  $$LectureSummariesTableTableManager get lectureSummaries =>
      $$LectureSummariesTableTableManager(_db, _db.lectureSummaries);
  $$SyncQueueTableTableManager get syncQueue =>
      $$SyncQueueTableTableManager(_db, _db.syncQueue);
  $$ExportLogsTableTableManager get exportLogs =>
      $$ExportLogsTableTableManager(_db, _db.exportLogs);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
}
