import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/lectures/presentation/pages/dashboard_page.dart';
import '../features/lectures/presentation/pages/lecture_list_page.dart';
import '../features/lectures/presentation/pages/lecture_detail_page.dart';
import '../features/lectures/presentation/pages/add_lecture_page.dart';
import '../features/settings/presentation/pages/settings_page.dart';
import '../features/sync/presentation/pages/sync_settings_page.dart';
import '../features/obsidian/presentation/pages/obsidian_settings_page.dart';
import '../features/recording/presentation/pages/record_lecture_page.dart';
import '../features/search/presentation/pages/search_page.dart';
import '../features/lectures/presentation/widgets/app_shell.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/lectures',
    routes: [
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(
            path: '/dashboard',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: DashboardPage(),
            ),
          ),
          GoRoute(
            path: '/lectures',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: LectureListPage(),
            ),
          ),
          GoRoute(
            path: '/record-lecture',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: RecordLecturePage(),
            ),
          ),
          GoRoute(
            path: '/search',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SearchPage(),
            ),
          ),
          GoRoute(
            path: '/sync',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SyncSettingsPage(),
            ),
          ),
          GoRoute(
            path: '/settings',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SettingsPage(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/add-lecture',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const AddLecturePage(),
      ),
      GoRoute(
        path: '/lectures/:id',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => LectureDetailPage(
          lectureId: int.parse(state.pathParameters['id']!),
        ),
      ),
      GoRoute(
        path: '/obsidian-settings',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const ObsidianSettingsPage(),
      ),
    ],
  );
});
