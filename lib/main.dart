import 'package:careno/widgets/custom_error.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'AuthSection/screen_welcome.dart';
import 'constant/colors.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(Duration(seconds: 1));
  colorConfig();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(const MyApp());
}
void colorConfig() {
  MaterialColor appPrimaryColor = MaterialColor(
    0xFF4C0AE1,
    const <int, Color>{
      50: const Color(0xFF4C0AE1),
      100: const Color(0xFF4C0AE1),
      200: const Color(0xFF4C0AE1),
      300: const Color(0xFF4C0AE1),
      400: const Color(0xFF4C0AE1),
      500: const Color(0xFF4C0AE1),
      600: const Color(0xFF4C0AE1),
      700: const Color(0xFF4C0AE1),
      800: const Color(0xFF4C0AE1),
      900: const Color(0xFF4C0AE1),
    },
  );
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  void initState() {
    checkNotificationPermission();
    super.initState();
  }

  Future<void> setupInteractedMessage() async {

    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
    FirebaseMessaging.onMessage.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    print("message: $message");

    if (message.data['type'] == 'chat') {}
  }

  void setupNotificationChannel() async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    const settingsAndroid =
    AndroidInitializationSettings('@mipmap/launcher_icon');
    final settingsIOS = DarwinInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) => null);
    await flutterLocalNotificationsPlugin.initialize(
        InitializationSettings(android: settingsAndroid, iOS: settingsIOS));

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      AppleNotification? iOS = message.notification?.apple;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    channelDescription: channel.description,
                    icon: android.smallIcon,
                    enableVibration: true,
                    // importance: Importance.max,
                    priority: Priority.max,
                    // ongoing: false,
                    // autoCancel: true,
                    // visibility: NotificationVisibility.public,
                    enableLights: true
                  // other properties...
                ),
                iOS: DarwinNotificationDetails(
                  sound: iOS?.sound?.name,
                  presentAlert: true,
                  presentBadge: true,
                  presentSound: true,
                )));

        // showOngoingNotification(flutterLocalNotificationsPlugin, title: notification.title ?? "", body: notification.body ?? "");
      }
    });
  }

  void initNotificationChannel() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings();
    const DarwinInitializationSettings initializationSettingsMacOS =
    DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
    InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
        macOS: initializationSettingsMacOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
  );
  void checkNotificationPermission() async {
    var settings = await FirebaseMessaging.instance.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      setupInteractedMessage();
      initNotificationChannel();
      setupNotificationChannel();
    }
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:  Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return GetMaterialApp(
            // home: ScreenAthleteHomePage(),
            home: ScreenWelcome(),
            locale: Locale('en', 'US'),
            debugShowCheckedModeBanner: false,
            defaultTransition: Transition.fade,
            title: "Careno",
            theme: ThemeData(
              fontFamily: 'Urbanist',
              primarySwatch: AppColors.appPrimaryColor,
              radioTheme: RadioThemeData(
                fillColor: MaterialStateColor.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return const Color(0xFF505050); // Selected color
                  }
                  return const Color(0xFFD0D5DD); // Unselected color
                }),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                splashRadius: 4.0, // Adjust the splash radius if needed
                visualDensity: VisualDensity.standard,
              ),
              checkboxTheme: CheckboxThemeData(
                checkColor: MaterialStateProperty.all(Colors.white),
                fillColor: MaterialStateProperty.all(AppColors.appPrimaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),

                side: BorderSide(color: Color(0xff585858), width: 1),
              ),
              appBarTheme: AppBarTheme(
                color: Colors.white,
                elevation: 0,
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Urbanist"),
                centerTitle: false,
                systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: Colors.transparent),
                iconTheme: IconThemeData(color: Colors.black),
              ),
              dividerColor: Colors.transparent,
              scaffoldBackgroundColor: Colors.white,
              backgroundColor: Color(0xFFFAFBFF),
            ),
            builder: (context, widget) {
              ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                return CustomError(errorDetails: errorDetails);
              };
              return ScrollConfiguration(
                  behavior: NoColorScrollBehavior(), child: widget!);
            },
          );
        });
  }
}

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
        return const BouncingScrollPhysics();
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
    }
  }
}

class NoColorScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
