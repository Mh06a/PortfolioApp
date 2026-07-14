import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  //step1 ----> here I will Create the class's variables :
  final String tilte;
  final IconData icon;
  final VoidCallback onPressed;
  final Color? color;
  final Color? tilteColor;
  final double? width;
  final Color? iconColor;

  //step2 ----> here I will Create The constructor :
  const CustomButton({
    super.key,
    required this.tilte,
    required this.icon,
    required this.onPressed,
    this.color,
    this.width,
    this.tilteColor,
    this.iconColor,
  });

  //step3 ----> here I will call build function to create the widegt :
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(tilte),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          iconColor: iconColor,
          foregroundColor: tilteColor,
        ),
      ),
    );
  }
}
