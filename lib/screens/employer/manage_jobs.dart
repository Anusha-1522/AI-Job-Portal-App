import 'package:flutter/material.dart';

import '../../services/job_service.dart';

class ManageJobsScreen extends StatefulWidget {
  const ManageJobsScreen({super.key});

  @override
  State<ManageJobsScreen> createState() => _ManageJobsScreenState();
}

class _ManageJobsScreenState extends State<ManageJobsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(title: const Text("Manage Jobs")),

      body: ListView.builder(
        padding: const EdgeInsets.all(15),

        itemCount: JobService.jobs.length,

        itemBuilder: (context, index) {
          final job = JobService.jobs[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 15),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),

            child: Padding(
              padding: const EdgeInsets.all(15),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    job["title"]!,

                    style: const TextStyle(
                      fontSize: 20,

                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(job["company"]!),

                  Text(job["location"]!),

                  const SizedBox(height: 15),

                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},

                        icon: const Icon(Icons.edit),

                        label: const Text("Edit"),
                      ),

                      const SizedBox(width: 10),

                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),

                        onPressed: () {
                          setState(() {
                            JobService.jobs.removeAt(index);
                          });
                        },

                        icon: const Icon(Icons.delete),

                        label: const Text("Delete"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
