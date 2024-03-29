import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_1/app_settings.dart';
import 'package:flutter_group_1/views/screens/home_page.dart';
//import 'package:flutter_group_1/views/screens/widgets/app_button.dart';
import 'package:flutter_group_1/views/widgets/app_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset("assets/6681204.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: "Phone Number",
                    ),
                    validator: (value) {
                      if (value!.length == 11 && int.tryParse(value) != null) {
                        return null;
                      } else {
                        return "Invalid Phone number";
                      }
                    }

                    // regex validation code
                    //     String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                    // RegExp regExp = new RegExp(pattern);
                    // if (regExp.hasMatch(value!)) {
                    //   return null;
                    // } else {
                    //   return "Invalid Phone number";
                    // }

                    ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: "Password"),
                  validator: (value) {
                    if (value!.length < 8) {
                      return "invalid Password";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                label: "Log in",
                color: Colors.blue[300]!,
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    if (kDebugMode) {
                      print("Logged in");
                    }
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => WelcomePage(
                    //             phoneNumber: phoneNumberController.text,
                    //           )),
                    // );
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString(AppSettings.phoneNumberSharedPrefsKey,
                        phoneNumberController.text);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                    // phoneNumberController.clear();
                    passwordController.clear();
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              const Text("Forgot Password?. Tap me"),
              const SizedBox(
                height: 35,
              ),
              AppButton(
                label: "No account, sign up",
                color: Colors.grey,
                onTap: () {
                  if (kDebugMode) {
                    print("Sign up");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
