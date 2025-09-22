import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:final_project/screens/profile_screen.dart';

class ReportFormScreen extends StatefulWidget {
  const ReportFormScreen({super.key});

  @override
  State<ReportFormScreen> createState() => _ReportFormScreenState();
}

class _ReportFormScreenState extends State<ReportFormScreen> {
  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController employerPhoneController = TextEditingController();
  final TextEditingController evidenceDescController = TextEditingController();

  String? selectedComplaint;
  String? imageBase64;
  String? fileBase64;

  // Fake Database
  List<Map<String, String>> fakeDatabase = [];

  @override
  void initState() {
    super.initState();
    _loadAssets(); // تحميل الصور والملفات عند بداية الشاشة
  }

  Future<void> _loadAssets() async {
    // تحميل صورة من assets وتحويلها Base64
    final imgBytes = await rootBundle.load('assets/programming.png');
    imageBase64 = base64Encode(imgBytes.buffer.asUint8List());

    // تحميل ملف من assets (TXT مثلا) وتحويله Base64
    final fileBytes = await rootBundle.load('assets/sample_cv.txt');
    fileBase64 = base64Encode(fileBytes.buffer.asUint8List());

    // Fake Database بعد تحميل الملفات
    fakeDatabase = [
      {
        "name": "ahmed",
        "contact": "12345",
        "company": "ABC Corp",
        "address": "Cairo",
        "employerPhone": "01094333266",
        "complaint": "1",
        "description": "flutter developer",
        "image": imageBase64 ?? "",
        "file": fileBase64 ?? "",
      },
      {
        "name": "mona",
        "contact": "67890",
        "company": "XYZ Ltd",
        "address": "Alex",
        "employerPhone": "0123456789",
        "complaint": "2",
        "description": "designer",
        "image": imageBase64 ?? "",
        "file": fileBase64 ?? "",
      },
    ];
    setState(() {});
  }

  // Fake API
  Future<bool> fakeApi() async {
    await Future.delayed(const Duration(seconds: 1)); // simulate delay

    // قيم المستخدم المدخلة بعد التنظيف
    final input = {
      "name": nameController.text.trim().toLowerCase(),
      "contact": contactController.text.trim(),
      "company": companyController.text.trim().toLowerCase(),
      "address": addressController.text.trim().toLowerCase(),
      "employerPhone": employerPhoneController.text.trim(),
      "description": evidenceDescController.text.trim().toLowerCase(),
      "complaint": selectedComplaint?.trim()
    };

    for (var user in fakeDatabase) {
      if (user["name"]!.toLowerCase() == input["name"] &&
          user["contact"] == input["contact"] &&
          user["company"]!.toLowerCase() == input["company"] &&
          user["address"]!.toLowerCase() == input["address"] &&
          user["employerPhone"] == input["employerPhone"] &&
          user["description"]!.toLowerCase() == input["description"] &&
          user["complaint"] == input["complaint"]) {
        debugPrint("✅ Data matched: ${user['name']}");
        return true; // success
      }
    }

    debugPrint("❌ Invalid data entered: $input");
    return false; // failed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                'assets/workers.png',
                height: 200,
                width: 1000,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 10),
              const Text(
                'Fill in the following information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 20),
              _buildTextField('Full name *', nameController),
              _buildTextField('Phone number or email *', contactController),
              _buildDropdown(),
              _buildTextField('Company or employer name *', companyController),
              _buildTextField(
                  'Detailed address of the workplace *', addressController),
              _buildTextField('Employer phone number (if applicable) *',
                  employerPhoneController),
              _buildUploadSection(),
              _buildTextField('Add a description to the evidence *',
                  evidenceDescController),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    bool result = await fakeApi();

                    if (result) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Invalid data, please try again!"),
                          backgroundColor: Colors.blue,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Send',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: selectedComplaint,
        items: const [
          DropdownMenuItem(value: '1', child: Text('Complaint 1')),
          DropdownMenuItem(value: '2', child: Text('Complaint 2')),
        ],
        onChanged: (value) {
          setState(() {
            selectedComplaint = value;
          });
        },
        decoration: InputDecoration(
          hintText: 'Select the type of complaint *',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }

  Widget _buildUploadSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Upload files or images *',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildUploadButton(Icons.image, 'Import Image', () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Image imported from assets")),
                );
              }),
              const SizedBox(width: 10),
              _buildUploadButton(Icons.attach_file, 'Import File', () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("File imported from assets")),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUploadButton(
      IconData icon, String label, VoidCallback onPressed) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label, style: const TextStyle(fontSize: 12)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[300],
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
