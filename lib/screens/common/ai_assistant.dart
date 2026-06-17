import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/chat_message.dart';

class AiAssistantScreen extends StatefulWidget {
  final String title;

  const AiAssistantScreen({super.key, required this.title});

  @override
  State<AiAssistantScreen> createState() => _AiAssistantScreenState();
}

class _AiAssistantScreenState extends State<AiAssistantScreen> {
  final TextEditingController controller = TextEditingController();

  final List<ChatMessage> messages = [];

  final String apiKey = "YOUR_API_KEY"; // Replace with your OpenRouter API key

  bool isLoading = false;

  Future<void> askAI() async {
    if (controller.text.isEmpty) return;

    String question = controller.text;

    setState(() {
      messages.add(ChatMessage(message: question, isUser: true));

      controller.clear();

      isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse("https://openrouter.ai/api/v1/chat/completions"),

        headers: {
          "Authorization": "Bearer $apiKey",

          "Content-Type": "application/json",
        },

        body: jsonEncode({
          "model": "nex-agi/nex-n2-pro:free",

          "messages": [
            {"role": "user", "content": question},
          ],
        }),
      );

      final data = jsonDecode(response.body);

      String answer = data["choices"][0]["message"]["content"];

      setState(() {
        messages.add(ChatMessage(message: answer, isUser: false));

        isLoading = false;
      });
    } catch (e) {
      setState(() {
        messages.add(
          ChatMessage(message: "Unable to get response.", isUser: false),
        );

        isLoading = false;
      });
    }
  }

  Widget chatBubble(ChatMessage msg) {
    return Align(
      alignment: msg.isUser ? Alignment.centerRight : Alignment.centerLeft,

      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),

        padding: const EdgeInsets.all(14),

        constraints: const BoxConstraints(maxWidth: 300),

        decoration: BoxDecoration(
          color: msg.isUser ? const Color(0xFF1E3A8A) : Colors.white,

          borderRadius: BorderRadius.circular(18),
        ),

        child: Text(
          msg.message,

          style: TextStyle(
            color: msg.isUser ? Colors.white : Colors.black,

            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(title: Text(widget.title)),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(15),

              itemCount: messages.length,

              itemBuilder: (context, index) {
                return chatBubble(messages[index]);
              },
            ),
          ),

          if (isLoading)
            const Padding(
              padding: EdgeInsets.all(10),

              child: Row(
                children: [
                  CircleAvatar(child: Icon(Icons.smart_toy)),

                  SizedBox(width: 10),

                  Text("AI is thinking..."),
                ],
              ),
            ),

          Container(
            padding: const EdgeInsets.all(10),

            color: Colors.white,

            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,

                    decoration: InputDecoration(
                      hintText: "Ask anything...",

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                CircleAvatar(
                  radius: 25,

                  backgroundColor: const Color(0xFF1E3A8A),

                  child: IconButton(
                    onPressed: askAI,

                    icon: const Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
