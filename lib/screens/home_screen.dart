import 'package:final_project/widgets/job_card.dart';
import 'package:flutter/material.dart';
import '../widgets/JobSeekerCard.dart';
import '../widgets/category_chip.dart';
import 'categories_screen.dart';
import 'complaints_screen.dart';
import 'job_list_screen.dart';
import 'job_seekers_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.black12,
        width: 250,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),

      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'J',
                style: TextStyle(
                  color: Colors.blue, // Blue color for "J"
                  fontWeight: FontWeight.w500,
                  fontSize: 25, // Adjust the font size as needed
                ),
              ),
              TextSpan(
                text: 'obland',
                style: TextStyle(
                  color: Colors.black, // Black color for the rest of the text
                  fontWeight: FontWeight.w500,
                  fontSize: 25, // Adjust the font size as needed
                ),
              ),
            ],
          ),
        ),
      ),

      // Add other widgets for the home screen

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Complaints Banner
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.blue[400],
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Colors.blue.withOpacity(0.5),
                    BlendMode.darken,
                  ),
                  image: AssetImage('assets/workers.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "for complaints",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ComplaintsPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                      ),
                      child: const Text(
                        "Contact us",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _sectionHeader(context, "Categories", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoriesScreen()),
              );
            }),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  CategoryChip(icon: Icons.business, label: "All Jobs"),
                  SizedBox(width: 10),
                  CategoryChip(icon: Icons.school, label: "Teaching"),
                  SizedBox(width: 10),
                  CategoryChip(
                      icon: Icons.manage_accounts, label: "Management"),
                  SizedBox(width: 10),
                  CategoryChip(icon: Icons.design_services, label: "Design"),
                  SizedBox(width: 10),
                  CategoryChip(icon: Icons.code, label: "Development"),
                ],
              ),
            ),
            const SizedBox(height: 20),

            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionHeader(context, "jobs", () {
                    // Navigate or show snackbar
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JobListScreen()),
                    );
                  }),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 400,
                    // ارتفاع الكارد
                    // أو الطول اللي يناسب تصميمك
                    // أو الطول اللي يناسب ,
                    width: 400,

                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      children: const [
                        JobCard(
                          imageAsset: 'assets/Screenshot (85).png',
                          title: 'Riyadh, Ishbilia district',
                          name: 'Nader Sulaiman',
                          category: 'Marketing',
                          location: 'Saudi Arabia',
                          privacy: 'Hidden',
                          likes: 232,
                        ),
                        JobCard(
                          imageAsset: 'assets/proxy_image.png',
                          title: 'Marketing employee',
                          name: 'Job Admin',
                          category: 'Sales',
                          location: 'Jordan',
                          privacy: 'Hidden',
                          likes: 1284,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            _sectionHeader(context, "Job Seekers", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JobSeekersScreen()),
              );
            }),
            const SizedBox(height: 10),
            Column(
              children: const [
                JobSeekerCard(
                  imageAsset: 'assets/photo_Ahmed.png',
                  name: 'Ahmed mohamed abdelhady',
                  job: 'Teaching',
                  country: 'Egypt',
                  gender: 'Male',
                  age: 29,
                  experience: 1,
                ),
                JobSeekerCard(
                  imageAsset: 'assets/unnamed.png',
                  name: 'Mohamed naser ali',
                  job: 'Management',
                  country: 'Egypt',
                  gender: 'Male',
                  age: 33,
                  experience: 8,
                ),
                JobSeekerCard(
                  imageAsset: 'assets/unnamed.png',
                  name: 'salma mohamed',
                  job: 'Marketing',
                  country: 'Egypt',
                  gender: 'Female',
                  age: 26,
                  experience: 2,
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black87,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.description), label: 'Description'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Create'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

Widget _sectionHeader(
    BuildContext context, String title, VoidCallback onShowAll) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: onShowAll,
          child: const Text(
            'Show All',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    ),
  );
}
