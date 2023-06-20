import 'package:chat_app/common/custom_button.dart';
import 'package:chat_app/modules/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Text(
                "Welcome to Conversa",
                style: theme.textTheme.titleLarge!.copyWith(
                  fontSize: 32,
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.1,
              ),
              Image.asset(
                'assets/images/bg.png',
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.4,
                color: theme.colorScheme.primary,
              ),
              SizedBox(
                height: screenSize.height * 0.2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(
                  text: "AGREE AND CONTINUE",
                  onPressed: () {
                    Navigator.of(context).pushNamed(LoginScreen.routeName);
                  },
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              Text(
                'By tapping "Agree and continue" you agree to our privacy policy',
                style: theme.textTheme.bodySmall,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
