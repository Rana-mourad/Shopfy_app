import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:provider/provider.dart';
import 'package:shopfy/Controller/Logincontroller.dart';
import 'package:shopfy/Provider/Auth_Provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shopfy/theme/Appcolor.dart';
import 'package:shopfy/theme/customcard.dart';
import 'package:shopfy/views/Auth/Signup.dart';
import 'package:shopfy/widgets/custombutton.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    Provider.of<AppAuthProvider>(context, listen: false).init();
    super.initState();
  }

  @override
  void dispose() {
    Provider.of<AppAuthProvider>(context, listen: false).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (_, b) => Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<AppAuthProvider>(
              builder: (ctx, appAuthProvider, _) {
                return Form(
                  key: appAuthProvider.formKey,
                  child: SingleChildScrollView(
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomCard(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: appAuthProvider.emailController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Email is required';
                                      }
                                      if (!EmailValidator.validate(value)) {
                                        return 'Enter a valid email';
                                      } else if (!value
                                          .split('@')
                                          .last
                                          .contains('gmail')) {
                                        return 'Enter a valid Gmail address';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      label: const Text('Email'),
                                      suffixIcon: const Icon(Icons.mail),
                                      isDense: true,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    obscureText: appAuthProvider.obscureText,
                                    controller:
                                        appAuthProvider.passwordController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Password is required';
                                      }
                                      if (value.length < 8) {
                                        return 'Password length must be at least 8 characters';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      label: const Text('Password'),
                                      suffixIcon: InkWell(
                                        onTap: () {
                                          appAuthProvider.toggleObscure();
                                        },
                                        child: appAuthProvider.obscureText
                                            ? const Icon(Icons.visibility_off)
                                            : const Icon(Icons.visibility),
                                      ),
                                      isDense: true,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  GetBuilder<LoginController>(
                                    builder: (controller) {
                                      return CustomButton(
                                        onTap: controller.isLoading
                                            ? null
                                            : () async {
                                                controller.login();
                                              },
                                        text: "LOG IN",
                                        buttonColor: controller.isLoading
                                            ? Colors.brown
                                            : AppColor.primaryColor,
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 40),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                "Don’t have an account? Swipe right to ",
                                            style: TextStyle(
                                                color: AppColor.fontColor),
                                          ),
                                          TextSpan(
                                            text: "create a new account.",
                                            style: TextStyle(
                                                color: AppColor.primaryColor),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SignupPage()),
                                                );
                                              },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
