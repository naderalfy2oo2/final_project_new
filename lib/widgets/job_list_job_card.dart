import 'package:flutter/material.dart';

class JobListJobCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String name;
  final String category;
  final String location;
  final String privacy;
  final int likes;

  const JobListJobCard({
    Key? key,
    required this.imageAsset,
    required this.title,
    required this.name,
    required this.category,
    required this.location,
    required this.privacy,
    required this.likes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imageAsset),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
          const SizedBox(height: 4),
          Text(category, style: const TextStyle(color: Colors.grey)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.lock, size: 14, color: Colors.grey),
              Row(
                children: [
                  const Icon(Icons.favorite_border,
                      size: 14, color: Colors.red),
                  const SizedBox(width: 4),
                  Text('$likes',
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
