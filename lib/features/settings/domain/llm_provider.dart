enum LlmProvider {
  groq,
  openRouter,
  gemini,
  m365Proxy,
}

extension LlmProviderX on LlmProvider {
  String get label => switch (this) {
        LlmProvider.groq => 'Groq',
        LlmProvider.openRouter => 'OpenRouter',
        LlmProvider.gemini => 'Gemini',
        LlmProvider.m365Proxy => 'M365 Proxy',
      };

  String get description => switch (this) {
        LlmProvider.groq => 'OpenAI互換API。低遅延の推論向け。',
        LlmProvider.openRouter => 'OpenRouter経由で各種モデルを利用。',
        LlmProvider.gemini => 'Gemini APIを直接呼び出します。',
        LlmProvider.m365Proxy => '社内/独自プロキシのOpenAI互換API。',
      };

  String get defaultModel => switch (this) {
        LlmProvider.groq => 'llama-3.3-70b-versatile',
        LlmProvider.openRouter => 'openai/gpt-4o-mini',
        LlmProvider.gemini => 'gemini-2.0-flash',
        LlmProvider.m365Proxy => 'gpt-4o-mini',
      };

  String get defaultBaseUrl => switch (this) {
        LlmProvider.groq => 'https://api.groq.com/openai/v1',
        LlmProvider.openRouter => 'https://openrouter.ai/api/v1',
        LlmProvider.gemini => 'https://generativelanguage.googleapis.com/v1beta',
        LlmProvider.m365Proxy => '',
      };

  bool get isGemini => this == LlmProvider.gemini;
}
