import 'package:flutter/material.dart';

import '../../services/storage_service.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: StorageService.userName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextField(
              controller: nameController,

              decoration: const InputDecoration(labelText: "Your Name"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                StorageService.userName = nameController.text;

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Profile Updated")),
                );

                Navigator.pop(context);
              },

              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
