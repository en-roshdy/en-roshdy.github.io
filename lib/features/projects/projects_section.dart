import 'package:flutter/material.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/section_title.dart';
import '../../widgets/project_card.dart';
import '../../core/utils/responsive.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
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
            subtitle: 'Portfolio',
            title: 'Featured Production Projects',
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              final double cardWidth = constraints.maxWidth > 900
                  ? (constraints.maxWidth - 24) / 2
                  : constraints.maxWidth;

              return Wrap(
                spacing: 24,
                runSpacing: 24,
                children: PortfolioData.projects.map((project) {
                  return SizedBox(
                    width: cardWidth,
                    child: ProjectCard(project: project),
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
