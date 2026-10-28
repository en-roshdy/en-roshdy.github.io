import 'models/portfolio_models.dart';

class PortfolioData {
  static const HeroData hero = HeroData(
    name: 'Muhamed Roshdy Al-Abd',
    title: 'Senior Mobile Developer | Native Android & Flutter | Mobile Team Lead',
    location: 'Cairo, Egypt',
    tagline: 'Architecting high-performance mobile apps & leading engineering teams to build 60+ production applications.',
    phone: '+201061071897',
    email: 'en.muhamed.roshdy@gmail.com',
    linkedinUrl: 'https://linkedin.com/in/muhamed-roshdy-placeholder',
    githubUrl: 'https://github.com/placeholder',
    cvAssetPath: 'assets/cv.pdf',
  );

  static const String aboutSummary =
      'Results-driven Senior Android Developer and Mobile Team Lead with over 7 years of hands-on experience specializing in Native Android (Kotlin/Java) and cross-platform Flutter ecosystems. Proven track record of leading technical teams and delivering 60+ production applications with 100K+ combined downloads across E-Commerce, Fintech, POS, and On-Demand Logistics sectors. Expert in Clean Architecture, Multi-Module Systems, MVVM/MVI, Jetpack Compose, and Coroutines. Demonstrated ability to modernize legacy codebases, reduce crash rates by 60%, and improve app loading speeds by up to 40%.';

  static const List<StatItem> stats = [
    StatItem(value: '7+', label: 'Years Experience'),
    StatItem(value: '60+', label: 'Production Apps'),
    StatItem(value: '100K+', label: 'Combined Downloads'),
    StatItem(value: '5+', label: 'Devs Mentored'),
  ];

  static const List<SkillCategory> skillCategories = [
    SkillCategory(
      categoryName: 'Languages',
      icon: 'code',
      skills: ['Kotlin', 'Java', 'Dart', 'Swift'],
    ),
    SkillCategory(
      categoryName: 'Android & UI',
      icon: 'smartphone',
      skills: [
        'Android SDK',
        'Jetpack Compose',
        'XML',
        'Custom Views',
        'Material Design 3',
        'Multi-Module Architecture',
      ],
    ),
    SkillCategory(
      categoryName: 'Architecture & Patterns',
      icon: 'architecture',
      skills: [
        'Clean Architecture',
        'MVVM',
        'MVI',
        'MVP',
        'SOLID Principles',
        'Design Patterns',
      ],
    ),
    SkillCategory(
      categoryName: 'Async & State Management',
      icon: 'sync',
      skills: [
        'Coroutines',
        'Kotlin Flows (StateFlow, SharedFlow)',
        'RxJava',
        'BLoC / Cubit',
        'GetX',
        'Provider',
      ],
    ),
    SkillCategory(
      categoryName: 'Dependency Injection & Jetpack',
      icon: 'extension',
      skills: [
        'Dagger-Hilt',
        'Koin',
        'Navigation Component',
        'WorkManager',
        'Room',
        'SQLite',
        'Paging 3',
        'DataStore',
      ],
    ),
    SkillCategory(
      categoryName: 'Networking & Services',
      icon: 'cloud',
      skills: [
        'Retrofit',
        'OkHttp',
        'Ktor',
        'Dio',
        'RESTful APIs',
        'Firebase (FCM, Firestore, Crashlytics)',
        'Google Maps & Location APIs',
        'OAuth',
      ],
    ),
    SkillCategory(
      categoryName: 'Testing, Quality & Tools',
      icon: 'verified',
      skills: [
        'JUnit',
        'MockK',
        'Espresso',
        'Integration Testing',
        'CI/CD Pipelines',
        'Git & GitHub',
        'ProGuard / R8',
        'Agile / Scrum',
      ],
    ),
    SkillCategory(
      categoryName: 'Specialized Integrations',
      icon: 'build',
      skills: [
        'Payment Gateways',
        'In-App Purchases / Subscriptions',
        'Hardware Integrations (Thermal Printers, Barcode Scanners, POS)',
      ],
    ),
  ];

