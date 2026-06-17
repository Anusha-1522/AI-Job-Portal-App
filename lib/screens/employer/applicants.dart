import 'package:flutter/material.dart';

class ApplicantsScreen extends StatelessWidget {
  const ApplicantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(title: const Text("Applicants")),

      body: ListView(
        padding: const EdgeInsets.all(15),

        children: [
          applicantCard("Anusha", "Flutter Developer", "2 Years Experience"),

          applicantCard("Rahul", "Backend Developer", "3 Years Experience"),

          applicantCard("Sneha", "UI UX Designer", "1 Year Experience"),

          applicantCard("Arjun", "Frontend Developer", "Fresher"),
        ],
      ),
    );
  }

  Widget applicantCard(String name, String role, String exp) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      child: Padding(
        padding: const EdgeInsets.all(15),

        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,

              backgroundColor: Color(0xFF1E3A8A),

              child: Icon(Icons.person, color: Colors.white),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    name,

                    style: const TextStyle(
                      fontSize: 20,

                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(role),

                  Text(exp),
                ],
              ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),

              onPressed: () {},

              child: const Text(
                "Accept",

                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
