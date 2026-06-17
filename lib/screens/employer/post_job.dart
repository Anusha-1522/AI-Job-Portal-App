import 'package:flutter/material.dart';

import '../../services/job_service.dart';

class PostJobScreen extends StatefulWidget {
  const PostJobScreen({super.key});

  @override
  State<PostJobScreen> createState() => _PostJobScreenState();
}

class _PostJobScreenState extends State<PostJobScreen> {
  final titleController = TextEditingController();

  final companyController = TextEditingController();

  final locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(title: const Text("Post New Job")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            buildField("Job Title", titleController),

            buildField("Company Name", companyController),

            buildField("Location", locationController),

            const SizedBox(height: 30),

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
                  JobService.jobs.add({
                    "title": titleController.text,

                    "company": companyController.text,

                    "location": locationController.text,
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Job Posted Successfully!")),
                  );

                  Navigator.pop(context);
                },

                child: const Text(
                  "Post Job",

                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildField(String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),

      child: TextField(
        controller: controller,

        decoration: InputDecoration(
          hintText: hint,

          filled: true,

          fillColor: Colors.white,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),

            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
