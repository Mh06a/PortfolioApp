import 'package:flutter/material.dart';
import 'package:protfolio_app/Models/skill.dart';
import 'package:protfolio_app/utils/app_colors.dart';

class SkillCard extends StatelessWidget {
  //step1 ----> here I will Create the class's variables :
  final Skill skill;

  //step1 ----> here I will Create a constructor :
  const SkillCard({super.key, required this.skill});

  //step3 ----> here I will call build function to create the widegt :
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(skill.icon, height: 40, width: 40),

            SizedBox(height: 10),

            Text(
              skill.name,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                skill.level,
                style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
