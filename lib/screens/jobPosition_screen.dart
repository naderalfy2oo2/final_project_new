import 'package:flutter/material.dart';
import 'home_screen.dart';

class JobPositionScreen extends StatefulWidget {
  const JobPositionScreen({super.key});

  @override
  State<JobPositionScreen> createState() => _JobPositionScreenState();
}

class _JobPositionScreenState extends State<JobPositionScreen> {
  final List<String> suggestions = [
    "Academic Administrator",
    "Backend Developer",
    "Backend Engineer",
    "Backend Technical lead",
    "Backup Administrator",
    "Campaign Director",
    "Campaign Specialist",
    "Data Analytics Analyst",
  ];

  final List<String> selectedTags = ["UI/UX Designer", "Product Designer"];

  void addTag(String job) {
    if (!selectedTags.contains(job)) {
      setState(() {
        selectedTags.add(job);
      });
    }
  }

  void removeTag(String job) {
    setState(() {
      selectedTags.remove(job);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "What type of jobs are you looking for?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter job position",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: selectedTags.map((tag) {
                return Chip(
                  label: Text(tag),
                  onDeleted: () => removeTag(tag),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: suggestions.map((job) {
                  return ListTile(
                    title: Text(job),
                    trailing: const Icon(Icons.add),
                    onTap: () => addTag(job),
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
