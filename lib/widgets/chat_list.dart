import 'package:chat_app/contacts.dart';
import 'package:chat_app/widgets/my_bubble.dart';
import 'package:chat_app/widgets/sender_bubble.dart';
import 'package:flutter/material.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        var message = messages[index];
        if (message['isMe'] == true) {
          return Padding(
            padding: const EdgeInsets.only(top: 5),
            child: MyBubble(
              message: message['text'].toString(),
              date: message['time'].toString(),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.only(top: 5),
          child: SenderBubble(
            message: message['text'].toString(),
            date: message['time'].toString(),
          ),
        );
      },
    );
  }
}
