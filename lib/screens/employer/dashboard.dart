import 'package:flutter/material.dart';

import 'post_job.dart';
import 'view_applicants.dart';
import 'manage_company.dart';
import 'manage_jobs.dart';
import 'interview_schedule.dart';
import '../common/ai_assistant.dart';

class EmployerDashboard extends StatelessWidget {
  const EmployerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(
        title: const Text("Employer Dashboard"),

        centerTitle: true,
      ),

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
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E3A8A), Color(0xFF2563EB)],
                ),

                borderRadius: BorderRadius.circular(25),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const CircleAvatar(
                    radius: 35,

                    backgroundColor: Colors.white,

                    child: Icon(
                      Icons.business,

                      size: 40,

                      color: Color(0xFF1E3A8A),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "TechNova Solutions",

                    style: TextStyle(
                      color: Colors.white,

                      fontSize: 28,

                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Hiring top developers",

                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // STATS
            Row(
              children: [
                Expanded(child: statCard("12", "Active Jobs", Icons.work)),

                const SizedBox(width: 15),

                Expanded(child: statCard("48", "Applicants", Icons.people)),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(child: statCard("8", "Interviews", Icons.video_call)),

                const SizedBox(width: 15),

                Expanded(child: statCard("5", "Hired", Icons.check_circle)),
              ],
            ),

            const SizedBox(height: 35),

            const Text(
              "Quick Actions",

              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            dashboardButton(
              context,

              "Post New Job",

              Icons.add_box,

              const PostJobScreen(),
            ),

            dashboardButton(
              context,

              "View Applicants",

              Icons.people_alt,

              const ViewApplicantsScreen(),
            ),

            dashboardButton(
              context,

              "Manage Company",

              Icons.business_center,

              const ManageCompanyScreen(),
            ),
            dashboardButton(
              context,
              "Manage Jobs",
              Icons.work,
              const ManageJobsScreen(),
            ),

            dashboardButton(
              context,
              "Interview Schedule",
              Icons.calendar_today,
              const InterviewScheduleScreen(),
            ),

            dashboardButton(
              context,
              "AI Hiring Assistant",
              Icons.smart_toy,
              const AiAssistantScreen(title: "AI Hiring Assistant"),
            ),

            const SizedBox(height: 30),

            const Text(
              "Recent Applicants",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xFF1E3A8A),
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: Text("Dev"),
                subtitle: Text("Applied for Flutter Developer"),
              ),
            ),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xFF1E3A8A),
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: Text("Rahul"),
                subtitle: Text("Applied for Backend Developer"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget statCard(String number, String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),

      child: Column(
        children: [
          Icon(icon, size: 35, color: const Color(0xFF1E3A8A)),

          const SizedBox(height: 15),

          Text(
            number,

            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 5),

          Text(title, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  static Widget dashboardButton(
    BuildContext context,
    String title,
    IconData icon,
    Widget screen,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),

      child: SizedBox(
        width: double.infinity,

        height: 60,

        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1E3A8A),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),

          onPressed: () {
            Navigator.push(
              context,

              MaterialPageRoute(builder: (context) => screen),
            );
          },

          icon: Icon(icon, color: Colors.white),

          label: Text(
            title,

            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
