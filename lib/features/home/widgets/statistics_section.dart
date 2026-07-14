import 'package:flutter/material.dart';
import 'package:protfolio_app/features/profile/provider/profile_provider.dart';
import 'package:protfolio_app/features/skills/provider/skills_provider.dart';
import 'package:protfolio_app/features/projects/provider/project_provider.dart';
import 'package:protfolio_app/shared/widgets/stat_card.dart';
import 'package:provider/provider.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final years = context.select<ProfileProvider, String>(
      (provider) => (provider.profile?.yearsOfExperience ?? 0).toString(),
    );

    final projects = context.select<ProjectProvider, int>(
      (provider) => provider.projectsCount,
    );

    final skills = context.select<SkillsProvider, int>(
      (provider) => provider.skillsCount,
    );
    return Row(
      children: [
        StatCard(title: "Years Exp", value: years),
        StatCard(title: "Projects", value: projects.toString()),
        StatCard(title: "Skills", value: skills.toString()),
      ],
    );
  }
}
