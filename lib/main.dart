import 'package:flutter/material.dart';
import 'package:protfolio_app/features/profile/provider/profile_provider.dart';
import 'package:protfolio_app/features/projects/provider/project_provider.dart';
import 'package:protfolio_app/features/skills/provider/skills_provider.dart';
import 'package:protfolio_app/main_screen.dart';
import 'package:protfolio_app/core/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfileProvider()..loadData()),
        ChangeNotifierProvider(create: (_) => SkillsProvider()..loadData()),
        ChangeNotifierProvider(create: (_) => ProjectProvider()..loadData()),
      ],
      child: ProtfolioApp(),
    ),
  );
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
