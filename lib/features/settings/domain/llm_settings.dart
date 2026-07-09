import 'llm_provider.dart';

class LlmSettings {
  final LlmProvider provider;
  final String apiKey;
  final String modelName;
  final String baseUrl;

  const LlmSettings({
    required this.provider,
    required this.apiKey,
    required this.modelName,
    required this.baseUrl,
  });

  factory LlmSettings.defaults() {
    return LlmSettings(
      provider: LlmProvider.groq,
      apiKey: '',
      modelName: LlmProvider.groq.defaultModel,
      baseUrl: LlmProvider.groq.defaultBaseUrl,
    );
  }

  String get resolvedModelName =>
      modelName.trim().isEmpty ? provider.defaultModel : modelName.trim();

  String get resolvedBaseUrl {
    final trimmed = baseUrl.trim();
    if (trimmed.isNotEmpty) return trimmed;
    return provider.defaultBaseUrl;
  }

  LlmSettings copyWith({
    LlmProvider? provider,
    String? apiKey,
    String? modelName,
    String? baseUrl,
  }) {
    return LlmSettings(
      provider: provider ?? this.provider,
      apiKey: apiKey ?? this.apiKey,
      modelName: modelName ?? this.modelName,
      baseUrl: baseUrl ?? this.baseUrl,
    );
  }
}
