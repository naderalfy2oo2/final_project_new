import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/contact_icon.dart';
import '../widgets/info_chip.dart';
import '../widgets/profile_section.dart';

class ProfileScreen extends StatelessWidget {
  final Color grayColor = Colors.grey.shade200;

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/photo_Ahmed.png'),
                    backgroundColor: Colors.black12,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Ahmed mohamed abdelhady',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: [
                      InfoChip(icon: Icons.work, label: 'Teaching'),
                      InfoChip(icon: Icons.location_on, label: 'Egypt'),
                      InfoChip(icon: Icons.male, label: 'Male'),
                      InfoChip(
                          icon: Icons.calendar_today, label: 'Age: 29 Years'),
                      InfoChip(
                          icon: Icons.star,
                          label: 'Years Of Experience: 1 Years'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ContactIcon(icon: Icons.phone, color: Colors.blue),
                      SizedBox(width: 20),
                      ContactIcon(icon: Icons.g_mobiledata, color: Colors.red),
                      SizedBox(width: 20),
                      ContactIcon(
                        icon: FontAwesomeIcons.whatsapp,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            ProfileSection(
              title: 'Brief About Me',
              content: 'Math teacher',
            ),
            SizedBox(height: 20),
            ProfileSection(
              title: 'University or College',
              content: 'Cairo University',
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Share The Ad",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Icon(Icons.share),
              ],
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/photo_Ahmed.png'),
                    backgroundColor: Colors.black12,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Ahmed mohamed abdelhady'),
                          SizedBox(width: 10),
                          Icon(
                            Icons.check_circle,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text('Egypt'),
                    ],
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Advertiser page',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
