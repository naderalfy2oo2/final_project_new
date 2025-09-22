import 'package:flutter/material.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Choose Language",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLanguageButton(
                  context, "assets/American photo.png", "English"),
              const SizedBox(width: 20),
              _buildLanguageButton(context, "assets/egypt photo.png", "Arabic"),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_selectedLanguage.isNotEmpty) {
                Navigator.pushNamed(context, '/signin');
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3064FF),
              fixedSize: const Size(350, 47),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text("Next",
                style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
          const SizedBox(height: 20),
          const Text(
            "You can change the language at any time.",
            style: TextStyle(fontSize: 14, color: Color(0xff484848)),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageButton(
      BuildContext context, String flagPath, String language) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedLanguage = language;
        });
      },
      child: Column(
        children: [
          Image.asset(flagPath, width: 50, height: 50),
          const SizedBox(height: 5),
          Text(language, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
