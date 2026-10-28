import 'package:flutter/material.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/section_title.dart';
import '../../widgets/animated_counter.dart';
import '../../core/utils/responsive.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
            subtitle: 'About Me',
            title: 'Professional Overview & Impact',
          ),
          // Summary Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                PortfolioData.aboutSummary,
                style: theme.textTheme.bodyLarge?.copyWith(
                  height: 1.7,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          // Quick Stats Grid / Row
          LayoutBuilder(
            builder: (context, constraints) {
              final double cardWidth = constraints.maxWidth > 800
                  ? (constraints.maxWidth - (3 * 16)) / 4
                  : (constraints.maxWidth > 500
                      ? (constraints.maxWidth - 16) / 2
                      : constraints.maxWidth);

              return Wrap(
                spacing: 16,
                runSpacing: 16,
                children: PortfolioData.stats.map((stat) {
                  return SizedBox(
                    width: cardWidth,
                    child: AnimatedCounterCard(
                      value: stat.value,
                      label: stat.label,
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
