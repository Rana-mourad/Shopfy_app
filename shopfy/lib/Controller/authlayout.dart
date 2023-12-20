import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopfy/views/Auth/Login.dart';
import 'package:shopfy/views/Auth/Signup.dart';
import 'package:shopfy/views/Auth/paswordforgot.dart';

class _AuthItem {
  final String text;
  final Widget views;
  _AuthItem({
    required this.text,
    required this.views,
  });
}

class AuthLayoutController extends GetxController {
  late int index;
  late List<_AuthItem> items;

  @override
  void onInit() {
    super.onInit();
    index = 0;
    items = [
      _AuthItem(text: "Log In", views: LoginPage()),
      _AuthItem(text: "Sign Up", views: SignupPage()),
      _AuthItem(text: "forgot Password", views: ForgotPasswordPage()),
    ];
  }

  void onChange(int newIndex) {
    index = newIndex;
    update();
  }

  Widget chooseScreen() {
    return items.elementAt(index).views;
  }
}
