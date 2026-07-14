import 'package:flutter/material.dart';
import 'package:protfolio_app/core/themes/app_colors.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: .center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 5),
          Text(
            "Loading...",
            style: TextStyle(color: AppColors.textPrimary, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
