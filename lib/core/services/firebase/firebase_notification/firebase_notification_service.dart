import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:wave_drive/core/cubits/user/user_cubit.dart';
import 'package:wave_drive/core/routes/app_router.dart';
import 'package:wave_drive/core/services/firebase/firebase_notification/constants.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';
import 'package:wave_drive/injector_setup.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class FirebaseNotificationService {
  final _appRouter = injector<AppRouter>();
  final _userCubit = injector<UserCubit>();

  final _firebaseMessaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    _localNotificationInit();
    _firebaseMessagingInit();
  }

  Future<String?> getFCMToken() async {
    final token = await _firebaseMessaging.getToken();

    AppLogger.d('FirebaseIMToken: $token');

    return token;
  }

  Future<void> deleteFCMToken() async {
    await _firebaseMessaging.deleteToken();
    AppLogger.d('deleteFCMToken');
  }

  static Future<void> _fcmBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    AppLogger.d('[D] Notification -- FCM Background ${message.toMap()}');
  }

  Future<void> _firebaseMessagingInit() async {
    await _firebaseMessaging.setAutoInitEnabled(true);
    // To enable foreground notification in firebase messaging for IOS
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(badge: true, sound: true);

    // On iOS, this helps to take the user permissions
    final settings = await _firebaseMessaging.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      ///Background
      FirebaseMessaging.onBackgroundMessage(_fcmBackgroundHandler);

      ///Foreground
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        final String payloadData = jsonEncode(message.data);
        AppLogger.d("Got a message in foreground");
        AppLogger.d(" message===> ${message.data}");

        final Map<String, dynamic> params = message.data;

        final type = params['type'];

        AppLogger.d("type is ${type}");

        if (message.notification != null) {
          showLocalNotification(
            title: message.notification!.title!,
            body: message.notification!.body!,
            payload: payloadData,
          );
        }
      });

      ///Tap on notification
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        AppLogger.d("this is the current userId ${message.senderId}");
        AppLogger.d("this is the message ${message.data}");
        if (message.notification != null) {
          AppLogger.d("Background Notification Tapped");

          final Map<String, dynamic> params = message.data;

          if (params.isEmpty) {
            _appRouter.popUntilRouteWithPath('/main');
          }
          _navigate(params); // 👈 Use same logic as foreground
        }
      });

      FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
        if (message != null) {
          AppLogger.d("Launched from terminated state");

          final Map<String, dynamic> params = message.data;

          if (params.isEmpty) {}

          Future.delayed(const Duration(seconds: 2), () {
            _navigate(params);
          });
        }
      });
    }
  }

  // initialize local notifications
  Future _localNotificationInit() async {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const DarwinInitializationSettings initializationSettingsDarwin = DarwinInitializationSettings();
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      macOS: initializationSettingsDarwin,
    );
    _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onNotificationTap,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  static void notificationTapBackground(NotificationResponse notificationResponse) {
    debugPrint('notificationResponse: $notificationResponse');
    // handle action
  }

  // on tap local notification in foreground
  void onNotificationTap(NotificationResponse notificationResponse) {
    AppLogger.d("foreground Notification Tapped, ${notificationResponse.payload}");
    final Map<String, dynamic> params = jsonDecode(notificationResponse.payload!) as Map<String, dynamic>;
    if (params.isEmpty) {
      _appRouter.popUntilRouteWithPath('/main');
      return;
    }
    _navigate(params);
  }

  // show a local notification
  Future showLocalNotification({required String title, required String body, required String payload}) async {
    final AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      NotificationConstants.channel.id,
      NotificationConstants.channel.name,
      channelDescription: NotificationConstants.channel.description,
      importance: Importance.max,
      priority: Priority.high,
    );

    final NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: const DarwinNotificationDetails(),
    );
    try {
      await _flutterLocalNotificationsPlugin.show(
        DateTime.now().hashCode,
        title,
        body,
        notificationDetails,
        payload: payload,
      );
    } catch (error) {
      AppLogger.e('showLocalNotification: $error');
    }
  }

  Future<bool> _navigate(Map<String, dynamic> params) async {
    if (params.isEmpty) {
      return false;
    }

    final type = params['type'];
    final userId = params['userId'] as String?;
    final isLoggedIn = _userCubit.state.isLoggedIn;

    switch (type) {
      default:
        return true;
    }
  }
}
