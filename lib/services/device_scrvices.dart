

import 'dart:io' show Platform;

import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
// import 'package:get_mac/get_mac.dart';

class DeviceServices{
  static Future getAndroidDeviceInfo()async{
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      var  deviceId = await deviceInfo.androidInfo;
      return deviceId.id+deviceId.type+deviceId.model+deviceId.hardware;
    } else if (Platform.isIOS) {
      var  deviceId = await deviceInfo.iosInfo;
      return deviceId.model+deviceId.identifierForVendor;
    }
  }
  // static Future<String> getMacAddress()async{
  //   String platformVersion;
  //   try {
  //     platformVersion = await GetMac.macAddress;
  //   } on PlatformException {
  //     platformVersion = 'Failed to get Device MAC Address.';
  //   }
  //   return platformVersion;
  // }
}