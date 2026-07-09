import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../db/app_database.dart' as db;
import '../domain/llm_provider.dart';
import '../domain/llm_settings.dart';

final llmSettingsRepositoryProvider = Provider<LlmSettingsRepository>((ref) {
  final database = ref.watch(db.appDatabaseProvider);
  return LlmSettingsRepository(database);
});

final llmSettingsProvider = FutureProvider<LlmSettings>((ref) {
  return ref.watch(llmSettingsRepositoryProvider).load();
});

class LlmSettingsRepository {
  final db.AppDatabase _database;

  const LlmSettingsRepository(this._database);

  static const _providerKey = 'llm.provider';
  static const _apiKeyKey = 'llm.api_key';
  static const _modelKey = 'llm.model_name';
  static const _baseUrlKey = 'llm.base_url';

  Future<LlmSettings> load() async {
    final rows = await (_database.select(_database.appSettings)
          ..where((tbl) => tbl.key.isIn([
                _providerKey,
                _apiKeyKey,
                _modelKey,
                _baseUrlKey,
              ])))
        .get();

    final values = <String, String>{};
    for (final row in rows) {
      values[row.key] = row.value;
    }

    final provider = _parseProvider(values[_providerKey]);
    return LlmSettings(
      provider: provider,
      apiKey: values[_apiKeyKey] ?? '',
      modelName: values[_modelKey] ?? provider.defaultModel,
      baseUrl: values[_baseUrlKey] ?? provider.defaultBaseUrl,
    );
  }

  Future<void> save(LlmSettings settings) async {
    await _database.batch((batch) {
      batch.insert(
        _database.appSettings,
        db.AppSettingsCompanion.insert(
          key: _providerKey,
          value: settings.provider.name,
        ),
        mode: InsertMode.insertOrReplace,
      );
      batch.insert(
        _database.appSettings,
        db.AppSettingsCompanion.insert(
          key: _apiKeyKey,
          value: settings.apiKey,
        ),
        mode: InsertMode.insertOrReplace,
      );
      batch.insert(
        _database.appSettings,
        db.AppSettingsCompanion.insert(
          key: _modelKey,
          value: settings.modelName,
        ),
        mode: InsertMode.insertOrReplace,
      );
      batch.insert(
        _database.appSettings,
        db.AppSettingsCompanion.insert(
          key: _baseUrlKey,
          value: settings.baseUrl,
        ),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  LlmProvider _parseProvider(String? raw) {
    for (final provider in LlmProvider.values) {
      if (provider.name == raw) return provider;
    }
    return LlmProvider.groq;
  }
}
