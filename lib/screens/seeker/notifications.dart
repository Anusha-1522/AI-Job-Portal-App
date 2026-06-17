import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(title: const Text("Notifications"), centerTitle: true),

      body: ListView(
        padding: const EdgeInsets.all(15),

        children: [
          notificationCard(
            Icons.work,

            "New Job Posted",

            "Google posted a new Flutter Developer job.",

            "2 min ago",

            Colors.blue,
          ),

          notificationCard(
            Icons.check_circle,

            "Application Accepted",

            "Your application was shortlisted.",

            "1 hour ago",

            Colors.green,
          ),

          notificationCard(
            Icons.video_call,

            "Interview Scheduled",

            "Interview scheduled for tomorrow at 10 AM.",

            "3 hours ago",

            Colors.orange,
          ),

          notificationCard(
            Icons.notifications,

            "Profile Updated",

            "Your profile was updated successfully.",

            "Yesterday",

            Colors.purple,
          ),
        ],
      ),
    );
  }

  static Widget notificationCard(
    IconData icon,

    String title,

    String subtitle,

    String time,

    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      child: ListTile(
        contentPadding: const EdgeInsets.all(15),

        leading: CircleAvatar(
          radius: 28,

          backgroundColor: color.withOpacity(0.15),

          child: Icon(icon, color: color),
        ),

        title: Text(
          title,

          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),

          child: Text(subtitle),
        ),

        trailing: Text(
          time,

          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ),
    );
  }
}
