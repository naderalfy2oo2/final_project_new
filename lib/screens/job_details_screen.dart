import 'package:flutter/material.dart';

import 'profile_screen.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/proxy_image.png',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue,
                    child: IconButton(
                      icon: Icon(Icons.favorite_sharp,
                          size: 25, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sales employees are required at Bloom Perfumes Company with salaries up to 8,000 riyals',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),

                    // Tags
                    Wrap(
                      spacing: 8,
                      children: [
                        _buildTag(
                          Icons.visibility_off_outlined,
                          'Hidden',
                        ),
                        _buildTag(Icons.work_outline, 'Sales'),
                        _buildTag(
                          Icons.location_on_outlined,
                          'Jordan',
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    // Views
                    Row(
                      children: [
                        Icon(Icons.remove_red_eye,
                            size: 18, color: Colors.blue),
                        SizedBox(width: 5),
                        Text(
                          '292',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Job Details
                    Text(
                      'Job Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '- The applicant must be a Saudi national\n'
                      '- Previous experience is required\n'
                      '- Working hours are 10 hours and vacation is two days a week\n'
                      '- Age is over 20 and under 45 years',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 20),

                    // Advertiser section

                    ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.blue,
                        child: Text('B',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                      title: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Bloom'),
                          SizedBox(
                              width:
                                  10), // Adds space between the text and the icon
                          Icon(
                            Icons.check_circle,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ],
                      ),
                      subtitle: Text('Kuwait'),
                      trailing: Wrap(
                        spacing: 8,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text('Advertiser page',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'WhatsApp',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildTag(IconData icon, String label) {
    return Chip(
      avatar: Icon(icon, size: 18),
      label: Text(label),
    );
  }
}
