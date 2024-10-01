import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Background message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Handle the background message (e.g., show a notification)
  print('Handling a background message: ${message.messageId}');
}

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterNotificationPlugin =
      FlutterLocalNotificationsPlugin();

  /***** Request Permission ******/
  Future requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User granted permission");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("User granted provisional permission");
    } else {
      print("User denied permission");
      openAppSettings();
    }
  }

/****************** openAppSettings ************ */
  Future<void> openAppSettings() async {
    const platform = MethodChannel('com.carbooking.own/settings');
    try {
      await platform.invokeMethod('openNotificationSettings');
    } on PlatformException catch (e) {
      print("Failed to open settings: '${e.message}'.");
    }
  }

  /*********************** Initialize Firebase ******/
  void firebaseInit() {
    FirebaseMessaging.onMessage.listen((message) {
      print('Received a message in the foreground:');
      print(message.notification!.title.toString());
      print(message.notification!.body.toString());
      showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      // Handle when the notification is tapped and the app is opened
      print('Message clicked!');
    });
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  /************************* Show Notification ***************/
  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
        Random.secure().nextInt(10000).toString(),
        "High importance Notification",
        importance: Importance.max);

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            channel.id.toString(), channel.name.toString(),
            importance: Importance.high,
            priority: Priority.high,
            channelDescription: "Your Channel Description");

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    Future.delayed(Duration.zero, () {
      _flutterNotificationPlugin.show(0, message.notification!.title.toString(),
          message.notification!.body.toString(), notificationDetails);
    });
  }

  /********* Get Token *********/
  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  /*** * Check Token Refresh ******/
  void isTokenRefresh() {
    messaging.onTokenRefresh.listen((event) {
      print("Token refreshed: $event");
    });
  }

  /**************************** Initialize Local Notifications *******/
  void initLocalNotification(
      BuildContext context, RemoteMessage message) async {
    var androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    var initializationSettings =
        InitializationSettings(android: androidInitializationSettings);

    await _flutterNotificationPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (payload) {
        // Handle notification response when the app is in the foreground
        print('Notification response received!');
      },
    );
  }
}
