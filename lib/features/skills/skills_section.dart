import 'package:flutter/material.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/section_title.dart';
import '../../widgets/skill_chip.dart';
import '../../core/utils/responsive.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  IconData _getCategoryIcon(String iconName) {
    switch (iconName) {
      case 'code':
        return Icons.code_rounded;
      case 'smartphone':
        return Icons.smartphone_rounded;
      case 'architecture':
        return Icons.account_tree_rounded;
      case 'sync':
        return Icons.sync_rounded;
      case 'extension':
        return Icons.extension_rounded;
      case 'cloud':
        return Icons.cloud_outlined;
      case 'verified':
        return Icons.verified_user_outlined;
      case 'build':
        return Icons.build_rounded;
      default:
        return Icons.star_outline_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            subtitle: 'Technical Skills',
            title: 'Expertise & Technologies',
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final double cardWidth = constraints.maxWidth > 900
                  ? (constraints.maxWidth - 24) / 2
                  : constraints.maxWidth;

              return Wrap(
                spacing: 24,
                runSpacing: 24,
                children: PortfolioData.skillCategories.map((category) {
                  return SizedBox(
                    width: cardWidth,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.primary.withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    _getCategoryIcon(category.icon),
                                    color: theme.colorScheme.primary,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    category.categoryName,
                                    style: theme.textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: category.skills.map((skill) {
                                return SkillChip(label: skill);
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
