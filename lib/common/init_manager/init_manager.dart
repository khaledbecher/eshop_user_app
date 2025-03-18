import 'package:eshop/common/constants/keys.dart';
import 'package:eshop/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

void setupLocalNotifications() async {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  var androidInitSettings =
      const AndroidInitializationSettings('@mipmap/ic_launcher');
  var iosInitSettings = const DarwinInitializationSettings();

  var initSettings = InitializationSettings(
    android: androidInitSettings,
    iOS: iosInitSettings,
  );
  await flutterLocalNotificationsPlugin.initialize(initSettings);
}

void setupFCM() async {
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  // Handle foreground notifications
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.notification != null) {
      showNotification(message.notification!);
    }
  });

  // Handle background & terminated state notifications
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});

  await messaging.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
}

void showNotification(RemoteNotification notification) {
  var androidDetails = AndroidNotificationDetails(
    'channelId',
    'Order Updates',
    channelDescription: 'Receive order status updates',
    importance: Importance.high,
    priority: Priority.high,
    playSound: true,
  );
  var iosDetails = const DarwinNotificationDetails();

  var generalNotificationDetails = NotificationDetails(
    android: androidDetails,
    iOS: iosDetails,
  );

  FlutterLocalNotificationsPlugin().show(
    0,
    notification.title,
    notification.body,
    generalNotificationDetails,
  );
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(
    fileName: 'config.env',
  );
  Stripe.publishableKey = AppKeys.stripePublishableKey;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupFCM();
}
