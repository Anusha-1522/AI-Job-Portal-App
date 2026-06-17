import 'package:flutter/material.dart';

import '../../services/storage_service.dart';
import 'applicant_details.dart';

class ViewApplicantsScreen extends StatelessWidget {
  const ViewApplicantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(title: const Text("Applicants")),

      body: StorageService.applicants.isEmpty
          ? const Center(
              child: Text("No Applicants Yet", style: TextStyle(fontSize: 22)),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(15),

              itemCount: StorageService.applicants.length,

              itemBuilder: (context, index) {
                final applicant = StorageService.applicants[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 15),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFF1E3A8A),

                      child: Icon(Icons.person, color: Colors.white),
                    ),

                    title: Text(
                      applicant["name"]!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                    subtitle: Text(
                      "${applicant["jobTitle"]}\n${applicant["company"]}",
                    ),

                    trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (context) => ApplicantDetailsScreen(
                              name: applicant["name"]!,

                              jobTitle: applicant["jobTitle"]!,

                              company: applicant["company"]!,
                            ),
                          ),
                        );
                      },

                      child: const Text("View"),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
