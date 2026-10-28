import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/portfolio_data.dart';
import '../../core/utils/responsive.dart';
import '../../core/utils/url_helper.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onContactTap;

  const HeroSection({
    super.key,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hero = PortfolioData.hero;
    final isMobile = Responsive.isMobile(context);

    final textContent = Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Greeting badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '👋 Hello, I am',
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Name
        Text(
          hero.name,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: theme.textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 12),
        // Title
        Text(
          hero.title,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        // Location
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 18,
              color: theme.colorScheme.secondary,
            ),
            const SizedBox(width: 6),
            Text(
              hero.location,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Tagline
        Text(
          hero.tagline,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: theme.textTheme.bodyLarge?.copyWith(
            height: 1.6,
          ),
        ),
        const SizedBox(height: 28),
        // CTA Buttons
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            ElevatedButton.icon(
              onPressed: onContactTap,
              icon: const Icon(Icons.mail_outline_rounded),
              label: const Text('Contact Me'),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {
                UrlHelper.launchUrlString(
                  hero.cvAssetPath,
                  mode: LaunchMode.externalApplication,
                  webOnlyWindowName: '_blank',
                );
              },
              icon: const Icon(Icons.download_rounded),
              label: const Text('Download CV'),
              style: OutlinedButton.styleFrom(
                foregroundColor: theme.colorScheme.primary,
                side: BorderSide(color: theme.colorScheme.primary, width: 2),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Social Row
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.email_outlined),
              onPressed: () => UrlHelper.launchEmail(hero.email),
              tooltip: hero.email,
            ),
            IconButton(
              icon: const Icon(Icons.phone_outlined),
              onPressed: () => UrlHelper.launchPhone(hero.phone),
              tooltip: hero.phone,
            ),
            IconButton(
              icon: const Icon(Icons.link_rounded),
              onPressed: () => UrlHelper.launchUrlString(hero.linkedinUrl),
              tooltip: 'LinkedIn Profile',
            ),
          ],
        ),
      ],
    );

    // Profile Avatar
    final avatarWidget = Center(
      child: Container(
        width: isMobile ? 200 : 280,
        height: isMobile ? 200 : 280,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.primary,
              theme.colorScheme.secondary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary.withValues(alpha: 0.3),
              blurRadius: 30,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.scaffoldBackgroundColor,
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              'assets/my_photo.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.person_rounded,
                  size: isMobile ? 100 : 140,
                  color: theme.colorScheme.primary,
                );
              },
            ),
          ),
        ),
      ),
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: 60,
      ),
      child: isMobile
          ? Column(
              children: [
                avatarWidget,
                const SizedBox(height: 32),
                textContent,
              ],
            )
          : Row(
              children: [
                Expanded(flex: 3, child: textContent),
                const SizedBox(width: 40),
                Expanded(flex: 2, child: avatarWidget),
              ],
            ),
    );
  }
}
