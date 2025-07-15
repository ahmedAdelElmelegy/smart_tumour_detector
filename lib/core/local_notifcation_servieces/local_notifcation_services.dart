import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotifcationServices {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static Future<void> requestNotificationPermission() async {
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
  }

  static onTap(NotificationResponse notificationResponse) {}
  static Future<void> init() async {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
            "@mipmap/ic_launcher"); // from AndriodMainfest.xml
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  static basicNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'New appointment reminder',
    );
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
      0,
      "Don't forget",
      'Your appointment in 12',
      notificationDetails,
      payload: 'item x',
    );
  }

  static periodicNotification() async {
    NotificationDetails notificationDetails = const NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'New appointment reminder',
      ),
    );
    await flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      'perodic',
      'this is perodic',
      RepeatInterval.everyMinute,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: 'item x',
    );
  }

  static scheduelNotification(String time, BuildContext context) async {
    final now = DateTime.now();
    final DateFormat formatter = DateFormat('h:mm a');
    final DateTime selectedTime = formatter.parse(time);
    

    final DateTime fullSelectedTime = DateTime(
      now.year,
      now.month,
      now.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    // -30 min and -15 min
    final DateTime scheduledTime30 =
        fullSelectedTime.subtract(const Duration(minutes: 30));
    final DateTime scheduledTime15 =
        fullSelectedTime.subtract(const Duration(minutes: 15));

    final tz.TZDateTime tzScheduledTime30 =
        tz.TZDateTime.from(scheduledTime30, tz.getLocation('Africa/Cairo'));
    final tz.TZDateTime tzScheduledTime15 =
        tz.TZDateTime.from(scheduledTime15, tz.getLocation('Africa/Cairo'));

    final tz.TZDateTime nowTz =
        tz.TZDateTime.now(tz.getLocation('Africa/Cairo'));

    int scheduledCount = 0;

    // إشعار قبل 30 دقيقة
    if (tzScheduledTime30.isAfter(nowTz)) {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        30,
        "Don't forget",
        'Your appointment in $time (in 30 mins)',
        tzScheduledTime30,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'your channel id',
            'your channel name',
            channelDescription: 'Appointment reminder',
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      );
      scheduledCount++;
    }

    // إشعار قبل 15 دقيقة
    if (tzScheduledTime15.isAfter(nowTz)) {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        15,
        "Don't forget",
        'Your appointment in $time (in 15 mins)',
        tzScheduledTime15,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'your channel id',
            'your channel name',
            channelDescription: 'Appointment reminder',
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      );
      scheduledCount++;
    }

    // لو الاتنين عدوا
    if (scheduledCount == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('❌ Cannot schedule notification. Time has passed.'),
        ),
      );
      return;
    }

    // تم الجدولة بنجاح
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('✅ Appointment Done successfully.'),
      ),
    );
  }

  static void cancelNotfication(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
