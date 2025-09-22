import 'package:flutter/material.dart';
import '../screens/sign_in_screen.dart';

import '../screens/register_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      
      home: const SignInScreen(),

  
      routes: {
        '/signin': (context) => const SignInScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}
