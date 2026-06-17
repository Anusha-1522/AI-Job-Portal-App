import 'package:flutter/material.dart';

class ManageCompanyScreen extends StatelessWidget {
  const ManageCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(title: const Text("Manage Company")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,

              backgroundColor: Color(0xFF1E3A8A),

              child: Icon(Icons.business, size: 50, color: Colors.white),
            ),

            const SizedBox(height: 20),

            const Text(
              "TechNova Solutions",

              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Leading Software Company",

              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),

            const SizedBox(height: 40),

            companyTile(Icons.location_on, "Bangalore, India"),

            companyTile(Icons.people, "250 Employees"),

            companyTile(Icons.language, "www.technova.com"),
          ],
        ),
      ),
    );
  }

  static Widget companyTile(IconData icon, String text) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),

      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF1E3A8A)),

        title: Text(text),
      ),
    );
  }
}
