import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LoacalNotification {
  static Future init(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var android = const AndroidInitializationSettings('mipmap/ic_launcher');
    var initializesetting = InitializationSettings(android: android);
    await flutterLocalNotificationsPlugin.initialize(initializesetting);
  }
}
