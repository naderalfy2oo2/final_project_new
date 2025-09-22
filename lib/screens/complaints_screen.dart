import 'package:flutter/material.dart';
import 'report_form_screen.dart';
import 'job_details_screen.dart';

class ComplaintsPage extends StatelessWidget {
  const ComplaintsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complaints',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose the appropriate section for help',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              label: 'Submit a complaint',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ReportFormScreen()),
              ),
            ),
            const SizedBox(height: 15),
            _buildButton(
              context,
              label: 'Hotline',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const JobDetailsScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {required String label, required VoidCallback onTap}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0D99FF),
        minimumSize: const Size(double.infinity, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(color: Colors.white, fontSize: 16)),
          const Icon(Icons.arrow_forward, color: Colors.white),
        ],
      ),
    );
  }
}
