import 'package:flutter/material.dart';
import 'package:protfolio_app/features/profile/view/about_screen.dart';
import 'package:protfolio_app/features/settings/view/settings_screen.dart';
import 'package:protfolio_app/features/home/view/home_screen.dart';
import 'package:protfolio_app/features/skills/view/skills_screen.dart';
import 'package:protfolio_app/shared/widgets/custom_bottom_nav.dart';
import 'package:protfolio_app/features/projects/view/projects_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //step1 ----> create Class variables :
  int _currentIndex = 0;
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();

    _screens = [
      HomeScreen(),
      SkillsScreen(),
      ProjectsScreen(),
      AboutScreen(),
      SettingsScreen(),
    ];
  }

  //step2 ----> call a build function :
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //step2.1 ----> set body :
      body: IndexedStack(index: _currentIndex, children: _screens),

      //step2.2 ----> set bottom navigation bar :
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
