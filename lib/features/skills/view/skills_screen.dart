import 'package:flutter/material.dart';
import 'package:protfolio_app/features/skills/controller/skill_controller.dart';
import 'package:protfolio_app/shared/widgets/custom_header.dart';
import 'package:protfolio_app/shared/widgets/empty_view.dart';
import 'package:protfolio_app/shared/widgets/error_view.dart';
import 'package:protfolio_app/shared/widgets/loading_view.dart';
import 'package:protfolio_app/shared/widgets/skill_card.dart';

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
    if (_skillController.isLoading) {
      return LoadingView();
    }

    final error = _skillController.errorMessage;

    if (error != null) {
      return ErrorView(message: error, onRetry: _loadData);
    }

    if (_skillController.skills.isEmpty) {
      return EmptyView(
        icon: Icons.code_off,
        title: "No Skills Found",
        subtitle: "Add your first skill.",
      );
    }
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
                  CustomHeader(
                    screenTitle: "Skills",
                    secondTitle:
                        "${_skillController.skills.length} technologies mastered",
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
