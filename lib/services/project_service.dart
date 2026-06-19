import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:protfolio_app/exceptions/duplicate_project_exception.dart';
import 'package:protfolio_app/exceptions/not_found_exception.dart';
import '../utils/constants.dart';
import 'package:protfolio_app/Models/project.dart';

class ProjectService {
  //step1 ----> here I will Create function to get all projects :
  Future<List<Project>> getAllProjects() async {
    final response = await http.get(Uri.parse("${Constants.baseUrl}/projects"));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((project) => Project.fromJson(project)).toList();
    }

    if (response.statusCode == 404) {
      throw NotFoundException("Project not found");
    }

    throw Exception("Failed");
  }

  //step2 ----> here I will Create a function to insert project :
  Future<Project> addProject(Project project) async {
    final response = await http.post(
      Uri.parse("${Constants.baseUrl}/projects"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": project.name,
        "description": project.description,
        "techStack": project.techStack,
        "githubLink": project.githubLink,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Project.fromJson(jsonDecode(response.body));
    }

    if (response.statusCode == 409) {
      throw DuplicateProjectException("Project already exists");
    }

    throw Exception("Failed to add project");
  }

  //step3 ----> here I will Create a function to update project :
  Future<Project> updateProject(String oldName, Project project) async {
    final response = await http.put(
      Uri.parse("${Constants.baseUrl}/projects/$oldName"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": project.name,
        "description": project.description,
        "techStack": project.techStack,
        "githubLink": project.githubLink,
      }),
    );

    if (response.statusCode == 200) {
      return Project.fromJson(jsonDecode(response.body));
    }

    if (response.statusCode == 404) {
      throw NotFoundException("Project not found");
    }
    throw Exception("Failed to update project");
  }

  //step4 ----> here I will Create a function to delete project :
  Future<void> deleteProject(int id) async {
    final response = await http.delete(
      Uri.parse("${Constants.baseUrl}/projects/$id"),
    );

    if (response.statusCode == 200 || response.statusCode == 204) {
      return;
    }

    if (response.statusCode == 404) {
      throw NotFoundException("Project not found");
    }

    throw Exception("Failed to delete project");
  }
}
