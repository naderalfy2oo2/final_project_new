import 'package:flutter/material.dart';

class ContactIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const ContactIcon({super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color.withOpacity(0.2),
      child: Icon(icon, color: color),
    );
  }
}
