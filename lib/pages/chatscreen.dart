import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String contactName;

  const ChatScreen({super.key, required this.contactName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      _messages.add({
        'text': _messageController.text,
        'isMe': true,
      });
    });

    _messageController.clear();

    // Simulate receiving a response from the contact
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _messages.add({
          'text': 'Received your message!',
          'isMe': false,
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:  Color.fromRGBO(5, 66, 112, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(5, 66, 112, 1),
        foregroundColor: Color.fromRGBO(244, 245, 251, 1),
        title: Text(widget.contactName),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - 1 - index];
                return Align(
                  alignment: message['isMe']
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: message['isMe']
                          ? Color.fromRGBO(5, 66, 112, 1)
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      message['text'],
                      style: TextStyle(
                        color: message['isMe']
                            ? Color.fromRGBO(244, 245, 251, 1)
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      fillColor: Color.fromRGBO(244, 245, 251, 1),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send),
                  color: Color.fromRGBO(255, 255, 255, 1),iconSize: 30,
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}