import 'package:flutter/material.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/section_title.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/url_helper.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = Responsive.isMobile(context);
    final hero = PortfolioData.hero;

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
            subtitle: 'Get In Touch',
            title: 'Let\'s Build Something Great Together',
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Text(
                    'I am always open to discussing senior technical roles, mobile team leadership, architecture consulting, or high-impact projects.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    alignment: WrapAlignment.center,
                    children: [
                      _ContactTile(
                        icon: Icons.email_rounded,
                        title: 'Email',
                        value: hero.email,
                        onTap: () => UrlHelper.launchEmail(hero.email),
                      ),
                      _ContactTile(
                        icon: Icons.phone_rounded,
                        title: 'Phone',
                        value: hero.phone,
                        onTap: () => UrlHelper.launchPhone(hero.phone),
                      ),
                      _ContactTile(
                        icon: Icons.location_on_rounded,
                        title: 'Location',
                        value: hero.location,
                        onTap: () {},
                      ),
                      _ContactTile(
                        icon: Icons.link_rounded,
                        title: 'LinkedIn',
                        value: 'Connect on LinkedIn',
                        onTap: () => UrlHelper.launchUrlString(hero.linkedinUrl),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    onPressed: () => UrlHelper.launchEmail(
                      hero.email,
                      subject: 'Opportunity / Inquiry for Muhamed Roshdy',
                    ),
                    icon: const Icon(Icons.send_rounded),
                    label: const Text('Send Direct Email'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback onTap;

  const _ContactTile({
    required this.icon,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 240,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: theme.colorScheme.primary.withValues(alpha: 0.2),
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 28,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
