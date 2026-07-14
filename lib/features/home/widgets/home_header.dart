import 'package:flutter/material.dart';
import 'package:protfolio_app/core/theme/app_colors.dart';
import 'package:protfolio_app/features/profile/model/profile.dart';
import 'package:protfolio_app/features/profile/provider/profile_provider.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = context.select<ProfileProvider, Profile?>(
      (provider) => provider.profile,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              "Good morning",
              style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
            ),
            Text(
              profile!.fullName,
              style: TextStyle(
                fontSize: 25,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.star),
          color: Colors.blue[500],
        ),
      ],
    );
  }
}
