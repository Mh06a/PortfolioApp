import 'package:flutter/material.dart';
import 'package:protfolio_app/Views/main_screen.dart';
import 'package:protfolio_app/services/project_service.dart';
import 'package:protfolio_app/services/skill_service.dart';
import 'package:protfolio_app/utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final skills = await SkillService().getAllSkills();
  final projects = await ProjectService().getAllProjects();

  for (var skill in skills) {
    print(skill.name);
  }

  print("-------------------------------------");

  for (var pr in projects) {
    print(pr.name);
  }

  runApp(const ProtfolioApp());
}

class ProtfolioApp extends StatelessWidget {
  const ProtfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: MainScreen(),
    );
  }
}
