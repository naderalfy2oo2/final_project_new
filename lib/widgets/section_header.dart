import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget sectionHeader(
    BuildContext context, String title, VoidCallback onShowAll) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: onShowAll,
          child: const Text('Show All', style: TextStyle(color: Colors.blue)),
        ),
      ],
    ),
  );
}
