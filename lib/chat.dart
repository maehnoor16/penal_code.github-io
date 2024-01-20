import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _chatMessages = [];

  final String apiKey = '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'; // Replace with your OpenAI API key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat with AI',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _chatMessages.length,
                itemBuilder: (context, index) {
                  return _chatMessages[index];
                },
              ),
            ),
            const SizedBox(height: 16),
            _buildChatInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildChatInput() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _textController,
            decoration: const InputDecoration(
              hintText: 'Type your message...',
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {
            _sendMessage(_textController.text);
          },
        ),
      ],
    );
  }

  Future<void> _sendMessage(String message) async {
    // Clear the text input
    _textController.clear();

    // Add user's message to the chat
    _addMessage(ChatMessage(message, MessageType.User));

    // Send the user's message to the GPT-3 Playground API
    String botResponse = await _getGpt3Response(message);

    // Add the bot's response to the chat
    _addMessage(ChatMessage(botResponse, MessageType.Bot));
  }

  Future<String> _getGpt3Response(String userMessage) async {
    // Replace this URL with the GPT-3 Playground API endpoint
    const String apiUrl = 'https://chat.openai.com/';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: json.encode({
          'prompt': userMessage,
          'max_tokens': 150,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return data['choices'][0]['text'];
      } else {
        throw Exception('Failed to get response from GPT-3 Playground API');
      }
    } catch (e) {
      print('Error: $e');
      return 'Sorry, something went wrong.';
    }
  }

  void _addMessage(ChatMessage message) {
    setState(() {
      _chatMessages.add(message);
    });
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final MessageType type;

  const ChatMessage(this.text, this.type, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      alignment: type == MessageType.User ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: type == MessageType.User ? Colors.brown : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: type == MessageType.User ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

enum MessageType {
  User,
  Bot,
}

void main() {
  runApp(MaterialApp(
    home: const Chat(),
    theme: ThemeData(
      primaryColor: Colors.brown,
      scaffoldBackgroundColor: Colors.white,
    ),
  ));
}
