import 'package:azcourses/services/firebase_notification_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:azcourses/ui/screens/global/splash_screen.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'ui/screens/global/signup_second_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  await FlutterDownloader.initialize(
      debug: true   // optional: set false to disable printing logs to console
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PushNotificationManger _pushNotificationManger = Get.put(PushNotificationManger());

  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void initState() {
    // TODO: implement initState
    // secureScreen();
    // Firebase.initializeApp();
    // _pushNotificationManger.configureCallback();
    // localNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // /SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      color: MAINCOLOR,
      title: 'az courses',
      locale: Locale("ar", "AE"),
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffFDFDFD),
        buttonColor: Color(0xff01C56A),
        primaryColor: Color(0xff01C56A),
        accentColor: Color(0xffF9CA24),
        cardColor: Color(0xffEEEEEE),
        disabledColor: Color(0xffC3C2CF),
        textTheme: TextTheme(
          headline1: TextStyle(
            color: MAINCOLOR,
            fontFamily: "medium",
          ),
          headline2: TextStyle(
            color: WHITECOLOR,
            fontFamily: "regular",
          ),
          headline3: TextStyle(
            color: WHITECOLOR,
            fontFamily: "bold",
          ),
          caption: TextStyle(
            color: WHITECOLOR,
            fontFamily: "light",
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      // home: WelcomeScreen(),
    );
  }
}
