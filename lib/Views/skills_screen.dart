import 'package:flutter/material.dart';
import 'package:protfolio_app/Controllers/skill_controller.dart';
import 'package:protfolio_app/utils/app_colors.dart';
import 'package:protfolio_app/widgets/skill_card.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  //step1 ----> here I will Create the class's variables :
  final SkillController _skillController = SkillController();

  //step2 ----> here I will call initState becasue use load functions :
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await _skillController.loadSkills();
    setState(() {});
  }

  //step3 ----> here I will call build function to create the page :
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _loadData,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //step3.1 ---> here I will Create Name of Secreen :
                  Text(
                    "Skills",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    "${_skillController.skills.length} technologies mastered",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),

                  //step3.2 ---> here I will Create Filter section :
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        FilterChip(
                          label: Text("All"),
                          selected: true,
                          onSelected: (_) {},
                        ),

                        SizedBox(width: 8),

                        FilterChip(
                          label: Text("Mobile"),
                          selected: false,
                          onSelected: (_) {},
                        ),

                        SizedBox(width: 8),

                        FilterChip(
                          label: Text("Backend"),
                          selected: false,
                          onSelected: (_) {},
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15),
                  //step3.3 ---> here I will Create Skill Card section :
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _skillController.skills.length,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.2,
                    ),

                    itemBuilder: (context, index) {
                      final skill = _skillController.skills[index];
                      return SkillCard(skill: skill);
                    },
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
