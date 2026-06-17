import 'package:flutter/material.dart';

import '../employer/dashboard.dart';

class EmployerLoginScreen extends StatefulWidget {
  const EmployerLoginScreen({super.key});

  @override
  State<EmployerLoginScreen> createState() => _EmployerLoginScreenState();
}

class _EmployerLoginScreenState extends State<EmployerLoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Employer Login")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextField(
              controller: emailController,

              decoration: const InputDecoration(hintText: "Employer Email"),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: passwordController,

              obscureText: true,

              decoration: const InputDecoration(hintText: "Password"),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                if (emailController.text == "employer@gmail.com" &&
                    passwordController.text == "123456") {
                  Navigator.pushReplacement(
                    context,

                    MaterialPageRoute(
                      builder: (context) => const EmployerDashboard(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Invalid Employer Credentials"),
                    ),
                  );
                }
              },

              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
