import 'package:flutter/material.dart';
import 'package:protfolio_app/features/projects/controller/project_controller.dart';
import 'package:protfolio_app/shared/widgets/custom_header.dart';
import 'package:protfolio_app/shared/widgets/empty_view.dart';
import 'package:protfolio_app/shared/widgets/error_view.dart';
import 'package:protfolio_app/shared/widgets/loading_view.dart';
import 'package:protfolio_app/shared/widgets/project_card.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  //step1 ----> here I will Create the class's variables :
  final ProjectController _projectController = ProjectController();

  //step2 ----> here I will call initState becasue use load functions :
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await _projectController.loadProjects();
    setState(() {});
  }

  //step3 ----> here I will call build function to create the page :
  @override
  Widget build(BuildContext context) {
    if (_projectController.isLoading) {
      return LoadingView();
    }

    final error = _projectController.errorMessage;

    if (error != null) {
      return ErrorView(message: error, onRetry: _loadData);
    }

    if (_projectController.projects.isEmpty) {
      return EmptyView(
        icon: Icons.code_off,
        title: "No Projects Found",
        subtitle: "Add your first project.",
      );
    }

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _loadData,
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
                    secondTitle:
                        "${_projectController.projects.length} featured works",
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
                    itemCount: _projectController.projects.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: ProjectCard(
                          project: _projectController.projects[index],
                        ),
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
