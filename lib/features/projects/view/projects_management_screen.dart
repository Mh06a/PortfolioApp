import 'package:flutter/material.dart';
import 'package:protfolio_app/features/projects/controller/project_controller.dart';
import 'package:protfolio_app/features/projects/view/add_edit_project_screen.dart';
import 'package:protfolio_app/core/theme/app_colors.dart';
import 'package:protfolio_app/shared/widgets/custom_snackbar.dart';

class ProjectsManagementScreen extends StatefulWidget {
  const ProjectsManagementScreen({super.key});

  @override
  State<ProjectsManagementScreen> createState() =>
      _ProjectsManagementScreenState();
}

class _ProjectsManagementScreenState extends State<ProjectsManagementScreen> {
  //step1 ----> here I will Create the class's variables :
  final ProjectController _projectController = ProjectController();

  //step2 ----> here I will call initState becasue use load functions :
  @override
  void initState() {
    super.initState();
    _loadProjects();
  }

  Future<void> _loadProjects() async {
    await _projectController.loadProjects();
    setState(() {});
  }

  //step3 ----> here I will create function becasue delete project  :
  Future<void> _deleteProject(int id) async {
    await _projectController.deleteProject(id);
    // ignore: use_build_context_synchronously
    CustomSnackbar.success(context, "Project deleted successfully");
    await _loadProjects();
  }

  //step4 ----> here I will create function becasue go Confirmation Dialog :
  void _showDeleteDialog(int id) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Delete Project"),
        content: Text("Are you sure you want to delete this project?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),

          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);

              await _deleteProject(id);
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }

  //step5 ----> here I will call build function to create the page :
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Projects Management")),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),

        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddEditProjectScreen();
              },
            ),
          );

          await _loadProjects();
        },
      ),

      body: RefreshIndicator(
        onRefresh: _loadProjects,
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: _projectController.projects.length,
          itemBuilder: (context, index) {
            final project = _projectController.projects[index];

            return Card(
              margin: EdgeInsets.only(bottom: 12),
              child: ListTile(
                title: Text(
                  project.name,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: Text(
                  project.techStack,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AddEditProjectScreen(project: project);
                            },
                          ),
                        );

                        await _loadProjects();
                      },
                    ),

                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _showDeleteDialog(project.id);
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
