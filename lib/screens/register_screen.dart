import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'jobPosition_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final countryController = TextEditingController();
  final birthDateController = TextEditingController();
  final genderController = TextEditingController();

  bool isLoading = false;

  void register() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final phone = phoneController.text.trim();
    final country = countryController.text.trim();
    final birthDate = birthDateController.text.trim();
    final gender = genderController.text.trim();

    
    print("📌 Email: $email");
    print("📌 Password: $password");
    print("📌 Phone: $phone");
    print("📌 Country: $country");
    print("📌 BirthDate: $birthDate");
    print("📌 Gender: $gender");

    setState(() => isLoading = true);

    final response = await AuthService.registerUser(
      phone: phone,
      country: country,
      password: password,
      birthDate: birthDate,
      gender: gender,
      email: email,
    );

    setState(() => isLoading = false);

    if (response == "success") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const JobPositionScreen()),
      );
    } else {
      showDialogMsg(response);
    }
  }

  void showDialogMsg(String msg) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Message"),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      {bool obscure = false}) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(labelText: label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildTextField("Email", emailController),
              const SizedBox(height: 15),
              buildTextField("Password", passwordController, obscure: true),
              const SizedBox(height: 15),
              buildTextField("Phone", phoneController),
              const SizedBox(height: 15),
              buildTextField("Country", countryController),
              const SizedBox(height: 15),
              buildTextField("Birth Date (YYYY-MM-DD)", birthDateController),
              const SizedBox(height: 15),
              buildTextField("Gender", genderController),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: isLoading ? null : register,
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Create Account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
