import 'package:chat_app/chat/widgets/message_input.dart';
import 'package:chat_app/chat/widgets/message_tile.dart';
import 'package:flutter/material.dart';

import 'models/message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final List<Message> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Talk to myself',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: _messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MessageTile(
                            message: _messages[index].text,
                            user: _messages[index].user);
                      }),
                ),
              ),
              MessageInput(user: 'A', controller: _controller1, onPressed: (){
                    setState(() {
                    final message = Message(_controller1.text, 'A');
                    _messages.add(message);
                    });
                    _controller1.clear();
              }),
              const SizedBox(
                height: 8,
              ),
              MessageInput(user: 'B', controller: _controller2, onPressed: (){
                setState(() {
                  final message = Message(_controller2.text, 'B');
                  _messages.add(message);
                });
                _controller2.clear();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
