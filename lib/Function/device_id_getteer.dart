import 'package:firebase_messaging/firebase_messaging.dart';

Future<String> getid() async {
  // Firebase
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  // _firebaseMessaging.requestNotificationPermissions();
  // _firebaseMessaging.configure();
  String token = await _firebaseMessaging.getToken();
  return token;
}