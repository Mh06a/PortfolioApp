import 'package:flutter/material.dart';
import 'package:protfolio_app/features/admin/view/admin_screen.dart';
import 'package:protfolio_app/core/themes/app_colors.dart';
import 'package:protfolio_app/shared/widgets/custom_header.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  //step3 ----> here I will call build function to create the page :
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //step3.1 ---> here I will Create Name of Secreen :
              CustomHeader(
                screenTitle: "Settings",
                secondTitle: "Application settings and preferences",
              ),

              SizedBox(height: 25),

              //step3.2 ---> here I will Create Appearance section  :
              Text(
                "Appearance",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),

              SizedBox(height: 10),

              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.dark_mode),
                      title: const Text("Dark Mode"),
                      subtitle: const Text("Coming Soon"),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              //step3.3 ---> here I will Create Admin section :
              Text(
                "Administration",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),

              SizedBox(height: 10),

              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.admin_panel_settings),
                      title: const Text("Admin Panel"),
                      subtitle: const Text("Manage portfolio content"),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AdminScreen();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              //step3.4 ---> here I will Create Application section :
              Text(
                "Application",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),

              SizedBox(height: 10),

              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.info_outline),
                      title: const Text("Version"),
                      subtitle: const Text("1.0.0"),
                    ),

                    Divider(height: 1),

                    ListTile(
                      leading: const Icon(Icons.apps),
                      title: const Text("About App"),
                      subtitle: const Text("Personal Portfolio Application"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
