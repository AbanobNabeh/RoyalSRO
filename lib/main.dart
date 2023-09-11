import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:darksro/app.dart';
import 'package:darksro/config/network/diohelper.dart';
import 'package:darksro/config/network/paymentapi.dart';
import 'package:darksro/core/utils/app_colors.dart';
import 'package:darksro/core/utils/app_notification.dart';

import 'package:darksro/core/utils/deviceinfo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'config/shared_preferences/shared_preferences.dart';
import 'core/blocobserver/blocobserve.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioApp.init();
  await DioPayment.init();
  await DeviceInfo.init();
  await Firebase.initializeApp();
  await FCMHandle().initnotification();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: "com.example.firebase_push_notification",
      channelName: "default_notification_channel_id",
      channelDescription: "Used to send the main notifications to our users",
      channelShowBadge: true,
      defaultColor: AppColors.primercolor,
      enableLights: true,
      enableVibration: true,
      ledColor: AppColors.black,
      importance: NotificationImportance.Max,
      playSound: true,
    )
  ]);
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}
