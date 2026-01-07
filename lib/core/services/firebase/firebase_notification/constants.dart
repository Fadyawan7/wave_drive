import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationConstants {
  static const channel = AndroidNotificationChannel(
    'high_importance_channel', 
    'High Importance Notifications',
    importance: Importance.max,
  );
}