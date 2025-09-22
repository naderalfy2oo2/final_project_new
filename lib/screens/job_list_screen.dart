import 'package:flutter/material.dart';
import '../widgets/job_category_tile.dart';
import '../widgets/job_list_job_card.dart';

class JobListScreen extends StatefulWidget {
  const JobListScreen({Key? key}) : super(key: key);

  @override
  State<JobListScreen> createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
  int selectedIndex = 0;

  final List<String> categories = [
    "All Jobs",
    "Teaching",
    "Management",
    "Marketing"
  ];

  final List<IconData> categoryIcons = [
    Icons.grid_view,
    Icons.school,
    Icons.business_center,
    Icons.campaign
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          children: [
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text("Jobs",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey[600]),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search by job name",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Searching...')),
                              );
                            },
                            child: const Text(
                              "Search",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.unfold_more, color: Colors.blue),
                  const SizedBox(width: 8),
                  const Icon(Icons.filter_alt, color: Colors.blue),
                ],
              ),
            ),

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(categories.length, (index) {
                    return GestureDetector(
                      onTap: () => setState(() => selectedIndex = index),
                      child: JobCategoryTile(
                        icon: categoryIcons[index],
                        title: categories[index],
                        isSelected: selectedIndex == index,
                      ),
                    );
                  }),
                ),
              ),
            ),

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: const [
                  Text("Results: 1235",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Spacer(),
                  Icon(Icons.grid_view, color: Colors.blue),
                ],
              ),
            ),

            const SizedBox(height: 8),

      
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.75,
                  children: const [
                    JobListJobCard(
                      imageAsset: 'assets/Screenshot (85).png',
                      title: 'Riyadh, ishabilia district',
                      name: 'Nader Sulaiman',
                      category: 'Marketing',
                      location: 'Saudi Arabia',
                      privacy: 'Hidden',
                      likes: 292,
                    ),
                    JobListJobCard(
                      imageAsset: 'assets/proxy_image.png',
                      title: 'sales employee required',
                      name: 'job Admin',
                      category: 'sales',
                      location: 'Jordan',
                      privacy: 'Hidden',
                      likes: 1284,
                    ),
                    JobListJobCard(
                      imageAsset: 'assets/Screenshot (356).png',
                      title: 'A desert restaurant to work in Riyadh',
                      name: 'Job Admin',
                      category: 'Restaurant',
                      location: 'Saudi Arabia',
                      privacy: 'Hidden',
                      likes: 350,
                    ),
                    JobListJobCard(
                      imageAsset: 'assets/Screenshot (356).png',
                      title: 'A cook is required to work in AI Batinah',
                      name: 'Job Admin',
                      category: 'Restaurants',
                      location: 'Oman',
                      privacy: 'Hidden',
                      likes: 210,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
