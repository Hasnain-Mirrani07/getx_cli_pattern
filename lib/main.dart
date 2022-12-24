import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:get/get.dart';
import 'package:getx_cli/app/modules/reminder/controllers/notification_services.dart';
import 'package:timezone/data/latest_10y.dart';

import 'app/routes/app_pages.dart';

FlutterLocalNotificationsPlugin notiPlugin = FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeTimeZones();

  AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  InitializationSettings initializationSettings =
      InitializationSettings(android: androidSettings);
  bool? initialized = await notiPlugin.initialize(initializationSettings);

  // await NotificationService().init(); //
  // await NotificationService().requestIOSPermissions();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
