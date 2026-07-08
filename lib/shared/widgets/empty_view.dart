import 'package:flutter/material.dart';
import 'package:protfolio_app/core/theme/app_colors.dart';

class EmptyView extends StatelessWidget {
  //step1 ----> Create class variables :
  final IconData icon;
  final String title;
  final String? subtitle;

  //step2 ----> Create constructor :
  const EmptyView({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
  });

  //step3 ----> Build widget :
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 70, color: Colors.grey),

            SizedBox(height: 15),

            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),

            if (subtitle != null) ...[
              const SizedBox(height: 8),

              Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textSecondary),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
