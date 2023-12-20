import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopfy/views/Auth/Login.dart';
import 'package:shopfy/views/Auth/Signup.dart';
import 'package:shopfy/views/masterpage.dart';

class AppAuthProvider extends ChangeNotifier {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController userController;

  bool obscureText = true;

  void init() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    userController = TextEditingController();
  }

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
    userController.dispose();
  }

  void toggleObscure() {
    obscureText = !obscureText;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    try {
      QuickAlert.show(context: context, type: QuickAlertType.loading);

      var credentials = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (context.mounted) {
        Navigator.pop(context);

        if (credentials.user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const MasterPage()),
          );
        } else {
          await QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Error In Signup',
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      if (!context.mounted) return;

      Navigator.pop(context);

      String errorMessage = e.code == 'user-not-found'
          ? 'User not found'
          : e.code == 'wrong-password'
              ? 'Wrong password'
              : e.code;

      await QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: errorMessage,
      );
    } catch (e) {
      if (!context.mounted) return;

      Navigator.pop(context);

      await QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Login Error $e',
      );
    }
  }

  Future<void> signUp(BuildContext context) async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    try {
      QuickAlert.show(context: context, type: QuickAlertType.loading);

      var credentials =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (context.mounted) {
        Navigator.pop(context);

        if (credentials.user != null) {
          await QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            title: 'You Signup Successfully',
          );

          if (context.mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const MasterPage()),
            );
          }
        } else {
          await QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Error In Signup',
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      if (!context.mounted) return;

      Navigator.pop(context);

      String errorMessage = e.code == 'email-already-in-use'
          ? 'This Email Already in use'
          : e.code == 'weak-password'
              ? 'Weak Password'
              : e.code;

      await QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: errorMessage,
      );
    } catch (e) {
      if (!context.mounted) return;

      Navigator.pop(context);

      await QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Signup Error $e',
      );
    }
  }

  Future<void> onLogout(BuildContext contextEx) async {
    QuickAlert.show(context: contextEx, type: QuickAlertType.loading);

    await Future.delayed(const Duration(milliseconds: 300));

    await FirebaseAuth.instance.signOut();
    await GetIt.I.get<SharedPreferences>().clear();
    Navigator.pop(contextEx);
    Navigator.pushReplacement(
      contextEx,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  void openSignupPage(BuildContext context) {
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SignupPage()),
      );
    }
  }
}
