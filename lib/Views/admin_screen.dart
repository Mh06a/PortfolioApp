import 'package:flutter/material.dart';
import 'package:protfolio_app/Views/edit_profile_screen.dart';
import 'package:protfolio_app/Views/projects_management_screen.dart';
import 'package:protfolio_app/Views/skills_management_screen.dart';
import 'package:protfolio_app/utils/app_colors.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //step1.1 ---> here I will Create Name of Secreen :
              Text(
                "Admin Panel",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                "Manage your protfolio content",
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),

              SizedBox(height: 25),

              //step1.1 ---> here I will Create Card Section :
              _buildCard(
                context,
                icon: Icons.person,
                title: "Profile",
                subtitle: "Edit personal information",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return EditProfileScreen();
                      },
                    ),
                  );
                },
              ),

              SizedBox(height: 15),

              _buildCard(
                context,
                icon: Icons.psychology,
                title: "Skills",
                subtitle: "Add, edi and delete skills",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SkillsManagementScreen();
                      },
                    ),
                  );
                },
              ),

              SizedBox(height: 15),

              _buildCard(
                context,
                icon: Icons.work,
                title: "Projects",
                subtitle: "Add, edit and delete projects",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ProjectsManagementScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//step2 ----> here I will Create Widget to Create Card :
Widget _buildCard(
  BuildContext context, {
  required IconData icon,
  required String title,
  required String subtitle,
  required VoidCallback onTap,
}) {
  return Card(
    child: ListTile(
      leading: Icon(icon, size: 30),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    ),
  );
}
