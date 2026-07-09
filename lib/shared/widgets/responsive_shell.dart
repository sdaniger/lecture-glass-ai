import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import 'glass_scaffold.dart';

class ResponsiveShell extends StatelessWidget {
  final Widget? sidebar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? appBar;
  final Widget? floatingActionButton;

  const ResponsiveShell({
    super.key,
    this.sidebar,
    required this.body,
    this.bottomNavigationBar,
    this.appBar,
    this.floatingActionButton,
  });

  static bool isWide(BuildContext context) =>
      MediaQuery.of(context).size.width >= 900;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 900;

  @override
  Widget build(BuildContext context) {
    final wide = isWide(context);

    if (wide && sidebar != null) {
      return GlassScaffold(
        appBar: appBar as PreferredSizeWidget?,
        floatingActionButton: floatingActionButton,
        body: Row(
          children: [
            SizedBox(
              width: 260,
              child: sidebar!,
            ),
            const VerticalDivider(width: 1, color: AppColors.borderGlass),
            Expanded(child: body),
          ],
        ),
      );
    }

    return GlassScaffold(
      appBar: appBar as PreferredSizeWidget?,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
