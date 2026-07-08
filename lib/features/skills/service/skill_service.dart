import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:protfolio_app/core/exceptions/duplicate_skill_exception.dart';
import 'package:protfolio_app/core/exceptions/not_found_exception.dart';
import '../../../core/constants/constants.dart';
import 'package:protfolio_app/features/skills/model/skill.dart';

class SkillService {
  //step1 ----> here I will Create function to get all skills :
  Future<List<Skill>> getAllSkills() async {
    final response = await http
        .get(Uri.parse("${Constants.baseUrl}/skills"))
        .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((skill) => Skill.fromJson(skill)).toList();
    }

    if (response.statusCode == 404) {
      return [];
    }

    throw Exception("Failed");
  }

  //step2 ----> here I will Create a function to insert skill :
  Future<Skill> addSkill(Skill skill) async {
    final response = await http
        .post(
          Uri.parse("${Constants.baseUrl}/skills"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "name": skill.name,
            "level": skill.level,
            "icon": skill.icon,
          }),
        )
        .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Skill.fromJson(jsonDecode(response.body));
    }

    if (response.statusCode == 409) {
      throw DuplicateSkillException("Skill already exists");
    }

    throw Exception("Failed to add skill");
  }

  //step3 ----> here I will Create a function to update skill :
  Future<Skill> updateSkill(String oldName, Skill skill) async {
    final response = await http
        .put(
          Uri.parse("${Constants.baseUrl}/skills/$oldName"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "name": skill.name,
            "level": skill.level,
            "icon": skill.icon,
          }),
        )
        .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      return Skill.fromJson(jsonDecode(response.body));
    }

    if (response.statusCode == 404) {
      throw NotFoundException("Skill not found");
    }

    throw Exception("Failed to update skill");
  }

  //step4 ----> here I will Create a function to delete skill :
  Future<void> deleteSkill(int id) async {
    final response = await http
        .delete(Uri.parse("${Constants.baseUrl}/skills/$id"))
        .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200 || response.statusCode == 204) {
      return;
    }

    if (response.statusCode == 404) {
      throw NotFoundException("Skill not found");
    }

    throw Exception("Failed to delete skill");
  }
}
