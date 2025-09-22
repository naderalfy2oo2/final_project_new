import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  final String title;
  final String content;

  const ProfileSection({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(content, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}
