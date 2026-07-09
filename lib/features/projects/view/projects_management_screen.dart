import 'package:flutter/material.dart';
import 'package:protfolio_app/features/projects/provider/project_provider.dart';
import 'package:protfolio_app/features/projects/view/add_edit_project_screen.dart';
import 'package:protfolio_app/core/theme/app_colors.dart';
import 'package:protfolio_app/shared/widgets/custom_dialog.dart';
import 'package:protfolio_app/shared/widgets/custom_snackbar.dart';
import 'package:protfolio_app/shared/widgets/error_view.dart';
import 'package:protfolio_app/shared/widgets/loading_view.dart';
import 'package:provider/provider.dart';

class ProjectsManagementScreen extends StatelessWidget {
  const ProjectsManagementScreen({super.key});

  //step5 ----> here I will call build function to create the page :
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProjectProvider()..loadData(),
      builder: (context, child) {
        final provider = context.watch<ProjectProvider>();

        if (provider.isLoading) {
          return const LoadingView();
        }

        if (provider.errorMessage != null) {
          return ErrorView(
            message: provider.errorMessage!,
            onRetry: provider.loadData,
          );
        }
        return Scaffold(
          appBar: AppBar(title: Text("Projects Management")),

          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),

            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChangeNotifierProvider.value(
                    value: context.read<ProjectProvider>(),
                    child: const AddEditProjectScreen(),
                  ),
                ),
              );

              if (result == true && context.mounted) {
                await provider.loadData();
              }
            },
          ),

          body: RefreshIndicator(
            onRefresh: provider.loadData,
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: provider.projectsCount,
              itemBuilder: (context, index) {
                final project = provider.projects[index];

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
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ChangeNotifierProvider.value(
                                  value: context.read<ProjectProvider>(),
                                  child: AddEditProjectScreen(project: project),
                                ),
                              ),
                            );

                            if (result == true && context.mounted) {
                              provider.loadData();
                            }
                          },
                        ),

                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => CustomDialog(
                                title: "Delete Projetc",
                                message:
                                    "Are you sure you want to delete ${project.name}?",
                                onDelete: () async {
                                  final success = await context
                                      .read<ProjectProvider>()
                                      .deleteProject(project.id);

                                  if (!context.mounted) return;

                                  if (success) {
                                    CustomSnackbar.success(
                                      context,
                                      "Project deleted successfully",
                                    );
                                  } else {
                                    CustomSnackbar.error(
                                      context,
                                      provider.errorMessage!,
                                    );
                                  }
                                },
                              ),
                            );
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
      },
    );
  }
}
