import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  //create an instance of firebase messaging:
  final _firebaseMessaging = FirebaseMessaging.instance;

  //function to initialize notifications:
  Future<void> initNotifications() async {
    //request permission from user:
    await _firebaseMessaging.requestPermission();

    //fetch the FCM token for this device
    final fCMToken = await _firebaseMessaging.getToken();

    //print the token
    print('Token: $fCMToken');
  }

  //function to handle received messages

  //function to initialize foreground and background settings
}
