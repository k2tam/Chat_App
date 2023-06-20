import 'package:chat_app/common/custom_button.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void pickCountry() {
    showCountryPicker(
        context: context,
        showPhoneCode: true,
        onSelect: (Country _country) {
          setState(() {
            country = _country;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter your phone number"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              const Text(
                'Enter your mobile number below. We will send you a verification code after',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: screenSize.height * 0.03,
              ),
              TextButton(
                onPressed: pickCountry,
                child: const Text('Pick Your Country'),
              ),
              SizedBox(
                height: screenSize.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    if (country != null) Text('+${country!.phoneCode}'),
                    SizedBox(
                      width: screenSize.width * 0.04,
                    ),
                    SizedBox(
                      width: screenSize.width * 0.7,
                      child: TextField(
                        controller: phoneController,
                        decoration: const InputDecoration(
                          hintText: 'phone number',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: screenSize.width * 0.3,
                child: CustomButton(
                  text: "NEXT",
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
