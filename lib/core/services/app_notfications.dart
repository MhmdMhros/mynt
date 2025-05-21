// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// class AppNotifications {
//   late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

//   Future<void> setupNotification() async {
//     _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//     const android = AndroidInitializationSettings("@mipmap/ic_launcher");
//     const ios = DarwinInitializationSettings();
//     const initSettings = InitializationSettings(android: android, iOS: ios);

//     await _flutterLocalNotificationsPlugin.initialize(
//       initSettings,
//       onDidReceiveNotificationResponse: (details) =>
//           flutterNotificationClick(details.payload),
//       onDidReceiveBackgroundNotificationResponse: (details) =>
//           flutterNotificationClick(details.payload),
//     );

//     try {
//       await Firebase.initializeApp();
//       final settings = await FirebaseMessaging.instance.requestPermission(
//         alert: true,
//         badge: true,
//         sound: true,
//       );

//       if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//         String? token = await FirebaseMessaging.instance.getToken();
//         log("Firebase Messaging Token: $token");

//         // إعداد استقبال الرسائل في الأمام
//         FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//           log("onMessage: ${message.notification?.title}");
//           _showLocalNotificationFromRemoteMessage(message);
//         });

//         // عند فتح التطبيق من الإشعار
//         FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//           log('onMessageOpenedApp: ${message.data}');
//           flutterNotificationClick(json.encode(message.data));
//         });

//         // التعامل مع رسائل الخلفية
//         FirebaseMessaging.onBackgroundMessage(
//             _firebaseMessagingBackgroundHandler);
//       }
//     } catch (e) {
//       log("Firebase not initialized: $e");
//     }
//   }

//   static Future<void> _firebaseMessagingBackgroundHandler(
//       RemoteMessage message) async {
//     await Firebase.initializeApp();
//     log("Handling background message: ${message.messageId}");
//   }

//   Future<void> _showLocalNotificationFromRemoteMessage(
//       RemoteMessage message) async {
//     final notificationTitle = message.notification?.title ?? 'No Title';
//     final notificationBody = message.notification?.body ?? 'No Body';
//     final data = json.encode(message.data);

//     const androidDetails = AndroidNotificationDetails(
//       "channel_id",
//       "channel_name",
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     const iosDetails = DarwinNotificationDetails();

//     const notificationDetails =
//         NotificationDetails(android: androidDetails, iOS: iosDetails);

//     await _flutterLocalNotificationsPlugin.show(
//       DateTime.now().millisecondsSinceEpoch ~/ 1000,
//       notificationTitle,
//       notificationBody,
//       notificationDetails,
//       payload: data,
//     );
//   }

//   Future<void> showSimpleLocalNotification(String title, String body) async {
//     const androidDetails = AndroidNotificationDetails(
//       "local_channel_id",
//       "local_channel_name",
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     const iosDetails = DarwinNotificationDetails();

//     const notificationDetails =
//         NotificationDetails(android: androidDetails, iOS: iosDetails);

//     await _flutterLocalNotificationsPlugin.show(
//       DateTime.now().millisecondsSinceEpoch ~/ 1000,
//       title,
//       body,
//       notificationDetails,
//     );
//   }

//   static Future<void> flutterNotificationClick(String? payload) async {
//     if (payload != null) {
//       log("Notification clicked with payload: $payload");
//       // هنا ممكن تفتح صفحة معينة أو تتعامل مع الداتا
//     }
//   }
// }
