import 'package:dofix_technichian/firebase_options.dart';
import 'package:dofix_technichian/utils/app_constants.dart';
import 'package:dofix_technichian/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'helper/di_dart.dart' as di;
import 'helper/route_helper.dart';

///  Background notification handler
///  Ye function class ke bahar hi rahega
Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint(
      "Background message received: ${message.messageId}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Firebase init
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// Background handler register
  FirebaseMessaging.onBackgroundMessage(
      firebaseMessagingBackgroundHandler);

  /// DI init
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _setupFCM();
  }

  ///  Foreground + click listeners
  Future<void> _setupFCM() async {
    FirebaseMessaging messaging =
        FirebaseMessaging.instance;

    /// Permission (Android 13+ / iOS)
    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    /// App foreground me ho
    FirebaseMessaging.onMessage.listen((message) {
      debugPrint(
          "Foreground message: ${message.notification?.title}");
    });

    /// App background se open ho
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      debugPrint("Notification clicked (background)");
    });

    /// App kill state se open ho
    RemoteMessage? initialMessage =
    await messaging.getInitialMessage();

    if (initialMessage != null) {
      debugPrint(
          "App opened from terminated state");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: light,
      initialRoute: RouteHelper.getInitialRoute(),
      getPages: RouteHelper.routes,
      defaultTransition: Transition.topLevel,
      transitionDuration:
      const Duration(milliseconds: 500),
      builder: (BuildContext context, widget) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(1.0),
          ),
          child: widget!,
        );
      },
    );
  }
}
