import 'package:flutter/material.dart';
import 'package:protfolio_app/features/projects/controller/project_controller.dart';
import 'package:protfolio_app/features/projects/model/project.dart';

class ProjectProvider extends ChangeNotifier {
  //step1 ----> here I will Create the class's variables :
  final ProjectController _projectController = ProjectController();

  // Step2 ----> create getter
  List<Project> get projects => _projectController.projects;

  bool get isLoading => _projectController.isLoading;
  String? get errorMessage => _projectController.errorMessage;
  int get projectsCount => projects.length;
  bool get isEmpty => projects.isEmpty;
  String get projectsSubtitle => "${projects.length} featured works";

  //step3 ----> here I will create load function :
  Future<void> loadData() async {
    await _projectController.loadProjects();
    notifyListeners();
  }

  //step4 ----> here I will create function  to Add project  :
  Future<bool> addProject(Project project) async {
    await _projectController.addProject(project);

    if (_projectController.errorMessage == null) {
      await loadData();
      return true;
    }

    notifyListeners();
    return false;
  }

  //step5 ----> here I will create function  To Edit project :
  Future<bool> updateProject(String oldName, Project project) async {
    await _projectController.updateProject(oldName, project);

    if (_projectController.errorMessage == null) {
      await loadData();
      return true;
    }

    notifyListeners();
    return false;
  }

  //step6 ----> here I will create function to delete project :
  Future<bool> deleteProject(int id) async {
    await _projectController.deleteProject(id);

    if (_projectController.errorMessage == null) {
      await loadData();
      return true;
    }

    notifyListeners();
    return false;
  }
}
