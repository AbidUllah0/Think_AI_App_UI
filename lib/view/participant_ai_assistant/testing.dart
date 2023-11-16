import 'package:flutter/material.dart';

class MessageSender extends StatefulWidget {
  @override
  _MessageSenderState createState() => _MessageSenderState();
}

class _MessageSenderState extends State<MessageSender> {
  final TextEditingController messageController = TextEditingController();
  final List<Message> messages = [];

  void sendMessage(String message) {
    setState(() {
      messages.add(Message(message, true));
      messageController.clear();
      // Simulating a reply from someone else after a short delay
      Future.delayed(Duration(seconds: 1), () {
        receiveMessage('Reply: Got it!');
      });
    });
  }

  void receiveMessage(String message) {
    setState(() {
      messages.add(Message(message, false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message Sender'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return MessageBubble(
                  text: message.text,
                  isSentByUser: message.isSentByUser,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration:
                        InputDecoration(labelText: 'Enter your message'),
                  ),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    final message = messageController.text;
                    if (message.isNotEmpty) {
                      sendMessage(message);
                    } else {
                      // Handle empty message
                      print('Message is empty');
                    }
                  },
                  child: Text('Send Message'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isSentByUser;

  Message(this.text, this.isSentByUser);
}

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isSentByUser;

  const MessageBubble(
      {required this.text, required this.isSentByUser, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByUser ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isSentByUser ? Colors.blue : Colors.grey[300],
          borderRadius: isSentByUser
              ? BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                )
              : BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16.0,
              color: isSentByUser ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
