import 'package:flutter/material.dart';

class JobSeekersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back, size: 26, color: Colors.black),
                          SizedBox(width: 4),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Job Seekers',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        _showSortBottomSheet(context);
                      },
                      child: Icon(Icons.unfold_more, color: Colors.blue),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        _showFilterBottomSheet(context);
                      },
                      child:
                          Icon(Icons.filter_alt_outlined, color: Colors.blue),
                    ),
                  ],
                ),
              ),

              
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    jobCategoryTile(Icons.apps, "All Jobs", true),
                    jobCategoryTile(Icons.school, "Teaching", false),
                    jobCategoryTile(Icons.business_center, "Management", false),
                    jobCategoryTile(Icons.campaign, "Marketing", false),
                  ],
                ),
              ),

              
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: Row(
                  children: [
                    Text("Results: 1350"),
                    Spacer(),
                    Icon(Icons.view_list),
                  ],
                ),
              ),

              
              Expanded(
                child: ListView(
                  children: [
                    jobCard(
                      imageAsset: 'assets/photo_Ahmed.png',
                      name: "Ahmed mohamed abdelhady",
                      job: "Teaching",
                      location: "Egypt",
                      gender: "Male",
                      age: 29,
                      experience: 1,
                    ),
                    jobCard(
                      imageAsset: 'assets/unnamed.png',
                      name: "Mohamed naser ali",
                      job: "Management",
                      location: "Egypt",
                      gender: "Male",
                      age: 33,
                      experience: 8,
                    ),
                    jobCard(
                      imageAsset: 'assets/unnamed.png',
                      name: "salma mohamed",
                      job: "Marketing",
                      location: "Egypt",
                      gender: "Female",
                      age: 24,
                      experience: 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSortBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text("Sort by",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                  SizedBox(width: 8),
                  Icon(Icons.unfold_more, color: Colors.blue),
                ],
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text("Newest first"),
                leading:
                    Radio(value: true, groupValue: true, onChanged: (_) {}),
              ),
              ListTile(
                title: Text("Oldest first"),
                leading:
                    Radio(value: false, groupValue: true, onChanged: (_) {}),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text("Apply",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ],
          ),
        );
      },
    );
  }

  
  void _showFilterBottomSheet(BuildContext context) {
    String selectedDate = "Date of added";
    String selectedCountry = "Country";

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return StatefulBuilder(builder: (context, setState) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text("Filter by",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                    SizedBox(width: 8),
                    Icon(Icons.filter_alt_outlined, color: Colors.blue),
                  ],
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: selectedDate,
                  decoration: InputDecoration(labelText: 'Date of added'),
                  items: ['Date of added', 'Last 7 days', 'Last 30 days']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) => setState(() => selectedDate = val!),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: selectedCountry,
                  decoration: InputDecoration(labelText: 'Country'),
                  items: ['Country', 'Egypt', 'UAE', 'KSA']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (val) => setState(() => selectedCountry = val!),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text("Apply",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  
  Widget jobCategoryTile(IconData icon, String title, bool isSelected) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: isSelected ? Colors.white : Colors.black),
          SizedBox(width: 6),
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

  
  Widget jobCard({
    required String imageAsset,
    required String name,
    required String job,
    required String location,
    required String gender,
    required int age,
    required int experience,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage(imageAsset),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(job, style: TextStyle(color: Colors.blue)),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14, color: Colors.grey),
                      SizedBox(width: 2),
                      Text(location, style: TextStyle(fontSize: 12)),
                      SizedBox(width: 8),
                      Icon(Icons.person, size: 14, color: Colors.grey),
                      SizedBox(width: 2),
                      Text(gender, style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text("Age: $age, Experience: $experience years",
                      style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
