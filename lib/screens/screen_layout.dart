import 'package:flutter/material.dart';

class ScreenLayout extends StatelessWidget {
  const ScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            centerTitle: false,
            title: const Text(
              "Chat App",
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
            ],
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "CHAT",
                ),
                Tab(
                  text: "CALL",
                ),
              ],
            )),
        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("Button"),
          ),
        ),
      ),
    );
  }
}
