import 'package:flutter/material.dart';
import 'package:protfolio_app/Views/about_screen.dart';
import 'package:protfolio_app/Views/contact_screen.dart';
import 'package:protfolio_app/Views/home_screen.dart';
import 'package:protfolio_app/Views/skills_screen.dart';
import 'package:protfolio_app/widgets/custom_bottom_nav.dart';
import 'package:protfolio_app/widgets/project_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //step1 ----> create Class variables :
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    SkillsScreen(),
    ProjectsScreen(),
    AboutScreen(),
    ContactScreen(),
  ];

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
