import 'package:flutter/material.dart';

import '../screens/seeker/job_details.dart';
import '../models/application_model.dart';
import '../services/storage_service.dart';

class JobCard extends StatelessWidget {
  final String title;
  final String company;
  final String location;

  const JobCard({
    super.key,

    required this.title,
    required this.company,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),

      elevation: 3,

      child: Padding(
        padding: const EdgeInsets.all(12),

        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    title,

                    style: const TextStyle(
                      fontWeight: FontWeight.bold,

                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text("$company • $location"),
                ],
              ),
            ),

            Column(
              children: [
                IconButton(
                  onPressed: () {
                    StorageService.savedJobs.add(
                      ApplicationModel(title: title, company: company),
                    );

                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("$title saved")));
                  },

                  icon: const Icon(Icons.bookmark_border),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (context) => JobDetailsScreen(
                          title: title,

                          company: company,

                          location: location,
                        ),
                      ),
                    );
                  },

                  child: const Text("Apply"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
