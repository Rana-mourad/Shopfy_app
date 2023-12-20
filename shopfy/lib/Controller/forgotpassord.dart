import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final TextEditingController email = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> sendPasswordResetEmail() async {
    if (!formKey.currentState!.validate()) return;

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email.text,
      );

      Get.snackbar(
        "Success".tr,
        "Please check your email".tr,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      );
    } on FirebaseAuthException catch (error) {
      Get.snackbar(
        "Something is wrong!".tr,
        error.message!,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      );
    }
  }

  @override
  void onClose() {
    email.dispose();
    super.onClose();
  }
}
