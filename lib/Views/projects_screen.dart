import 'package:flutter/material.dart';
import 'package:protfolio_app/Controllers/project_controller.dart';
import 'package:protfolio_app/utils/app_colors.dart';
import 'package:protfolio_app/widgets/project_card.dart';

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
                  Text(
                    "Projects",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    "${_projectController.projects.length} featured works",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
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
