import 'package:flutter/material.dart';

class SkillChip extends StatefulWidget {
  final String label;

  const SkillChip({
    super.key,
    required this.label,
  });

  @override
  State<SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: _isHovered
              ? theme.colorScheme.primary.withValues(alpha: 0.2)
              : (isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0)),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered
                ? theme.colorScheme.primary
                : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Text(
          widget.label,
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
