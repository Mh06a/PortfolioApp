import 'package:flutter/material.dart';
import 'package:protfolio_app/features/projects/model/project.dart';
import 'package:protfolio_app/core/themes/app_colors.dart';
import 'package:protfolio_app/core/helpers/launcher_helper.dart';
import 'package:protfolio_app/shared/widgets/custom_button.dart';

class ProjectCard extends StatelessWidget {
  //step1 ----> Create class variables :
  final Project project;

  //step2 ----> Create constructor :
  const ProjectCard({super.key, required this.project});

  //step3 ----> here I will call build function to create the widegt :
  @override
  Widget build(BuildContext context) {
    final technologies = project.techStack.split(",");
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),

            SizedBox(height: 10),

            Text(
              project.description,
              style: TextStyle(
                color: AppColors.textSecondary,
                height: 1.5,
                fontWeight: FontWeight.w400,
              ),
            ),

            SizedBox(height: 15),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: technologies.map((tech) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    tech.trim(),
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 20),
            CustomButton(
              tilte: "GitHub",

              width: double.infinity,
              icon: Icons.code,
              onPressed: () async {
                LauncherHelper.openUrl(project.githubLink);
              },
            ),
          ],
        ),
      ),
    );
  }
}
