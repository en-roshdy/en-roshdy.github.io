class HeroData {
  final String name;
  final String title;
  final String location;
  final String tagline;
  final String phone;
  final String email;
  final String linkedinUrl;
  final String githubUrl;
  final String cvAssetPath;

  const HeroData({
    required this.name,
    required this.title,
    required this.location,
    required this.tagline,
    required this.phone,
    required this.email,
    required this.linkedinUrl,
    required this.githubUrl,
    required this.cvAssetPath,
  });
}

class StatItem {
  final String value;
  final String label;

  const StatItem({
    required this.value,
    required this.label,
  });
}

class SkillCategory {
  final String categoryName;
  final String icon;
  final List<String> skills;

  const SkillCategory({
    required this.categoryName,
    required this.icon,
    required this.skills,
  });
}

class ExperienceItem {
  final String role;
  final String company;
  final String period;
  final List<String> bulletPoints;

  const ExperienceItem({
    required this.role,
    required this.company,
    required this.period,
    required this.bulletPoints,
  });
}

class AchievementItem {
  final String title;
  final String metric;
  final String description;

  const AchievementItem({
    required this.title,
    required this.metric,
    required this.description,
  });
}

class ProjectItem {
  final String title;
  final String sector;
  final String description;
  final List<String> tags;
  final String? link;

  const ProjectItem({
    required this.title,
    required this.sector,
    required this.description,
    required this.tags,
    this.link,
  });
}

class EducationItem {
  final String degree;
  final String institution;
  final String year;
  final List<String> highlights;

  const EducationItem({
    required this.degree,
    required this.institution,
    required this.year,
    required this.highlights,
  });
}
