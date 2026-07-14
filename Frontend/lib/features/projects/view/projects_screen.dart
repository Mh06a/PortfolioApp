import 'package:flutter/material.dart';
import 'package:protfolio_app/features/projects/provider/project_provider.dart';
import 'package:protfolio_app/shared/widgets/custom_header.dart';
import 'package:protfolio_app/shared/widgets/empty_view.dart';
import 'package:protfolio_app/shared/widgets/error_view.dart';
import 'package:protfolio_app/shared/widgets/loading_view.dart';
import 'package:protfolio_app/shared/widgets/project_card.dart';
import 'package:provider/provider.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  //step3 ----> here I will call build function to create the page :
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProjectProvider>();
    if (provider.isLoading) {
      return LoadingView();
    }

    if (provider.errorMessage != null) {
      return ErrorView(
        message: provider.errorMessage!,
        onRetry: provider.loadData,
      );
    }

    if (provider.isEmpty) {
      return EmptyView(
        icon: Icons.code_off,
        title: "No projects Found",
        subtitle: "Add your first project.",
      );
    }

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: provider.loadData,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //step3.1 ---> here I will Create Name of Secreen :
                  CustomHeader(
                    screenTitle: "Projects",
                    secondTitle: provider.projectsSubtitle,
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

                        SizedBox(width: 8),

                        FilterChip(
                          label: Text("Desktop"),
                          selected: false,
                          onSelected: (_) {},
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15),
                  //step3.3 ---> here I will Create Project Card section :
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: provider.projectsCount,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: ProjectCard(project: provider.projects[index]),
                      );
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
