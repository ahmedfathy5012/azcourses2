import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Dart Packages
import 'dart:async';
// Flutter packages
// Screens
// Widgets
// Providers
// Models
// Helpers
import '../../../utils/constants.dart';
import '../../../helpers/screen_helper.dart';

class CircleButton extends StatelessWidget {
  final bool isActive;
  final Function onPressed;
  final Color shadowColor;
  final double spreadRadius;
  final double blurRadius;
  final IconData iconData;
  final double size;
  final Color buttonColor;
  final Color iconColor;
  final bool isLoading;
  final String iconString;
  final double iconWidth;
  final double iconHeight;


  CircleButton(
      {
      this.iconColor = WHITECOLOR,
      this.buttonColor = null,
      this.size = 41,
      this.iconData = Icons.arrow_back,
      this.isActive = true,
      this.onPressed,
      this.shadowColor = Colors.transparent,
      this.spreadRadius = 0,
      this.blurRadius = 0,
      this.isLoading=false,
      this.iconString="assets/icons/backiconback.png",
      this.iconWidth=19,
      this.iconHeight=12
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: ScreenHelper.screenWidth(context, size),
        width: ScreenHelper.screenWidth(context, size),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              spreadRadius: spreadRadius,
              blurRadius: blurRadius,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
          gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff7BE495), Color(0xff34A853)]),
          borderRadius: BorderRadius.circular(
              ScreenHelper.screenWidth(context, size / 2)),
        ),
        child: Icon(Icons.check,color: Colors.white,)
      ),
    );
  }
}
