import 'package:flutter/material.dart';

import '../../services/storage_service.dart';

class SavedJobsScreen extends StatefulWidget {
  const SavedJobsScreen({super.key});

  @override
  State<SavedJobsScreen> createState() => _SavedJobsScreenState();
}

class _SavedJobsScreenState extends State<SavedJobsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(title: const Text("Saved Jobs"), centerTitle: true),

      body: StorageService.savedJobs.isEmpty
          ? const Center(
              child: Text("No Saved Jobs Yet", style: TextStyle(fontSize: 20)),
            )
          : ListView.builder(
              itemCount: StorageService.savedJobs.length,

              itemBuilder: (context, index) {
                final job = StorageService.savedJobs[index];

                return Card(
                  margin: const EdgeInsets.all(12),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),

                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFF1E3A8A),

                      child: Icon(Icons.bookmark, color: Colors.white),
                    ),

                    title: Text(
                      job.title,

                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                    subtitle: Text(job.company),

                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),

                      onPressed: () {
                        setState(() {
                          StorageService.savedJobs.removeAt(index);
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Saved Job Removed")),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
