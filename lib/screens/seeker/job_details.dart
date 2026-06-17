import 'package:flutter/material.dart';

import '../../models/application_model.dart';
import '../../services/storage_service.dart';

class JobDetailsScreen extends StatelessWidget {
  final String title;
  final String company;
  final String location;

  const JobDetailsScreen({
    super.key,

    required this.title,
    required this.company,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(title: const Text("Job Details")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // COMPANY CARD
            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(25),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),

                    blurRadius: 10,
                  ),
                ],
              ),

              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 45,

                    backgroundColor: Color(0xFF1E3A8A),

                    child: Icon(Icons.business, size: 45, color: Colors.white),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    title,

                    textAlign: TextAlign.center,

                    style: const TextStyle(
                      fontSize: 28,

                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    company,

                    style: const TextStyle(color: Colors.grey, fontSize: 20),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      const Icon(Icons.location_on, color: Colors.grey),

                      const SizedBox(width: 5),

                      Text(location),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // JOB INFO
            Row(
              children: [
                Expanded(child: infoCard("₹12 LPA", "Salary")),

                const SizedBox(width: 15),

                Expanded(child: infoCard("2 Years", "Experience")),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(child: infoCard("Full Time", "Job Type")),

                const SizedBox(width: 15),

                Expanded(child: infoCard("Remote", "Mode")),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              "Skills Required",

              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Wrap(
              spacing: 10,

              runSpacing: 10,

              children: [
                skillChip("Flutter"),

                skillChip("Firebase"),

                skillChip("REST API"),

                skillChip("UI Design"),

                skillChip("GitHub"),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              "About Company",

              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            const Text(
              "TechNova Solutions is a leading software company focused on innovative mobile and web applications with modern technologies.",

              style: TextStyle(fontSize: 17, height: 1.5),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,

              height: 60,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E3A8A),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),

                onPressed: () {
                  StorageService.appliedJobs.add(
                    ApplicationModel(title: title, company: company),
                  );

                  StorageService.applicants.add({
                    "name": StorageService.userName,

                    "jobTitle": title,

                    "company": company,
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Applied Successfully!")),
                  );
                },

                child: const Text(
                  "Apply Now",

                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget infoCard(String value, String label) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),

      child: Column(
        children: [
          Text(
            value,

            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 5),

          Text(label),
        ],
      ),
    );
  }

  static Widget skillChip(String text) {
    return Chip(label: Text(text), backgroundColor: const Color(0xFFEDE7FF));
  }
}
