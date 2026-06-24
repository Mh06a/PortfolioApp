import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  //step1 ---->  Create a vars for class :
  final int currentIndex;
  final Function(int) onTap;

  //step2 ----> Create a constructor :
  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  //step3 ----> call build function :
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,

      //step3.1 ----> Create Items Bar :
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),

        BottomNavigationBarItem(
          icon: Icon(Icons.psychology_outlined),
          label: "Skills",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.work_outline),
          label: "Projects",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "About",
        ),

        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
    );
  }
}
