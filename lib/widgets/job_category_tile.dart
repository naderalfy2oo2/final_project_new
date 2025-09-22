import 'package:flutter/material.dart';

class JobCategoryTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;

  const JobCategoryTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: isSelected ? Colors.white : Colors.black),
          const SizedBox(width: 6),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
