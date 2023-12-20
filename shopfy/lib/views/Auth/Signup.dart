import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopfy/Provider/Auth_Provider.dart';
import 'package:shopfy/theme/Appcolor.dart';
import 'package:shopfy/theme/customcard.dart';
import 'package:shopfy/theme/customformfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  void initState() {
    Provider.of<AppAuthProvider>(context, listen: false).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          child: Column(
                            children: [
                              buildEmailField(appAuthProvider),
                              buildUsernameField(appAuthProvider),
                              buildPasswordField(appAuthProvider),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const SizedBox(height: 40),
                        buildRichText(),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildEmailField(AppAuthProvider appAuthProvider) {
    return CustomFormField(
      labelText: "EMAIL",
      imageSvgPath: "assets/images/001-mail.svg",
      controller: appAuthProvider.emailController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is required';
        }
        if (!EmailValidator.validate(value)) {
          return 'Enter a valid email';
        } else if (!value.split('@').last.contains('gmail')) {
          return 'Enter a valid Gmail address';
        }
        return null;
      },
    );
  }

  Widget buildUsernameField(AppAuthProvider appAuthProvider) {
    return CustomFormField(
      labelText: "USERNAME",
      imageSvgPath: "assets/images/Profile.svg",
      controller: appAuthProvider.userController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Username is required';
        }
        return null;
      },
    );
  }

  Widget buildPasswordField(AppAuthProvider appAuthProvider) {
    return CustomFormField(
      labelText: "PASSWORD",
      imageSvgPath: "assets/images/002-password.svg",
      controller: appAuthProvider.passwordController,
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }
        if (value.length < 8) {
          return 'Password length must be at least 8 characters';
        }
        return null;
      },
    );
  }

  Widget buildRichText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: "By creating an account, you agree to our ",
              style: TextStyle(color: AppColor.fontColor),
            ),
            TextSpan(
              text: "Terms of Service",
              style: TextStyle(color: AppColor.primaryColor),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
            TextSpan(
              text: " and ",
              style: TextStyle(color: AppColor.fontColor),
            ),
            TextSpan(
              text: "Privacy Policy",
              style: TextStyle(color: AppColor.primaryColor),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ),
    );
  }
}
