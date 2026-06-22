import 'package:flutter/material.dart';
import 'package:protfolio_app/Controllers/profile_controller.dart';
import 'package:protfolio_app/Controllers/project_controller.dart';
import 'package:protfolio_app/Controllers/skill_controller.dart';
import 'package:protfolio_app/utils/app_colors.dart';
import 'package:protfolio_app/widgets/custom_button.dart';
import 'package:protfolio_app/widgets/skill_chip.dart';
import 'package:protfolio_app/widgets/stat_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //step1 ----> here I will Create the class's variables :
  final ProfileController _profileController = ProfileController();
  final SkillController _skillController = SkillController();
  final ProjectController _projectController = ProjectController();

  //step2 ----> here I will call initState becasue use load functions :
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await _profileController.loadProfile(2);
    await _skillController.loadSkills();
    await _projectController.loadProjects();
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //step3.1 ---> here I will Create Name Section :
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Good morning",
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          Text(
                            profile?.fullName ?? "Loaing...",
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
                  ),

                  SizedBox(height: 25),

                  //step3.2 ---> here I will Create bio section :
                  Card(
                    //color: Color.fromARGB(255, 49, 49, 56),
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
                                Row(
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
                                        style: TextStyle(
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: 10),
                                  ],
                                ),

                                SizedBox(height: 10),

                                Text(
                                  profile?.bio ?? "",
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
                  ),

                  SizedBox(height: 20),

                  //step3.3 ---> here I will Create statistics section :
                  Row(
                    children: [
                      StatCard(
                        title: "Years Exp",
                        value: profile?.yearsOfExperience.toString() ?? "0",
                      ),
                      StatCard(
                        title: "Projects",
                        value: _projectController.projects.length.toString(),
                      ),
                      StatCard(
                        title: "Skills",
                        value: _skillController.skills.length.toString(),
                      ),
                    ],
                  ),

                  SizedBox(height: 15),

                  //step3.4 ---> here I will Create Specializations section :
                  Text(
                    "Specializations",
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    ),
                  ),

                  SizedBox(height: 12),

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _skillController.skills.map((skill) {
                      return SkillChip(title: skill.name);
                    }).toList(),
                  ),

                  SizedBox(height: 12),
                  //step3.5 ---> here I will Create About me section :
                  Container(
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
                  ),

                  SizedBox(height: 10),

                  //step3.6 ---> here I will Create Buttons section :
                  CustomButton(
                    tilte: "Download CV",
                    icon: Icons.download,
                    onPressed: () {},
                    tilteColor: Colors.lightBlue,
                    color: Color(0xFF2A2A35),
                    iconColor: Colors.lightBlue,
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
