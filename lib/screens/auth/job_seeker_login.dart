import 'package:flutter/material.dart';

import '../seeker/main_navigation.dart';

class JobSeekerLoginScreen extends StatefulWidget {
  const JobSeekerLoginScreen({super.key});

  @override
  State<JobSeekerLoginScreen> createState() => _JobSeekerLoginScreenState();
}

class _JobSeekerLoginScreenState extends State<JobSeekerLoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Job Seeker Login")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextField(
              controller: emailController,

              decoration: const InputDecoration(hintText: "Email"),
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
                Navigator.pushReplacement(
                  context,

                  MaterialPageRoute(
                    builder: (context) => const MainNavigationScreen(),
                  ),
                );
              },

              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
