import 'package:chat_app/contacts.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ChatScreen(),
                ),
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  contacts[index]["profilePic"].toString(),
                ),
              ),
              title: Text(
                contacts[index]["name"].toString(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(contacts[index]["message"].toString(),
                    style: Theme.of(context).textTheme.bodyMedium!),
              ),
              trailing: Text(
                contacts[index]["time"].toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}
