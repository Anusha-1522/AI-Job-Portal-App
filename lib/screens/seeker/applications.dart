import 'package:flutter/material.dart';

import '../../services/storage_service.dart';

class ApplicationsScreen extends StatelessWidget {
  const ApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(title: const Text("Applied Jobs"), centerTitle: true),

      body: StorageService.appliedJobs.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Icon(Icons.work_off, size: 90, color: Colors.grey),

                  const SizedBox(height: 20),

                  const Text(
                    "No Applications Yet",

                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Apply jobs to see them here.",

                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(15),

              itemCount: StorageService.appliedJobs.length,

              itemBuilder: (context, index) {
                final job = StorageService.appliedJobs[index];

                final statuses = [
                  "Applied",

                  "Under Review",

                  "Interview",

                  "Selected",
                ];

                final status = statuses[index % statuses.length];

                final colors = [
                  Colors.blue,

                  Colors.orange,

                  Colors.purple,

                  Colors.green,
                ];

                final statusColor = colors[index % colors.length];

                return Card(
                  margin: const EdgeInsets.only(bottom: 18),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(18),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 28,

                              backgroundColor: Color(0xFF1E3A8A),

                              child: Icon(Icons.work, color: Colors.white),
                            ),

                            const SizedBox(width: 15),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text(
                                    job.title,

                                    style: const TextStyle(
                                      fontSize: 20,

                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 5),

                                  Text(
                                    job.company,

                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 8,
                              ),

                              decoration: BoxDecoration(
                                color: statusColor.withOpacity(0.15),

                                borderRadius: BorderRadius.circular(30),
                              ),

                              child: Text(
                                status,

                                style: TextStyle(
                                  color: statusColor,

                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            const Spacer(),

                            const Text(
                              "2 days ago",

                              style: TextStyle(color: Colors.grey),
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
