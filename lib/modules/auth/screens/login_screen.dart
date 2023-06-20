import 'package:chat_app/common/utils/utility.dart';
import 'package:chat_app/common/widgets/custom_button.dart';
import 'package:chat_app/modules/auth/controller/auth_controller.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';

  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneNumberController = TextEditingController();
  Country? country;

  @override
  void dispose() {
    super.dispose();
    phoneNumberController.dispose();
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

  void sendPhoneNumber() {
    String phoneNumb = phoneNumberController.text.trim();

    if (phoneNumb.isEmpty && country == null) {
      showSnackBar(context, 'Please fill all your phone number info');
    }

    ref
        .read(authControllerProvider)
        .signInWithPhone(context, '${country!.phoneCode}$phoneNumb');
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
                        controller: phoneNumberController,
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
                  onPressed: () => sendPhoneNumber(),
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
