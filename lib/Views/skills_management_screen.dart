import 'package:flutter/material.dart';
import 'package:protfolio_app/Controllers/skill_controller.dart';
import 'package:protfolio_app/Models/skill.dart';
import 'package:protfolio_app/Views/add_edit_skill_screen.dart';
import 'package:protfolio_app/utils/app_colors.dart';

class SkillsManagementScreen extends StatefulWidget {
  const SkillsManagementScreen({super.key});

  @override
  State<SkillsManagementScreen> createState() => _SkillsManagementScreenState();
}

class _SkillsManagementScreenState extends State<SkillsManagementScreen> {
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

  //step3 ----> here I will create function becasue go To Add Skill  :
  Future<void> _goToAddSkill() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddEditSkillScreen()),
    );

    if (result == true) {
      await _loadData();
    }
  }

  //step4 ----> here I will create function becasue go To Edit Skill :
  Future<void> _goToEditSkill(Skill skill) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddEditSkillScreen(skill: skill)),
    );

    if (result == true) {
      await _loadData();
    }
  }

  //step5 ----> here I will create function becasue to delete Skill :
  Future<void> _deleteSkill(int id) async {
    await _skillController.deleteSkill(id);
    await _loadData();
  }

  //step6 ----> here I will create function becasue go Confirmation Dialog :
  Future<void> _showDeleteDialog(Skill skill) async {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Delete Skill"),
          content: Text("Are you sure you want to delete ${skill.name} ?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),

            ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);
                await _deleteSkill(skill.id);
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  //step4 ----> here I will call build function to create the page :
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Skills Management")),

      floatingActionButton: FloatingActionButton(
        onPressed: _goToAddSkill,
        child: Icon(Icons.add),
      ),

      body: RefreshIndicator(
        onRefresh: _loadData,
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: _skillController.skills.length,
          itemBuilder: (context, index) {
            final skill = _skillController.skills[index];

            return Card(
              margin: EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: Image.network(
                  skill.icon,
                  width: 40,
                  height: 40,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.code);
                  },
                ),

                title: Text(
                  skill.name,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: Text(
                  skill.level,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _goToEditSkill(skill);
                      },
                    ),

                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _showDeleteDialog(skill);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
