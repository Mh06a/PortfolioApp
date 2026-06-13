import 'package:flutter/material.dart';
import 'package:protfolio_app/utils/app_theme.dart';

void main() {
  runApp(const ProtfolioApp());
}

class ProtfolioApp extends StatelessWidget {
  const ProtfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
    );
  }
}
