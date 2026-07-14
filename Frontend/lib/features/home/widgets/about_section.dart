import 'package:flutter/material.dart';
import 'package:protfolio_app/core/themes/app_colors.dart';
import 'package:protfolio_app/features/profile/model/profile.dart';
import 'package:protfolio_app/features/profile/provider/profile_provider.dart';
import 'package:provider/provider.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = context.select<ProfileProvider, Profile?>(
      (provider) => provider.profile,
    );
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 30, 36, 66),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        profile?.bio ?? "",
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 13,
          height: 1.5,
        ),
        maxLines: 3,
      ),
    );
  }
}
