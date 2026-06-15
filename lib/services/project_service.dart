import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/constants.dart';
import '../models/project.dart';

class ProjectService {
  //step1 ----> here I will Create function to get all projects :
  Future<List<Project>> getAllProjects() async {
    final response = await http.get(Uri.parse("${Constants.baseUrl}/projects"));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((project) => Project.fromJson(project)).toList();
    }

    throw Exception("Failed");
  }
}
