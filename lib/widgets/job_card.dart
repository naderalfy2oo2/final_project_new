import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String name;
  final String category;
  final String location;
  final String privacy;
  final int likes;

  const JobCard({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.name,
    required this.category,
    required this.location,
    required this.privacy,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // تأكد إن ده ارتفاع كافي لكل المحتوى الداخلي
      width: 400,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Image.asset(
                    imageAsset,
                    fit: BoxFit.cover,
                    // ارتفاع الصورة
                  ),
                ),
                const SizedBox(height: 16),
                _infoRow(Icons.title, title),
                _infoRow(Icons.person, name),
                _infoRow(Icons.category, category),
                _infoRow(Icons.location_on, location),
                _infoRow(Icons.lock, privacy),
                _infoRow(Icons.favorite, 'Likes: $likes'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
