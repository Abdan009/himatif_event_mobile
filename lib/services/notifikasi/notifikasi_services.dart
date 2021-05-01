part of '../services.dart';

class NotifikasiServices {
  static String serverToken =
      'AAAApwJU9Zg:APA91bESun2RUEH7yNGckPgxQS-4XX78Xijg7DqLbleWDyo2mm1TWRcRylmahAZGhL3sfWefuP0XZ7TYPUDUdqk1KxsZ1c5AERi1tWCewkBXSriSxEsjp_qMDVK9JxbhPRjEpd7rP1-e';
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  static Future sendAndRetrieveMessage(String title, String body,
      {String token, String topic}) async {
    print('Notif Masuk');
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'to': (topic != null) ? '/topics/mahasiswa' : token,
          'notification': <String, dynamic>{
            'body': body,
            'title': title,
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done'
          },
        },
      ),
    );
  }
}
