import 'package:flutter/material.dart';

class InterviewScheduleScreen extends StatelessWidget {
  const InterviewScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(title: const Text("Interview Schedule")),

      body: ListView(
        padding: const EdgeInsets.all(15),

        children: [
          interviewCard("Dev", "Flutter Developer", "Tomorrow 10:00 AM"),

          interviewCard("Rahul", "Backend Developer", "Friday 2:00 PM"),

          interviewCard("Sneha", "UI UX Designer", "Monday 11:30 AM"),
        ],
      ),
    );
  }

  static Widget interviewCard(String name, String role, String time) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Color(0xFF1E3A8A),

          child: Icon(Icons.calendar_today, color: Colors.white),
        ),

        title: Text(name),

        subtitle: Text("$role\n$time"),
      ),
    );
  }
}
