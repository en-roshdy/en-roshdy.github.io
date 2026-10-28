import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final VoidCallback onBackToTop;

  const Footer({
    super.key,
    required this.onBackToTop,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: theme.dividerColor.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '© ${DateTime.now().year} Muhamed Roshdy Al-Abd. Built with Flutter Web.',
              style: theme.textTheme.bodyMedium,
            ),
          ),
          IconButton(
            onPressed: onBackToTop,
            icon: Icon(
              Icons.arrow_upward_rounded,
              color: theme.colorScheme.primary,
            ),
            tooltip: 'Back to top',
          ),
        ],
      ),
    );
  }
}
