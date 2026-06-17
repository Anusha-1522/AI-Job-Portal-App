import 'package:flutter/material.dart';
import 'job_seeker_login.dart';
import 'employer_login.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(title: const Text("Select Role"), centerTitle: true),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            // HERO BANNER
            Container(
              height: 180,
              width: double.infinity,

              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E3A8A), Color(0xFF2563EB)],
                ),

                borderRadius: BorderRadius.circular(30),
              ),

              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.white,

                    child: Icon(Icons.work, size: 40, color: Color(0xFF1E3A8A)),
                  ),

                  SizedBox(height: 15),

                  Text(
                    "Job Portal",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "Find jobs and hire talent",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Welcome!",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text(
              "Choose your role to continue",
              style: TextStyle(color: Colors.grey, fontSize: 17),
            ),

            const SizedBox(height: 25),

            // STATS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                statBox("100+", "Jobs"),

                statBox("50+", "Companies"),

                statBox("500+", "Users"),
              ],
            ),

            const SizedBox(height: 35),

            // JOB SEEKER
            roleCard(
              context,

              title: "Job Seeker",

              subtitle: "Find jobs, save jobs and track applications",

              icon: Icons.person_search,

              color: const Color(0xFF1E3A8A),

              screen: const JobSeekerLoginScreen(),
            ),

            const SizedBox(height: 20),

            // EMPLOYER
            roleCard(
              context,

              title: "Employer",

              subtitle: "Post jobs and hire top talent",

              icon: Icons.business_center,

              color: Colors.orange,

              screen: const EmployerLoginScreen(),
            ),

            const SizedBox(height: 30),

            const Text(
              "Choose your role and get started",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }

  static Widget statBox(String number, String title) {
    return Container(
      width: 95,

      padding: const EdgeInsets.all(15),

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
            number,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 5),

          Text(title, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget roleCard(
    BuildContext context, {

    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required Widget screen,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },

      child: Container(
        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(25),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),

        child: Row(
          children: [
            CircleAvatar(
              radius: 32,

              backgroundColor: color.withOpacity(0.15),

              child: Icon(icon, color: color, size: 32),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    title,

                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(subtitle, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),

            Icon(Icons.arrow_forward_ios, color: color),
          ],
        ),
      ),
    );
  }
}
