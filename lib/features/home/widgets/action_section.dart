import 'package:flutter/material.dart';
import 'package:protfolio_app/shared/widgets/custom_button.dart';

class ActionSection extends StatelessWidget {
  const ActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      tilte: "Download CV",
      icon: Icons.download,
      onPressed: () {},
      tilteColor: Colors.lightBlue,
      color: Color(0xFF2A2A35),
      iconColor: Colors.lightBlue,
    );
  }
}
