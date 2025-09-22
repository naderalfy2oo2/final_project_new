import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'jobPosition_screen.dart';
import 'register_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscureText = true;
  bool isLoading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    if (emailController.text.trim().isEmpty) {
      return showDialogMsg("Email is required!");
    }
    if (passwordController.text.trim().isEmpty) {
      return showDialogMsg("Password is required!");
    }

    final email = emailController.text.trim();
    final password = passwordController.text;

    setState(() => isLoading = true);
    final response =
        await AuthService.loginUser(email: email, password: password);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Let's Sign in. Apply to jobs!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            _buildTextField(
              controller: emailController,
              label: "Email",
              icon: Icons.email,
              obscureText: false,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              controller: passwordController,
              label: "Password",
              icon: Icons.lock,
              obscureText: _obscureText,
              suffixIcon: IconButton(
                icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isLoading ? null : login,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3064FF),
                fixedSize: const Size(350, 47),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Sign in",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()),
                    );
                  },
                  child: const Text("NEW ACCOUNT",
                      style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required bool obscureText,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
      ],
    );
  }
}
