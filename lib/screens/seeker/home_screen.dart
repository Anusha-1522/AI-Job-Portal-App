import 'package:flutter/material.dart';

import '../../services/job_service.dart';
import '../../widgets/job_card.dart';
import '../common/ai_assistant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> filteredJobs = JobService.jobs;

  void searchJobs(String value) {
    setState(() {
      filteredJobs = JobService.jobs.where((job) {
        final title = job["title"]!.toLowerCase();

        return title.contains(value.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(title: const Text("Available Jobs"), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(12),

        child: Column(
          children: [
            TextField(
              onChanged: searchJobs,

              decoration: InputDecoration(
                hintText: "Search Jobs",

                prefixIcon: const Icon(Icons.search),

                filled: true,

                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),

                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // AI RECOMMENDATIONS
            const Align(
              alignment: Alignment.centerLeft,

              child: Text(
                "AI Recommended Jobs",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: 120,

              child: ListView(
                scrollDirection: Axis.horizontal,

                children: [
                  aiCard("Flutter Developer", "95% Match"),

                  aiCard("Mobile App Developer", "90% Match"),

                  aiCard("UI UX Designer", "85% Match"),
                ],
              ),
            ),

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E3A8A),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const AiAssistantScreen(title: "AI Career Assistant"),
                    ),
                  );
                },
                icon: const Icon(Icons.smart_toy, color: Colors.white),
                label: const Text(
                  "AI Career Assistant",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 20),
            Expanded(
              child: filteredJobs.isEmpty
                  ? const Center(
                      child: Text(
                        "No Jobs Found",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredJobs.length,

                      itemBuilder: (context, index) {
                        final job = filteredJobs[index];

                        return JobCard(
                          title: job["title"]!,
                          company: job["company"]!,
                          location: job["location"]!,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget aiCard(String title, String match) {
    return Container(
      width: 180,

      margin: const EdgeInsets.only(right: 12),

      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: const Color(0xFF1E3A8A),

        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(
            title,

            style: const TextStyle(
              color: Colors.white,

              fontSize: 18,

              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            match,

            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
