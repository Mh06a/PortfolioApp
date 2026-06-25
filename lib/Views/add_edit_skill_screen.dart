import 'package:flutter/material.dart';
import 'package:protfolio_app/Controllers/skill_controller.dart';
import 'package:protfolio_app/Models/skill.dart';
import 'package:protfolio_app/widgets/custom_button.dart';

class AddEditSkillScreen extends StatefulWidget {
  //step1 ----> here I will Create the class's variables :
  final Skill? skill;

  const AddEditSkillScreen({super.key, this.skill});

  @override
  State<AddEditSkillScreen> createState() => _AddEditSkillScreenState();
}

class _AddEditSkillScreenState extends State<AddEditSkillScreen> {
  //step1 ----> here I will Create the class's variables :
  final SkillController _skillController = SkillController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _iconController = TextEditingController();
  String _selectedLevel = "Beginner";

  //step2 ----> here I will call initState becasue use load functions :
  @override
  void initState() {
    super.initState();

    if (widget.skill != null) {
      _nameController.text = widget.skill!.name;
      _iconController.text = widget.skill!.icon;
      _selectedLevel = widget.skill!.level;
    }
  }

  //step3 ----> here I will create function becasue save skill  :
  Future<void> _saveSkill() async {
    final skill = Skill(
      id: widget.skill?.id ?? 0,
      name: _nameController.text.trim(),
      level: _selectedLevel,
      icon: _iconController.text.trim(),
    );

    try {
      if (widget.skill == null) {
        await _skillController.addSkill(skill);
      } else {
        await _skillController.updateSkill(widget.skill!.name, skill);
      }

      if (mounted) {
        Navigator.pop(context, true);
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  //step4 ----> here I will call build function to create the page :
  @override
  Widget build(BuildContext context) {
    final isEdit = widget.skill != null;
    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? "Edit Skill" : "Add Skill")),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Skill Name",
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 16),

              TextField(
                controller: _iconController,
                decoration: InputDecoration(
                  labelText: "Icon URL",
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 16),

              DropdownButtonFormField<String>(
                initialValue: _selectedLevel,
                decoration: InputDecoration(
                  labelText: "Level",
                  border: OutlineInputBorder(),
                ),

                items: [
                  DropdownMenuItem(value: "Beginner", child: Text("Beginner")),
                  DropdownMenuItem(
                    value: "Intermediate",
                    child: Text("Intermediate"),
                  ),
                  DropdownMenuItem(value: "Advanced", child: Text("Advanced")),
                ],

                onChanged: (value) {
                  setState(() {
                    _selectedLevel = value!;
                  });
                },
              ),

              SizedBox(height: 25),

              CustomButton(
                tilte: isEdit ? "Update Skill" : "Add Skill",
                icon: isEdit ? Icons.edit : Icons.add,
                onPressed: _saveSkill,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
