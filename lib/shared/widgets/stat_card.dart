import 'package:flutter/material.dart';
import 'package:protfolio_app/core/theme/app_colors.dart';

class StatCard extends StatelessWidget {
  //step1 ----> here I will Create the class's variables :
  final String title;
  final String value;

  //step2 ----> here I will Create The constructor :
  const StatCard({super.key, required this.title, required this.value});

  //step3 ----> here I will call build function to create the widegt :
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              Text(
                value,
                style: TextStyle(
                  color: Color.fromARGB(255, 102, 107, 106),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 5),

              Text(
                title,
                style: TextStyle(color: AppColors.textSecondary, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
