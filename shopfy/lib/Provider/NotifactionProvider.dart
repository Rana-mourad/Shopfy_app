import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  late FirebaseMessaging _firebaseMessaging;
  late String _token;

  String get token => _token;

  NotificationProvider() {
    _firebaseMessaging = FirebaseMessaging.instance;
    _registerNotification();
  }

  void _registerNotification() {
    _firebaseMessaging.requestPermission();
    _firebaseMessaging.getToken().then((token) {
      _token = token!;
      notifyListeners();
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received message: ${message.notification?.title}');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message opened app: ${message.notification?.title}');
    });
  }
}
