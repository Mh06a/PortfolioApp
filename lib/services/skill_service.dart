import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/constants.dart';
import '../models/skill.dart';

class SkillService {
  //step1 ----> here I will Create function to get all skills :
  Future<List<Skill>> getAllSkills() async {
    final response = await http.get(Uri.parse("${Constants.baseUrl}/skills"));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((skill) => Skill.fromJson(skill)).toList();
    }

    throw Exception("Failed");
  }
}