  static const List<ExperienceItem> experiences = [
    ExperienceItem(
      role: 'Mobile Team Lead & Senior Android Developer',
      company: 'Business Building',
      period: 'November 2024 – Present',
      bulletPoints: [
        'Technical Leadership: Spearheaded and managed a cross-functional mobile engineering team (Android & iOS), establishing strict code review guidelines, CI/CD workflows, and modern development standards while remaining actively hands-on.',
        'End-to-End Product Delivery: Architected and deployed complex dual-application ecosystems (such as the Final Rental & Delivery platform) using Clean Architecture and MVVM/MVI patterns for modularity and scalability.',
        'Code Modernization: Directed the migration of legacy features into modern Android Jetpack Components, Jetpack Compose, and Kotlin Coroutines/Flows, reducing technical debt and improving maintainability.',
        'Cross-Functional Collaboration: Partnered with product managers and UI/UX designers to define feature roadmaps and accelerate time-to-market for major releases.',
      ],
    ),
    ExperienceItem(
      role: 'Senior Mobile Developer (Flutter & Android)',
      company: 'Modern Charm, KSA',
      period: 'December 2022 – August 2024',
      bulletPoints: [
        'Engineered high-performance mobile apps for the GCC market, using Kotlin for native Android platform channels and SDK integrations alongside Flutter and Dart.',
        'Implemented reactive state management using BLoC and GetX, resulting in predictable app states and a 30% reduction in state-related bugs.',
        'Integrated complex RESTful APIs, real-time Firebase services, and secure regional payment gateways.',
        'Mentored 5+ junior and mid-level developers through regular code reviews, raising overall team code quality.',
      ],
    ),
    ExperienceItem(
      role: 'Android Developer',
      company: 'Albadr Smart Systems',
      period: 'April 2017 – December 2022',
      bulletPoints: [
        'Designed, developed, and maintained 25+ native Android apps using Kotlin and Java, focusing on enterprise stability and fluid Material Design interfaces.',
        'Built and deployed advanced POS & Inventory systems featuring hardware barcode scanning, Bluetooth thermal printer integration, offline persistence (Room, SQLite), and real-time synchronization.',
        'Integrated secure payment gateways, in-app purchases, and subscription models, directly driving client revenue growth.',
      ],
    ),
  ];

  static const List<AchievementItem> achievements = [
    AchievementItem(
      title: 'Crash & Quality Optimization',
      metric: '60% Crash Reduction',
      description:
          'Reduced crash rates by 60% across production apps through unit/UI testing, memory leak resolution, and defensive programming.',
    ),
    AchievementItem(
      title: 'Performance Enhancement',
      metric: '40% Faster Loading',
      description:
          '40% improvement in app startup and rendering times via architectural refactoring and background thread optimization.',
    ),
    AchievementItem(
      title: 'Legacy Modernization',
      metric: '10+ Apps Migrated',
      description:
          'Led the complete migration of 10+ legacy Java apps into modern, reactive Kotlin codebases.',
    ),
    AchievementItem(
      title: 'Market Impact & Leadership',
      metric: '60+ Apps & 100K+ Users',
      description:
          'Delivered 60+ apps (30+ published on Google Play & App Store) reaching 100K+ combined downloads, while mentoring 5+ junior developers.',
    ),
  ];

  static const List<ProjectItem> projects = [
    ProjectItem(
      title: 'Final Ecosystem — Equipment Rental & Express Delivery',
      sector: 'Business Building (Saudi Market)',
      description:
          'Dual-app platform. Final Client App for renting professional photography gear with flexible daily/weekly/monthly billing and equipment exchange workflows; FPE Driver App with real-time delivery/return tracking, driver analytics, and instant in-app chat.',
      tags: ['Android', 'Clean Architecture', 'MVVM/MVI', 'Real-time', 'Chat'],
    ),
    ProjectItem(
      title: 'Al-Badr POS & Dana Bakery',
      sector: 'Enterprise Native Android',
      description:
          'POS and bakery management systems with offline-first architecture, inventory management, hardware barcode scanning, and Bluetooth thermal printer integration.',
      tags: ['Kotlin', 'Room', 'SQLite', 'Hardware Integration', 'Offline-first'],
    ),
    ProjectItem(
      title: 'Shine Laundries & WaterDrop',
      sector: 'On-Demand Delivery',
      description:
          'Laundry and water delivery platforms with dual interfaces (Client & Driver), real-time GPS order tracking, and automated dispatch workflows.',
      tags: ['Maps', 'GPS Tracking', 'Automated Dispatch', 'Flutter'],
    ),
    ProjectItem(
      title: 'Treatab & SalonTech',
      sector: 'Beauty & Booking',
      description:
          'High-traffic booking platforms with dual-user interfaces (Clients & Specialists), scheduling engines, exclusive commercial discounts, and secure GCC payment integrations.',
      tags: ['Booking Engine', 'Payments', 'GCC Market', 'Flutter'],
    ),
    ProjectItem(
      title: 'Muntj.com, Plorer, Watch2Buy',
      sector: 'Location-Based Marketplaces & Social',
      description:
          'Commercial marketplaces and social platforms using advanced Google Maps APIs, real-time messaging, media sharing, and location-based filtering.',
      tags: ['Google Maps APIs', 'Real-time Messaging', 'Marketplace', 'Social'],
    ),
    ProjectItem(
      title: 'Additional Production Portfolio (50+ Apps)',
      sector: 'Fintech, E-Commerce & AI',
      description:
          'Fintech & Digital Cards (Pytic, Card Net); Food & E-Commerce (City Hyper, Belques, Lahmetak Lbetak); AI & Publishing (Helm AI, BookCloud). Full details and links available upon request.',
      tags: ['Fintech', 'E-Commerce', 'AI', 'Digital Cards'],
    ),
  ];

  static const EducationItem education = EducationItem(
    degree: "Bachelor's Degree in Social Service",
    institution: 'Delta Academy, Mansoura',
    year: '2011',
    highlights: [
      'Advanced Native Android Architecture (Kotlin/Jetpack)',
      'Software Architecture & Design Patterns',
      'Complete Flutter & Dart Development',
    ],
  );

  static const List<String> languages = [
    'Arabic — Native',
    'English — Professional Working Proficiency',
  ];
}
