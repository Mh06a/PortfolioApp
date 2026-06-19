import 'package:flutter/material.dart';
import 'package:protfolio_app/Models/project.dart';
import 'package:protfolio_app/services/project_service.dart';

class ProjectController extends ChangeNotifier {
  //step1 ----> here I will Create the class's variables :
  final ProjectService _service = ProjectService();
  List<Project> _projects = [];
  bool _isLoading = false;
  String? _errorMessage;

  //step2 ----> here I will Create a getter && setter  :
  List<Project> get projects => _projects;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  //step3 ----> here I will Create a function to load projects <get all projects> :
  Future<void> loadProjects() async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      _projects = await _service.getAllProjects();
    } catch (exception) {
      _errorMessage = exception.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //step4 ----> here I will Create a function to add project :
  Future<void> addProject(Project project) async {
    try {
      _isLoading = true;
      _errorMessage = null;

      notifyListeners();

      final newProject = await _service.addProject(project);
      _projects.add(newProject);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //step5 ----> here I will Create a function to update project :
  Future<void> updateProject(String name, Project project) async {
    try {
      _isLoading = true;
      _errorMessage = null;

      notifyListeners();

      final updatedProject = await _service.updateProject(name, project);
      final index = _projects.indexWhere((s) => s.name == name);

      if (index != -1) {
        _projects[index] = updatedProject;
      }
    } catch (exception) {
      _errorMessage = exception.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //step6 ----> here I will Create a function to delete project :
  Future<void> deleteProject(int id) async {
    try {
      _isLoading = true;
      _errorMessage = null;

      notifyListeners();

      await _service.deleteProject(id);

      _projects.removeWhere((project) => project.id == id);
    } catch (exception) {
      _errorMessage = exception.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
