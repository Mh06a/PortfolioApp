import 'package:flutter/material.dart';
import 'package:protfolio_app/Controllers/profile_controller.dart';
import 'package:protfolio_app/utils/app_colors.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  //step1 ----> here I will Create the class's variables :
  final ProfileController _profileController = ProfileController();

  //step2 ----> here I will call initState becasue use load functions :
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await _profileController.loadProfile(3);
    setState(() {});
  }

  //step3 ----> here I will call build function to create the page :
  @override
  Widget build(BuildContext context) {
    final profile = _profileController.profile;
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _loadData,
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
                          onTap: () {},
                        ),

                        Divider(height: 1),

                        ListTile(
                          leading: Icon(Icons.code),
                          title: Text("GitHub"),
                          subtitle: Text(profile?.githubLink ?? ""),
                          trailing: Icon(Icons.open_in_new),
                          onTap: () {},
                        ),

                        Divider(height: 1),

                        ListTile(
                          leading: Icon(Icons.business),
                          title: Text("LinkedIn"),
                          subtitle: Text(profile?.linkedinLink ?? ""),
                          trailing: Icon(Icons.open_in_new),
                          onTap: () {},
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
