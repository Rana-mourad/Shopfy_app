import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopfy/Provider/Auth_Provider.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AppAuthProvider authService = AppAuthProvider();

  bool isLoading = false;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading = true;
        update();

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        print("User logged in: ${userCredential.user?.email}");

        isLoading = false;
        update();

        Get.offAllNamed('/home');
      } on FirebaseAuthException catch (e) {
        isLoading = false;
        update();

        Get.snackbar(
          "Authentication Error",
          e.message ?? "An error occurred during login",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }
}
