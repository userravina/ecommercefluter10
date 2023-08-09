
import 'dart:typed_data';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// ignore: depend_on_referenced_packages
import 'package:timezone/data/latest_all.dart' as tz;

// ignore: depend_on_referenced_packages
import 'package:timezone/timezone.dart' as tz;
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class Notification_permision {
  static final service = Notification_permision._();

  Notification_permision._();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings androidInit =
        const AndroidInitializationSettings('snapchat');
    // ignore: non_constant_identifier_names
    DarwinInitializationSettings IosInit = const DarwinInitializationSettings();
    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInit, iOS: IosInit);
    tz.initializeTimeZones();
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // ignore: non_constant_identifier_names
  void ShowNotification() {
    AndroidNotificationDetails androidetails = const AndroidNotificationDetails(
        "1", "Simple",
        priority: Priority.high, importance: Importance.max);
    // ignore: non_constant_identifier_names
    DarwinNotificationDetails Iosdetails = const DarwinNotificationDetails();

    NotificationDetails notificationDetails =
        NotificationDetails(iOS: Iosdetails, android: androidetails);

    flutterLocalNotificationsPlugin.show(
        1, "show notification", "flutter", notificationDetails);
  }

  // ignore: non_constant_identifier_names
  void Timenotification() {
    AndroidNotificationDetails androidetails = const AndroidNotificationDetails(
        "2", "Time",
        priority: Priority.high, importance: Importance.max);
    DarwinNotificationDetails Iosdetails = const DarwinNotificationDetails();

    NotificationDetails notificationDetails =
        NotificationDetails(iOS: Iosdetails, android: androidetails);

    flutterLocalNotificationsPlugin.zonedSchedule(
        2,
        "Perticular time notification",
        "flutter",
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  void soundNotification() {
    AndroidNotificationDetails androidetails = const AndroidNotificationDetails(
        "3", "Simple",
        priority: Priority.high, importance: Importance.max);
    // ignore: non_constant_identifier_names
    DarwinNotificationDetails Iosdetails = const DarwinNotificationDetails();

    NotificationDetails notificationDetails =
        NotificationDetails(iOS: Iosdetails, android: androidetails);

    flutterLocalNotificationsPlugin.show(
        3, "testing sound notification", "flutter", notificationDetails);
  }

  // Big picture notification

  Future<void> bigpicturenotification() async {
    Uint8List img = await _getByteArrayFromUrl(
        "https://img.freepik.com/premium-photo/autumn-sunset-forest_717472-4997.jpg");

    ByteArrayAndroidBitmap bigImage = ByteArrayAndroidBitmap(img);

    BigPictureStyleInformation bigpicture =
        BigPictureStyleInformation(bigImage);

    AndroidNotificationDetails androidetails =  AndroidNotificationDetails(
      "4",
      "Big picture",
      priority: Priority.high,
      importance: Importance.max,
      styleInformation: bigpicture,
    );

    NotificationDetails notificationDetails =
    NotificationDetails(android: androidetails);

    await flutterLocalNotificationsPlugin.show(
        4, "show big picture notification", "flutter", notificationDetails);
  }

  Future<Uint8List> _getByteArrayFromUrl(String url) async {
    final http.Response response = await http.get(Uri.parse(url));
    return response.bodyBytes;
  }

  //==================== messaging ===================

  void firesideNotification(title,body) {
    AndroidNotificationDetails androidetails = const AndroidNotificationDetails(
        "5", "fire",
        priority: Priority.high, importance: Importance.max);
    // ignore: non_constant_identifier_names
    DarwinNotificationDetails Iosdetails = const DarwinNotificationDetails();

    NotificationDetails notificationDetails =
    NotificationDetails(iOS: Iosdetails, android: androidetails);

    flutterLocalNotificationsPlugin.show(
        5, "$title", "$body", notificationDetails);
  }
}
