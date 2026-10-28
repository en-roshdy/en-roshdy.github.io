# Flutter Web Portfolio - Muhamed Roshdy Al-Abd

Single-page responsive Flutter Web portfolio for **Muhamed Roshdy Al-Abd** (Senior Mobile Developer | Native Android & Flutter | Mobile Team Lead).

🌐 **Live Portfolio URL**: [https://en-roshdy.github.io/](https://en-roshdy.github.io/)

---

## 🌟 Features

- **Responsive Breakpoints**: Seamless experience across Desktop (>1024px), Tablet (600–1024px), and Mobile (<600px).
- **Material 3 Theme**: Dark mode (default) and Light mode toggle with Indigo & Teal accent colors.
- **Smooth Section Scroll**: Sticky top navigation bar and mobile drawer with smooth animated scrolling to sections (`Hero`, `About`, `Skills`, `Experience`, `Achievements`, `Projects`, `Education`, `Contact`).
- **Clean Architecture**: Strong separation of UI and data (`lib/data/portfolio_data.dart`).
- **Interactive UI Cards**: Hover effects, skill chips, metric counters, project cards with tags, and direct `mailto:` / `tel:` triggers.

---

## 📁 Project Structure

```
lib/
  core/
    theme/       # Material 3 light/dark themes & custom colors
    utils/       # Responsive helper & url_launcher wrapper
  data/
    models/      # Strongly typed Dart models for portfolio content
    portfolio_data.dart # Single source of truth for all content
  features/
    hero/        # Greeting, title, profile avatar & CTA buttons
    about/       # Summary & quick stats cards
    skills/      # Categorized skills grid
    experience/  # Vertical career timeline
    achievements/# Accomplishment metrics & impact
    projects/    # Production project showcase grid
    education/   # Academic background & languages
    contact/     # Contact cards & mailto CTA
  widgets/       # Shared UI (NavBar, Footer, SectionTitle, SkillChip, ProjectCard)
  main.dart      # App entry point, ThemeProvider & section scroll logic
```

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (stable channel, version >=3.13.5)
- Chrome or modern Web Browser

### Local Development

1. Fetch dependencies:
   ```bash
   flutter pub get
   ```

2. Run on Web (Chrome):
   ```bash
   flutter run -d chrome
   ```

3. Run Unit/Widget Tests:
   ```bash
   flutter test
   ```

---

## 🌐 Automatic Deployment (GitHub Actions)

This project uses **GitHub Actions** for continuous deployment to **GitHub Pages**.

- **Live Site**: [https://en-roshdy.github.io/](https://en-roshdy.github.io/)
- **Workflow Configuration**: `.github/workflows/deploy.yml`
- **Triggers**: Automatically builds and deploys on every push to the `main` branch or via manual trigger (`workflow_dispatch`).
- **Build Command**:
  ```bash
  flutter build web --release --base-href "/"
  ```

### Required Repository Settings
To enable GitHub Actions deployment:
1. Go to your GitHub repository: **Settings > Pages**.
2. Under **Build and deployment > Source**, select **GitHub Actions**.

---

## 📝 Placeholders

Refer to [TODO.md](TODO.md) for a list of content placeholders to update before live publishing.
