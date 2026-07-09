import 'package:flutter/material.dart';
import 'package:protfolio_app/features/projects/model/project.dart';
import 'package:protfolio_app/shared/widgets/custom_button.dart';
import 'package:protfolio_app/shared/widgets/custom_snackbar.dart';
import 'package:protfolio_app/shared/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';
import 'package:protfolio_app/features/projects/provider/project_provider.dart';

class AddEditProjectScreen extends StatefulWidget {
  //step1 ----> here I will Create the class's variables :
  final Project? project;
  const AddEditProjectScreen({super.key, this.project});

  @override
  State<AddEditProjectScreen> createState() => _AddEditProjectScreenState();
}

class _AddEditProjectScreenState extends State<AddEditProjectScreen> {
  //step1 ----> here I will Create the class's variables :
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _techStackController = TextEditingController();
  final TextEditingController _githubController = TextEditingController();
  bool get isEdit => widget.project != null;

  //step2 ----> here I will call initState becasue use load functions :
  @override
  void initState() {
    super.initState();

    if (isEdit) {
      _nameController.text = widget.project!.name;
      _descriptionController.text = widget.project!.description;
      _techStackController.text = widget.project!.techStack;
      _githubController.text = widget.project!.githubLink;
    }
  }

  //step3 ----> here I will create function becasue save project  :
  Future<void> _saveProject() async {
    final provider = context.read<ProjectProvider>();

    final project = Project(
      id: isEdit ? widget.project!.id : 0,
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim(),
      techStack: _techStackController.text.trim(),
      githubLink: _githubController.text.trim(),
    );

    final success = isEdit
        ? await provider.updateProject(widget.project!.name, project)
        : await provider.addProject(project);

    if (!mounted) return;

    if (success) {
      CustomSnackbar.success(
        context,
        isEdit ? "Project updated successfully" : "Project added successfully",
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
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _techStackController.dispose();
    _githubController.dispose();
    super.dispose();
  }

  //step4 ----> here I will call build function to create the page :
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProjectProvider>();
    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? "Edit Project " : "Add Project")),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextfield(
              controller: _nameController,
              labelText: "Project Name",
            ),

            SizedBox(height: 16),

            CustomTextfield(
              controller: _descriptionController,
              labelText: "Description",
            ),

            SizedBox(height: 16),

            CustomTextfield(
              controller: _techStackController,
              labelText: "Tech Stack",
              hintText: "Flutter, Spring Boot, MySQL",
            ),

            SizedBox(height: 16),

            CustomTextfield(
              controller: _githubController,
              labelText: "GitHub Link",
            ),

            SizedBox(height: 24),
            provider.isLoading
                ? const CircularProgressIndicator()
                : CustomButton(
                    tilte: isEdit ? "Update Project" : "Add Project",
                    icon: isEdit ? Icons.edit : Icons.add,
                    width: double.infinity,
                    onPressed: _saveProject,
                  ),
          ],
        ),
      ),
    );
  }
}
