import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String section) onNavTap;
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const NavBar({
    super.key,
    required this.onNavTap,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final showDesktopNav = width >= 900;

    return Container(
      height: preferredSize.height,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor.withValues(alpha: 0.95),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Brand Title
          InkWell(
            onTap: () => onNavTap('Hero'),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'MR',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Muhamed Roshdy',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Right Side Links & Theme Toggle
          Row(
            children: [
              if (showDesktopNav) ...[
                _NavButton(title: 'About', onTap: () => onNavTap('About')),
                _NavButton(title: 'Skills', onTap: () => onNavTap('Skills')),
                _NavButton(title: 'Experience', onTap: () => onNavTap('Experience')),
                _NavButton(title: 'Achievements', onTap: () => onNavTap('Achievements')),
                _NavButton(title: 'Projects', onTap: () => onNavTap('Projects')),
                _NavButton(title: 'Contact', onTap: () => onNavTap('Contact')),
                const SizedBox(width: 12),
              ],

              // Theme Toggle Button
              IconButton(
                icon: Icon(
                  isDarkMode ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                  color: theme.colorScheme.primary,
                ),
                onPressed: onThemeToggle,
                tooltip: 'Toggle Light/Dark Theme',
              ),

              if (!showDesktopNav) ...[
                IconButton(
                  icon: Icon(Icons.menu_rounded, color: theme.colorScheme.primary),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavButton({
    required this.title,
    required this.onTap,
  });

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: TextButton(
        onPressed: widget.onTap,
        child: Text(
          widget.title,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: _isHovered ? FontWeight.bold : FontWeight.w500,
            color: _isHovered
                ? theme.colorScheme.primary
                : theme.textTheme.bodyLarge?.color,
          ),
        ),
      ),
    );
  }
}
