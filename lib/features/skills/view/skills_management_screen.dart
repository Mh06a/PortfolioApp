import 'package:flutter/material.dart';
import 'package:protfolio_app/features/skills/provider/skills_provider.dart';
import 'package:protfolio_app/features/skills/view/add_edit_skill_screen.dart';
import 'package:protfolio_app/core/theme/app_colors.dart';
import 'package:protfolio_app/shared/widgets/custom_dialog.dart';
import 'package:protfolio_app/shared/widgets/custom_snackbar.dart';
import 'package:protfolio_app/shared/widgets/error_view.dart';
import 'package:protfolio_app/shared/widgets/loading_view.dart';
import 'package:provider/provider.dart';

class SkillsManagementScreen extends StatelessWidget {
  const SkillsManagementScreen({super.key});
  //step4 ----> here I will call build function to create the page :
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SkillsProvider>();

    if (provider.isLoading) {
      return LoadingView();
    }

    if (provider.errorMessage != null) {
      return ErrorView(
        message: provider.errorMessage!,
        onRetry: provider.loadData,
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Skills Management")),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddEditSkillScreen()),
          );

          if (result == true && context.mounted) {
            await provider.loadData();
          }
        },
        child: Icon(Icons.add),
      ),

      body: RefreshIndicator(
        onRefresh: provider.loadData,
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: provider.skillsCount,
          itemBuilder: (context, index) {
            final skill = provider.skills[index];

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
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddEditSkillScreen(skill: skill),
                          ),
                        );

                        if (result == true && context.mounted) {
                          await provider.loadData();
                        }
                      },
                    ),

                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => CustomDialog(
                            title: "Delete Skill",
                            message:
                                "Are you sure you want to delete ${skill.name}?",
                            onDelete: () async {
                              final success = await context
                                  .read<SkillsProvider>()
                                  .deleteSkill(skill.id);

                              if (!context.mounted) return;

                              if (success) {
                                CustomSnackbar.success(
                                  context,
                                  "Skill deleted successfully",
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
  }
}
