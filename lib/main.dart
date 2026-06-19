import 'package:flutter/material.dart';
import 'package:protfolio_app/Models/skill.dart';
import 'package:protfolio_app/Views/main_screen.dart';
import 'package:protfolio_app/services/skill_service.dart';
import 'package:protfolio_app/utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Skill skill = Skill(
    id: 4,
    name: "Flutter",
    level: "Intermediate",
    icon: "Flutter_icon",
  );

  final result = await SkillService().updateSkill("Flutter", skill);

  print(result.id);
  print(result.name);
  print(result.level);
  print(result.icon);

  print("-----------------------------------------------------");

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
