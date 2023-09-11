import 'package:firebase_messaging/firebase_messaging.dart';

class FCMHandle {
  final _firebasemessagin = FirebaseMessaging.instance;

  Future<void> initnotification() async {
    await _firebasemessagin.requestPermission();
    final fcmtoken = await _firebasemessagin.getToken();
  }
}
