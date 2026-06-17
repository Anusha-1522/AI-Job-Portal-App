import 'package:flutter/material.dart';

import '../auth/login_screen.dart';
import 'saved_jobs.dart';
import 'edit_profile.dart';
import 'notifications.dart';
import 'settings.dart';
import 'resume_upload.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // TOP HEADER
            Container(
              width: double.infinity,

              padding: const EdgeInsets.only(top: 60, bottom: 30),

              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1E3A8A), Color(0xFF2563EB)],
                ),

                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),

                  bottomRight: Radius.circular(35),
                ),
              ),

              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,

                    backgroundColor: Colors.white,

                    child: Icon(
                      Icons.person,

                      size: 60,

                      color: Color(0xFF1E3A8A),
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "Saanvi",

                    style: TextStyle(
                      color: Colors.white,

                      fontSize: 28,

                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Flutter Developer",

                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      profileStat("12", "Applied"),

                      const SizedBox(width: 30),

                      profileStat("5", "Saved"),

                      const SizedBox(width: 30),

                      profileStat("3", "Interviews"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // MENU
            buildTile(
              context,

              "Saved Jobs",

              Icons.bookmark,

              const SavedJobsScreen(),
            ),
            buildTile(
              context,

              "Upload Resume",

              Icons.upload_file,

              const ResumeUploadScreen(),
            ),

            buildTile(
              context,

              "Edit Profile",

              Icons.edit,

              const EditProfileScreen(),
            ),

            buildTile(
              context,

              "Notifications",

              Icons.notifications,

              const NotificationsScreen(),
            ),

            buildTile(
              context,

              "Settings",

              Icons.settings,

              const SettingsScreen(),
            ),

            // LOGOUT BUTTON
            Padding(
              padding: const EdgeInsets.all(20),

              child: SizedBox(
                width: double.infinity,

                height: 55,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),

                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,

                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),

                      (route) => false,
                    );
                  },

                  child: const Text(
                    "Logout",

                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTile(
    BuildContext context,
    String title,
    IconData icon,
    Widget screen,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFEDE7FF),

          child: Icon(icon, color: const Color(0xFF1E3A8A)),
        ),

        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),

        trailing: const Icon(Icons.arrow_forward_ios),

        onTap: () {
          Navigator.push(
            context,

            MaterialPageRoute(builder: (context) => screen),
          );
        },
      ),
    );
  }

  Widget profileStat(String number, String label) {
    return Column(
      children: [
        Text(
          number,

          style: const TextStyle(
            color: Colors.white,

            fontSize: 24,

            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 5),

        Text(label, style: const TextStyle(color: Colors.white70)),
      ],
    );
  }
}
