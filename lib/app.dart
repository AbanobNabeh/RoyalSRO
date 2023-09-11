import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:darksro/config/life_cycle_manager/lifecyclemanager.dart';
import 'package:darksro/core/utils/app_colors.dart';
import 'package:darksro/core/utils/app_string.dart';
import 'package:darksro/features/Splash/presentation/cubit/splash_cubit.dart';
import 'package:darksro/features/Splash/presentation/pages/splashscreen.dart';
import 'package:darksro/features/home/presentation/cubit/home_cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'config/routes/app_routes.dart';
import 'config/theme/app_theme.dart';
import 'features/event/presentation/cubit/event_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      AwesomeNotifications().createNotification(
          content: NotificationContent(
        largeIcon: message.data['icon'],
        bigPicture: message.notification!.android!.imageUrl,
        id: int.parse(message.data['id']),
        channelKey: 'com.example.firebase_push_notification',
        title: message.notification!.title,
        body: message.notification!.body,
        notificationLayout: NotificationLayout.BigPicture,
        color: AppColors.primercolor,
        backgroundColor: AppColors.black,
        payload: {},
      ));
    });
    return LifeCycleManager(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SplashCubit()..getinit(),
          ),
          BlocProvider(
            create: (context) => HomeCubit()..GetInfo(),
          ),
          BlocProvider(
            create: (context) => EventCubit(),
          )
        ],
        child: BlocConsumer<SplashCubit, SplashState>(
          builder: (context, state) {
            return MaterialApp(
              locale: Locale(
                  Stringconstants.lang ?? Platform.localeName.substring(0, 2)),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              onGenerateRoute: RouteGenerate.onGenerateroute,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.darktheme(),
              darkTheme: AppTheme.darktheme(),
              home: SplashScreen(),
            );
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
