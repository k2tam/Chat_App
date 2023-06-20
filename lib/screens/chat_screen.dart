import 'package:chat_app/contacts.dart';
import 'package:chat_app/widgets/chat_list.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(contacts[0]["name"].toString()),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.video_call)),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            //Bubbles chat list
            const Expanded(
              child: ChatsList(),
            ),
            //Message actions bar
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  // border: Border(
                  //   bottom: BorderSide(
                  //     color: Colors.red,
                  //   ),
                  // ),
                  ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.attach_file,
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 15,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 18),
                          fillColor: theme.colorScheme.onSecondary,
                          filled: true,
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.emoji_emotions_outlined,
                            ),
                            onPressed: () {},
                          ),
                          hintText: 'Type a message',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.mic_rounded,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
