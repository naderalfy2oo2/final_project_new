import 'package:flutter/material.dart';

class JobPositionSelectionScreen extends StatelessWidget {
  const JobPositionSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Job Position Selection")),
      body: const Center(
        child: Text("Job Position Selection Screen",
            style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
