import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shopfy/Controller/forgotpassord.dart';
import 'package:shopfy/theme/customcard.dart';
import 'package:shopfy/theme/customformfield.dart';
import 'package:shopfy/widgets/custombutton.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late ForgotPasswordController forgotPasswordController;

  @override
  void initState() {
    forgotPasswordController = ForgotPasswordController();
    super.initState();
  }

  @override
  void dispose() {
    forgotPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<ForgotPasswordController>(
            builder: (restPasswordController) {
              return buildPasswordResetForm(forgotPasswordController);
            },
          ),
        ),
      ),
    );
  }

  Widget buildPasswordResetForm(ForgotPasswordController controller) {
    return Form(
      key: controller.formKey,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Text(
                  "Enter the email address you used to create your account, and we will email you a link to reset your password",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(height: 20),
              CustomCard(
                child: Column(
                  children: [
                    CustomFormField(
                      labelText: "EMAIL",
                      imageSvgPath: "assets/images/001-mail.svg",
                      controller: controller.email,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                onTap: () async {
                  await controller.sendPasswordResetEmail();
                },
                text: "SEND EMAIL",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
