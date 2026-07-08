import 'package:flutter/material.dart';
import 'package:protfolio_app/core/theme/app_colors.dart';

class SkillChip extends StatelessWidget {
  //step1 ----> here I will Create the class's variables :
  final String title;

  //step2 ----> here I will Create The constructor :
  const SkillChip({super.key, required this.title});

  //step3 ----> here I will call build function to create the widegt :
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A35),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(color: AppColors.textPrimary, fontSize: 13),
      ),
    );
  }
}
