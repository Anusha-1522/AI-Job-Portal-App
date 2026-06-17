import 'package:flutter/material.dart';

class ApplicantDetailsScreen extends StatefulWidget {
  final String name;
  final String jobTitle;
  final String company;

  const ApplicantDetailsScreen({
    super.key,
    required this.name,
    required this.jobTitle,
    required this.company,
  });

  @override
  State<ApplicantDetailsScreen> createState() => _ApplicantDetailsScreenState();
}

class _ApplicantDetailsScreenState extends State<ApplicantDetailsScreen> {
  String status = "Applied";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(title: const Text("Applicant Details")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,

              backgroundColor: Color(0xFF1E3A8A),

              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),

            const SizedBox(height: 20),

            detailTile("Name", widget.name),

            detailTile("Applied For", widget.jobTitle),

            detailTile("Company", widget.company),

            detailTile("Email", "dev@gmail.com"),

            detailTile("Skills", "Flutter, Firebase, Dart"),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),

              child: ListTile(
                title: const Text("Status"),

                subtitle: Text(
                  status,

                  style: const TextStyle(
                    fontWeight: FontWeight.bold,

                    color: Colors.blue,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Update Status",

              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Wrap(
              spacing: 10,

              runSpacing: 10,

              children: [
                statusButton("Under Review"),

                statusButton("Interview"),

                statusButton("Selected"),

                statusButton("Rejected"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget statusButton(String newStatus) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          status = newStatus;
        });
      },

      child: Text(newStatus),
    );
  }

  static Widget detailTile(String title, String value) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      child: ListTile(
        title: Text(title),

        subtitle: Text(
          value,

          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
