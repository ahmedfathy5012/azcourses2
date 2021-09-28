import 'package:flutter/material.dart';

class ScreenHelper {
  static double screenHeight(BuildContext context, double factor) {
    return (factor / 812) * MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context, double factor) {
    return (factor / 375) * MediaQuery.of(context).size.width;
  }

  static double screenFont(BuildContext context, double factor) {
    return (factor / 450) * MediaQuery.of(context).size.width;
  }

  static double screenRadius(BuildContext context, double factor) {
    return (factor / 400) * MediaQuery.of(context).size.width;
  }



  static double screenSizeFraction(BuildContext context , double fraction){
    return MediaQuery.of(context).devicePixelRatio*fraction;
  }
}