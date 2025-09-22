import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryChip({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 18),
      label: Text(label),
    );
  }
}
