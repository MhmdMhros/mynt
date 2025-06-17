import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  String? fCMToken = '';
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    fCMToken = await _firebaseMessaging.getToken();
    log('FCMToken: $fCMToken');
  }

  Future<void> subscribeToTopic() async {
    await FirebaseMessaging.instance
        .subscribeToTopic(Platform.isAndroid
            ? 'owners_android'
            : Platform.isIOS
                ? 'owners_ios'
                : 'owners_')
        .then((_) {
      log('✅ Subscribed to mynt successfully');
    }).catchError((error) {
      log('❌ Failed to subscribe to mynt: $error');
    });
  }

  Future<void> unSubscribeFromTopic() async {
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(Platform.isAndroid
            ? 'owners_android'
            : Platform.isIOS
                ? 'owners_ios'
                : 'owners_')
        .then((_) {
      log('✅ unSubscribed from mynt successfully');
    }).catchError((error) {
      log('❌ Failed to unSubscribe from mynt: $error');
    });
  }
}
