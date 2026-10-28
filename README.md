# Flutter Web Portfolio - Muhamed Roshdy Al-Abd

Single-page responsive Flutter Web portfolio for **Muhamed Roshdy Al-Abd** (Senior Mobile Developer | Native Android & Flutter | Mobile Team Lead).

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

## 📦 Production Web Build & Deployment

### Build Release Bundle

```bash
flutter build web --release
```

The compiled release artifacts will be located in `build/web/`.

### Deployment Options

#### 1. GitHub Pages
1. Push your project to a GitHub repository.
2. Deploy the contents of `build/web/` to the `gh-pages` branch using `gh-pages` CLI or GitHub Actions:
   ```bash
   npx gh-pages -d build/web
   ```

#### 2. Firebase Hosting
1. Install Firebase CLI: `npm install -g firebase-tools`
2. Initialize Firebase Hosting:
   ```bash
   firebase init hosting
   ```
   - Set public directory to `build/web`
   - Configure as single-page app: `Yes`
3. Deploy:
   ```bash
   firebase deploy --only hosting
   ```

---

## 📝 Placeholders

Refer to [TODO.md](TODO.md) for a list of content placeholders to update before live publishing.
