import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopfy/views/Auth/Login.dart';
import 'package:shopfy/views/masterpage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  StreamSubscription<User?>? _listener;
  @override
  void initState() {
    checkUser();
    super.initState();
  }

  void checkUser() async {
    await Future.delayed(const Duration(seconds: 2));
    _listener = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const LoginPage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const MasterPage()));
      }
    });
  }

  @override
  void dispose() {
    _listener?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircularProgressIndicator()],
        ),
      ),
    );
  }
}
