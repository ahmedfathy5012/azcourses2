import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'local_notification_services.dart';


// Future<dynamic> myBackgroundMessageHandler( message) {
//
//   print("on Background = = = = = == = === = = == = = ==> 1111111}");
//   print("onBack ${message["data"]["body"]}");
//   print("onBack ${message["data"]["title"]}");
//
//   showNotification(body: "${message["data"]["body"]}", title: "${message["data"]["title"]}");
// }


Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {

  //   if (message['data'] != null) {
  //   final data =  message['data'];
  //   final title = data['title'];
  //   final body =  data['body'];
  //   await         _showNotificationWithDefaultSound(title, body);
  //   }

  // return Future<void>.value();
  print("ddddgfffffffffffffffffffffffff");
  showNotification(body: "hhh", title: "iiii");
}

Future _showNotificationWithDefaultSound(String title, String message) async {
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel_id', 'channel_name', 'channel_description',
      importance: Importance.max, priority: Priority.high,playSound: true
  );
  var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(iOS:iOSPlatformChannelSpecifics, android: androidPlatformChannelSpecifics, );
  await flutterLocalNotificationsPlugin.show(
    0,
    '$title',
    '$message',
    platformChannelSpecifics,
    payload: 'Default_Sound',
  );
}

class PushNotificationManger extends GetxController{
  // single tone
  // PushNotificationManger._();
  // factory PushNotificationManger() => _instance;
  // static PushNotificationManger _instance = PushNotificationManger._();


  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  void configureCallback() {
    if (Platform.isIOS) {
      _firebaseMessaging.requestNotificationPermissions(
          const IosNotificationSettings(
              sound: true, badge: true, alert: true, provisional: true));
      _firebaseMessaging.onIosSettingsRegistered
          .listen((IosNotificationSettings settings) {
        print("Settings registered: $settings");
      });
    }

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        // If APP Is Opend.

        showNotification(body: "${message["notification"]["body"]}", title: "${message["notification"]["title"]} ");
        print('onMessage ==== ? ${message}');

        // Allprview extractData = Allprview.fromJson(message["data"]["body"]);
        // print("on Messa==== ?>>> ${extractData.address}");
        // print('onMessage ==== 222222? ${message["data"]["body"]["pulmber_phone"]}');
        // Allprview ddd = Allprview.fromJson(message["data"]["body"]);

      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume =============================');
        print('onResume ==== ? $message');
        print('onResume =============================');
      },
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch ===--------------=============');
        print('onLaunch ==== ? $message');
      },
    );
  }


}


// {notification: {title: "FMC", body: "noty"}, data: {click_action: FLUTTER_NOTIFICATION_CLICK, message: message}}
