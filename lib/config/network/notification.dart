import 'dart:convert';
import 'package:http/http.dart' as http;

class APInotification {
  static Future<http.Response> postRequset({
    required String to,
    required String title,
    required String body,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'key=AAAAvAQV7Sg:APA91bEIPfu0YmSxg997RXXus5HsPS5IM3MQDm2Jp5g4RywBVBt0L0XtivBUcb_E0rycR3a5qrFm1udLW5lh06EgDWv7j3KOCTQFIL27klxdEvY9G6GwZBLVLWxSVwmd1L0tCLfTFF7E'
    };

    return await http.post(Uri.parse("https://fcm.googleapis.com/fcm/send"),
        body: jsonEncode({
          "to": to,
          "notification": {"title": title, "body": body, "sounde": "default"},
          "android": {
            "channelid": "com.example.firebase_push_notification",
            "priority": "HIGH",
            "notification": {
              "notification_priority": "PRIORITY_MAX",
              "sounde": "default",
              "default_sounde": true,
              "default_vibrate_timing": true,
              "default_light_setting": true
            }
          },
          "data": {
            "id": "1",
            "phonenumber": "+201550771964",
            "icon":
                "http://89.163.221.170:88/storage/notification/night-market.png",
            "clicke_action": "FLUTTER_NOTIFICATION_CLICK"
          },
          "token": "user_device_token"
        }),
        headers: headers);
  }
}
