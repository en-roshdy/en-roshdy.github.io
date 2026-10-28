import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'widgets/nav_bar.dart';
import 'widgets/footer.dart';
import 'widgets/shimmer_loading.dart';
import 'features/hero/hero_section.dart';
import 'features/about/about_section.dart';
import 'features/skills/skills_section.dart';
import 'features/experience/experience_section.dart';
import 'features/achievements/achievements_section.dart';
import 'features/projects/projects_section.dart';
import 'features/education/education_section.dart';
import 'features/contact/contact_section.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const PortfolioApp(),
    ),
  );
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Muhamed Roshdy Al-Abd | Senior Mobile Developer & Team Lead',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = true;

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _achievementsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // Render content immediately when engine boots
    _isLoading = false;
  }

  void _scrollToSection(String section) {
    GlobalKey? targetKey;
    switch (section) {
      case 'Hero':
        targetKey = _heroKey;
        break;
      case 'About':
        targetKey = _aboutKey;
        break;
      case 'Skills':
        targetKey = _skillsKey;
        break;
      case 'Experience':
        targetKey = _experienceKey;
        break;
      case 'Achievements':
        targetKey = _achievementsKey;
        break;
      case 'Projects':
        targetKey = _projectsKey;
        break;
      case 'Contact':
        targetKey = _contactKey;
        break;
    }

    if (targetKey?.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey!.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      endDrawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Text(
                    'Muhamed Roshdy',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person_rounded),
                title: const Text('About'),
                onTap: () {
                  Navigator.pop(context);
                  _scrollToSection('About');
                },
              ),
              ListTile(
                leading: const Icon(Icons.code_rounded),
                title: const Text('Skills'),
                onTap: () {
                  Navigator.pop(context);
                  _scrollToSection('Skills');
                },
              ),
              ListTile(
                leading: const Icon(Icons.work_rounded),
                title: const Text('Experience'),
                onTap: () {
                  Navigator.pop(context);
                  _scrollToSection('Experience');
                },
              ),
              ListTile(
                leading: const Icon(Icons.emoji_events_rounded),
                title: const Text('Achievements'),
                onTap: () {
                  Navigator.pop(context);
                  _scrollToSection('Achievements');
                },
              ),
              ListTile(
                leading: const Icon(Icons.dashboard_rounded),
                title: const Text('Projects'),
                onTap: () {
                  Navigator.pop(context);
                  _scrollToSection('Projects');
                },
              ),
              ListTile(
                leading: const Icon(Icons.mail_rounded),
                title: const Text('Contact'),
                onTap: () {
                  Navigator.pop(context);
                  _scrollToSection('Contact');
                },
              ),
            ],
          ),
        ),
      ),
      appBar: NavBar(
        onNavTap: _scrollToSection,
        isDarkMode: themeProvider.isDarkMode,
        onThemeToggle: themeProvider.toggleTheme,
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        child: _isLoading
            ? const ShimmerSkeletonView(key: ValueKey('shimmer'))
            : SingleChildScrollView(
                key: const ValueKey('content'),
                controller: _scrollController,
                child: Column(
                  children: [
                    Container(
                      key: _heroKey,
                      child: HeroSection(
                        onContactTap: () => _scrollToSection('Contact'),
                      ),
                    ),
                    Container(key: _aboutKey, child: const AboutSection()),
                    Container(key: _skillsKey, child: const SkillsSection()),
                    Container(key: _experienceKey, child: const ExperienceSection()),
                    Container(key: _achievementsKey, child: const AchievementsSection()),
                    Container(key: _projectsKey, child: const ProjectsSection()),
                    const EducationSection(),
                    Container(key: _contactKey, child: const ContactSection()),
                    Footer(onBackToTop: () => _scrollToSection('Hero')),
                  ],
                ),
              ),
      ),
    );
  }
}
