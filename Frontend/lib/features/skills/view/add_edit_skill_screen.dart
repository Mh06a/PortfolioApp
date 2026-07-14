import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:protfolio_app/features/skills/model/skill.dart';
import 'package:protfolio_app/features/skills/provider/skills_provider.dart';
import 'package:protfolio_app/shared/widgets/custom_button.dart';
import 'package:protfolio_app/shared/widgets/custom_snackbar.dart';
import 'package:protfolio_app/shared/widgets/custom_textfield.dart';

class AddEditSkillScreen extends StatefulWidget {
  final Skill? skill;

  const AddEditSkillScreen({super.key, this.skill});

  @override
  State<AddEditSkillScreen> createState() => _AddEditSkillScreenState();
}

class _AddEditSkillScreenState extends State<AddEditSkillScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _iconController = TextEditingController();

  String _selectedLevel = "Beginner";

  @override
  void initState() {
    super.initState();

    if (widget.skill != null) {
      _nameController.text = widget.skill!.name;
      _iconController.text = widget.skill!.icon;
      _selectedLevel = widget.skill!.level;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _iconController.dispose();
    super.dispose();
  }

  Future<void> _saveSkill() async {
    final provider = context.read<SkillsProvider>();

    final skill = Skill(
      id: widget.skill?.id ?? 0,
      name: _nameController.text.trim(),
      level: _selectedLevel,
      icon: _iconController.text.trim(),
    );

    final success = widget.skill == null
        ? await provider.addSkill(skill)
        : await provider.updateSkill(widget.skill!.name, skill);

    if (!mounted) return;

    if (success) {
      CustomSnackbar.success(
        context,
        widget.skill == null
            ? "Skill added successfully"
            : "Skill updated successfully",
      );

      Navigator.pop(context, true);
    } else {
      CustomSnackbar.error(
        context,
        provider.errorMessage ?? "Something went wrong",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select<SkillsProvider, bool>(
      (provider) => provider.isLoading,
    );

    final isEdit = widget.skill != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? "Edit Skill" : "Add Skill")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextfield(
              controller: _nameController,
              labelText: "Skill Name",
            ),

            const SizedBox(height: 16),

            CustomTextfield(controller: _iconController, labelText: "Icon URL"),

            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              initialValue: _selectedLevel,
              decoration: const InputDecoration(
                labelText: "Level",
                border: OutlineInputBorder(),
              ),
              items: const [
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

            const SizedBox(height: 25),

            isLoading
                ? const CircularProgressIndicator()
                : CustomButton(
                    tilte: isEdit ? "Update Skill" : "Add Skill",
                    icon: isEdit ? Icons.edit : Icons.add,
                    width: double.infinity,
                    onPressed: _saveSkill,
                  ),
          ],
        ),
      ),
    );
  }
}
