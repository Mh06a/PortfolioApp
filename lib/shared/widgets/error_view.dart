import 'package:flutter/material.dart';
import 'package:protfolio_app/core/themes/app_colors.dart';
import 'package:protfolio_app/shared/widgets/custom_button.dart';

class ErrorView extends StatelessWidget {
  //step1 ---->  Create a vars for class :
  final String title;
  final String message;
  final VoidCallback onRetry;

  //step2 ----> Create a constructor :
  const ErrorView({
    super.key,
    required this.message,
    required this.onRetry,
    this.title = "Something went wrong",
  });

  //step3 ----> here I will call build function to create the widegt :
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 70,
              color: Theme.of(context).colorScheme.error,
            ),

            SizedBox(height: 24),

            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 15),

            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),

            SizedBox(height: 25),

            CustomButton(
              tilte: "Try Again",
              icon: Icons.refresh,
              onPressed: onRetry,
            ),
          ],
        ),
      ),
    );
  }
}
