import 'package:flutter/material.dart';
import 'package:protfolio_app/core/theme/app_colors.dart';
import 'package:protfolio_app/core/helpers/launcher_helper.dart';
import 'package:protfolio_app/features/profile/provider/profile_provider.dart';
import 'package:protfolio_app/shared/widgets/error_view.dart';
import 'package:protfolio_app/shared/widgets/loading_view.dart';
import 'package:provider/provider.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  //step3 ----> here I will call build function to create the page :
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProfileProvider>();

    if (provider.isLoading) {
      return LoadingView();
    }

    if (provider.errorMessage != null) {
      return ErrorView(
        message: provider.errorMessage!,
        onRetry: provider.loadData,
      );
    }
    final profile = provider.profile;

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: provider.loadData,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //step3.1 ---> here I will Create Name of Secreen :
                  Text(
                    "About",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  SizedBox(height: 20),

                  //step3.2 ---> here I will Create Card section :
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage("assets/images/me.jpg"),
                          ),

                          SizedBox(width: 15),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  profile?.fullName ?? "",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),

                                Text(
                                  profile?.specialization ?? "",
                                  style: TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  //step3.3 ---> here I will Create About section :
                  Text(
                    "About Me",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  SizedBox(height: 6),

                  Text(
                    profile?.bio ?? "",
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      height: 1.6,
                    ),
                  ),

                  SizedBox(height: 20),

                  //step3.4 ---> here I will Create Experience section :
                  ListTile(
                    leading: Icon(Icons.work),
                    title: Text("Experience"),
                    subtitle: Text("${profile?.yearsOfExperience ?? 0} Years"),
                  ),

                  //step3.5 ---> here I will Create Education section :
                  ListTile(
                    leading: Icon(Icons.school),
                    title: Text("Programming & Smart Devices Applications"),
                    subtitle: Text("Imam Abdulrahman Bin Faisal University"),
                  ),

                  SizedBox(height: 25),

                  //step3.6 ---> here I will Create Contact section :
                  Text(
                    "Contact",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  SizedBox(height: 10),

                  Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.email),
                          title: Text("Email"),
                          subtitle: Text(profile?.email ?? ""),
                          trailing: Icon(Icons.open_in_new),
                          onTap: () async {
                            LauncherHelper.sendEmail(profile!.email);
                          },
                        ),

                        Divider(height: 1),

                        ListTile(
                          leading: Icon(Icons.code),
                          title: Text("GitHub"),
                          subtitle: Text(profile?.githubLink ?? ""),
                          trailing: Icon(Icons.open_in_new),
                          onTap: () async {
                            LauncherHelper.openUrl(profile!.githubLink);
                          },
                        ),

                        Divider(height: 1),

                        ListTile(
                          leading: Icon(Icons.business),
                          title: Text("LinkedIn"),
                          subtitle: Text(profile?.linkedinLink ?? ""),
                          trailing: Icon(Icons.open_in_new),
                          onTap: () async {
                            LauncherHelper.openUrl(profile!.linkedinLink);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
