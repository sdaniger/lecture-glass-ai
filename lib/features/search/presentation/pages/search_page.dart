import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/glass_scaffold.dart';
import '../../data/search_service.dart';
import '../../domain/search_service_interface.dart';

final searchResultsProvider = FutureProvider.family<List<SearchResult>, String>(
  (ref, query) async {
    final service = ref.watch(searchServiceProvider);
    return service.search(query);
  },
);

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final _controller = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final resultsAsync = ref.watch(searchResultsProvider(_query));

    return GlassScaffold(
      appBar: AppBar(title: const Text('検索')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: '講義タイトル・文字起こし・話題を検索',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _query.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          setState(() => _query = '');
                        },
                      )
                    : null,
              ),
              onSubmitted: (v) => setState(() => _query = v),
              onChanged: (v) {
                if (v.isEmpty) setState(() => _query = '');
              },
            ),
          ),
          Expanded(
            child: _query.isEmpty
                ? Center(
                    child: Text(
                      '検索キーワードを入力してください',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  )
                : resultsAsync.when(
                    data: (results) => _buildResults(results, theme),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (e, _) => Center(child: Text('エラー: $e')),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildResults(List<SearchResult> results, ThemeData theme) {
    if (results.isEmpty) {
      return Center(
        child: Text(
          '結果が見つかりませんでした',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final r = results[index];
        return GlassCard(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: Icon(_sourceIcon(r.source)),
            title: Text(r.lectureTitle),
            subtitle: r.matchedText != null
                ? Text(
                    r.matchedText!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                : null,
            trailing: _sourceLabel(r.source),
            onTap: () {},
          ),
        );
      },
    );
  }

  IconData _sourceIcon(String source) {
    switch (source) {
      case 'lecture':
        return Icons.book;
      case 'transcript':
        return Icons.article;
      case 'topic':
        return Icons.topic;
      default:
        return Icons.search;
    }
  }

  Widget _sourceLabel(String source) {
    final colors = {
      'lecture': Colors.blue,
      'transcript': Colors.green,
      'topic': Colors.orange,
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: colors[source]?.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        source == 'lecture' ? '講義' : source == 'transcript' ? '文字起こし' : '話題',
        style: TextStyle(fontSize: 11, color: colors[source]),
      ),
    );
  }
}
