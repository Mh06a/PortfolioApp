import 'package:flutter/material.dart';
import 'package:protfolio_app/core/theme/app_colors.dart';

class CustomHeader extends StatelessWidget {
  //step1 ----> here I will Create the class's variables :
  final String screenTitle;
  final String? secondTitle;

  const CustomHeader({super.key, required this.screenTitle, this.secondTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          screenTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: AppColors.textPrimary,
          ),
        ),

        SizedBox(height: 5),

        Text(
          secondTitle ?? "",
          style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
