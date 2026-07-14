import 'package:flutter/material.dart';
import 'package:protfolio_app/core/themes/app_colors.dart';
import 'package:protfolio_app/features/profile/model/profile.dart';
import 'package:protfolio_app/features/profile/provider/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = context.select<ProfileProvider, Profile?>(
      (provider) => provider.profile,
    );
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/me.jpg"),
              radius: 40,
            ),

            SizedBox(width: 14, height: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Color(0xFFA99CFF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      profile?.specialization ?? "",
                      style: TextStyle(color: AppColors.textPrimary),
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "I build Mobile & Backend Applications using Flutter & Spring Boot.",
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
