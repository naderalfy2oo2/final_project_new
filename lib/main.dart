import 'package:flutter/material.dart';

import 'screens/categories_screen.dart';
import 'screens/complaints_screen.dart';
import 'screens/home_screen.dart';
import 'screens/job_details_screen.dart';
import 'screens/job_list_screen.dart';
import 'screens/job_seekers_screen.dart';
import 'screens/language_selection_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/report_form_screen.dart';
import 'screens/sign_in_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/register_screen.dart'; // ✅ هنا بدل RegisterApp

class FinalApp extends StatelessWidget {
  const FinalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/language': (context) => LanguageSelectionScreen(),
        '/signin': (context) => SignInScreen(),
        '/register': (context) => RegisterScreen(), // ✅ صح
        "/home": (context) => HomeScreen(),

        '/complaints': (context) => ComplaintsPage(),
        '/jobPositionSelectionScreen': (context) =>
            JobPositionSelectionScreen(),
        '/ReportFormScreen': (context) => ReportFormScreen(),
        '/JobDetailsScreen': (context) => JobDetailsScreen(),
        '/profileScreen': (context) => ProfileScreen(),
        '/CategoriesScreen': (context) => CategoriesScreen(),
        '/JobSeekersScreen': (context) => JobSeekersScreen(),
        '/jobList': (context) => JobListScreen(),
      },
    );
  }
}

void main() {
  runApp(FinalApp());
}

class JobPositionSelectionScreen extends StatelessWidget {
  const JobPositionSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Job Position Selection"),
      ),
      body: Center(
        child: Text(
          "Job Position Selection Screen",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
