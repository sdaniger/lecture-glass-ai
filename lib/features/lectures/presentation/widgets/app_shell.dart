import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/responsive_shell.dart';
import '../../../../shared/widgets/app_sidebar.dart';
import '../../../../shared/widgets/app_bottom_navigation.dart';

class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/dashboard')) return 0;
    if (location.startsWith('/lectures')) return 1;
    if (location.startsWith('/record-lecture')) return 2;
    if (location.startsWith('/search')) return 3;
    if (location.startsWith('/sync')) return 4;
    if (location.startsWith('/settings')) return 5;
    return 1;
  }

  void _onItemSelected(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/dashboard');
        break;
      case 1:
        context.go('/lectures');
        break;
      case 2:
        context.go('/record-lecture');
        break;
      case 3:
        context.go('/search');
        break;
      case 4:
        context.go('/sync');
        break;
      case 5:
        context.go('/settings');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _currentIndex(context);
    final isWide = ResponsiveShell.isWide(context);

    return ResponsiveShell(
      sidebar: isWide
          ? AppSidebar(
              currentIndex: currentIndex,
              onItemSelected: (index) => _onItemSelected(context, index),
            )
          : null,
      body: child,
      bottomNavigationBar:
          isWide ? null : AppBottomNavigation(
              currentIndex: currentIndex,
              onItemSelected: (index) => _onItemSelected(context, index),
            ),
    );
  }
}
