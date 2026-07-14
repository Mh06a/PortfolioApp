import 'package:flutter/material.dart';
import 'package:protfolio_app/core/theme/app_colors.dart';
import 'package:protfolio_app/features/skills/model/skill.dart';
import 'package:protfolio_app/features/skills/provider/skills_provider.dart';
import 'package:protfolio_app/shared/widgets/empty_view.dart';
import 'package:protfolio_app/shared/widgets/skill_chip.dart';
import 'package:provider/provider.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Specializations",
          style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
        ),

        SizedBox(height: 12),

        Selector<SkillsProvider, List<Skill>>(
          selector: (_, provider) => provider.skills,
          builder: (context, skills, child) {
            return skills.isEmpty
                ? EmptyView(icon: Icons.code_off, title: "No skills available")
                : Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: skills.map((skill) {
                      return SkillChip(title: skill.name);
                    }).toList(),
                  );
          },
        ),
      ],
    );
  }
}
