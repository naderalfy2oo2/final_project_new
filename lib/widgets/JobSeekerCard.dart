import 'package:flutter/material.dart';

class JobSeekerCard extends StatelessWidget {
  final String imageAsset;
  final String name;
  final String job;
  final String country;
  final String gender;
  final int age;
  final int experience;

  const JobSeekerCard({
    super.key,
    required this.imageAsset,
    required this.name,
    required this.job,
    required this.country,
    required this.gender,
    required this.age,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset(imageAsset, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            _infoRow(Icons.person, name),
            _infoRow(Icons.work, job),
            _infoRow(Icons.location_on, country),
            _infoRow(Icons.person, gender),
            _infoRow(Icons.calendar_today, 'Age: $age'),
            _infoRow(Icons.work, 'Experience: $experience years'),
          ],
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
