part of '../services.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
AndroidInitializationSettings androidInitializationSettings =
    AndroidInitializationSettings('app_icon');
IOSInitializationSettings iosInitializationSettings = IOSInitializationSettings(
    onDidReceiveLocalNotification: onDidReceiveLocalNotification);
InitializationSettings initializationSettings = InitializationSettings(
    android: androidInitializationSettings, iOS: iosInitializationSettings);

Future onDidReceiveLocalNotification(
    int id, String title, String body, String payload) async {
  return CupertinoAlertDialog(
    title: Text(title),
    content: Text(body),
    actions: <Widget>[
      CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            print("");
          },
          child: Text("Okay")),
    ],
  );
}

class LocalNotification {
  static Future<void> showNotification(RemoteMessage message) async {
    print('Lokal Notification push');
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            'BBD', 'Notification', 'All Notification is Here',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    // Menampilkan Notifikasi
    await flutterLocalNotificationsPlugin.show(0, message.notification.title,
        message.notification.body, platformChannelSpecifics,
        payload: 'item x');
  }
}
