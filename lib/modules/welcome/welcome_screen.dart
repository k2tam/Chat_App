import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: mediaQuery.height * 0.1,
            ),
            Text(
              "Welcome to Conversa",
              style: theme.textTheme.titleLarge!.copyWith(
                fontSize: 32,
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.1,
            ),
            Image.asset('bg.png')
          ],
        ),
      ),
    );
  }
}
