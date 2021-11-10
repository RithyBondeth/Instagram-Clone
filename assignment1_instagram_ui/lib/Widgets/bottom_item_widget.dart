import 'package:flutter/material.dart';
class BottomItemWideget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Color backgroundColor;
  BottomItemWideget({required this.icon, required this.text, required this.color, required this.backgroundColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: backgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 27),
          Text(text, style: TextStyle(color: color, fontSize: 0)),
        ],
      ),
    );
  }
}
