import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../app/theme/app_radius.dart';
import '../../app/theme/app_typography.dart';

class AppSidebar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemSelected;
  final String appTitle;

  const AppSidebar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
    this.appTitle = 'LectureGlass AI',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: AppColors.surfaceDark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.primary, AppColors.accent],
                    ),
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                  child: const Icon(
                    Icons.menu_book_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  appTitle,
                  style: AppTypography.titleLarge,
                ),
              ],
            ),
          ),
          const Divider(color: AppColors.borderGlass, height: 1),
          const SizedBox(height: AppSpacing.sm),
          ..._navItems.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final isSelected = index == currentIndex;
            return _SidebarItem(
              icon: item.icon,
              label: item.label,
              isSelected: isSelected,
              onTap: () => onItemSelected(index),
            );
          }),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Text(
              'v1.0.0',
              style: AppTypography.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}

final _navItems = const [
  _NavItem(icon: Icons.dashboard_rounded, label: 'ダッシュボード'),
  _NavItem(icon: Icons.library_books_rounded, label: '講義一覧'),
  _NavItem(icon: Icons.mic_rounded, label: '録音'),
  _NavItem(icon: Icons.search_rounded, label: '検索'),
  _NavItem(icon: Icons.sync_rounded, label: '同期'),
  _NavItem(icon: Icons.settings_rounded, label: '設定'),
];

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _SidebarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Material(
        color: isSelected
            ? AppColors.primary.withValues(alpha: 0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(AppRadius.sm),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.sm),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: isSelected ? AppColors.primary : AppColors.textSecondary,
                ),
                const SizedBox(width: 12),
                Text(
                  label,
                  style: AppTypography.titleMedium.copyWith(
                    color:
                        isSelected ? AppColors.primary : AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
