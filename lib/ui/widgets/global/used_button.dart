import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Dart Packages
// Flutter packages
// Screens
// Widgets
// Providers
// Models
// Helpers
import '../../../utils/constants.dart';
import '../../../helpers/screen_helper.dart';

class UsedButton extends StatelessWidget {
  double widthFraction;
  double heightFraction;
  double borderWidthFraction;
  double borderRadiusFraction;
  Color buttonColor;
  Color borderColor;
  Color textColor;
  String title;
  Widget child;
  Color shadowColor;
  double spreadRadius;
  double blurRadius;
  Function onTap;

  UsedButton({
    this.widthFraction=343,
    this.heightFraction=60,
    this.borderWidthFraction=0,
    this.buttonColor=MAINCOLOR,
    this.borderColor=Colors.transparent,
    this.textColor=WHITECOLOR,
    this.title="",
    this.child,
    this.borderRadiusFraction=10,
    this.blurRadius=0,
    this.shadowColor=Colors.transparent,
    this.spreadRadius=0,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: ScreenHelper.screenWidth(context, widthFraction),
        height: ScreenHelper.screenHeight(context, heightFraction),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius:
          BorderRadius.circular(ScreenHelper.screenRadius(context, borderRadiusFraction)),
          border: Border.all(
            color: borderColor,
            width: borderWidthFraction,
          ),
          boxShadow:spreadRadius != 0 ? [
            BoxShadow(
              color: buttonColor.withOpacity(.3),
              spreadRadius: spreadRadius,
              blurRadius: blurRadius,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]:null,
        ),
        child: Center(
          child: title.isNotEmpty ? Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline3.copyWith(
              fontSize: ScreenHelper.screenFont(context, 16),
              color: textColor,
            ),
            textDirection: TextDirection.rtl,
          ):child,
        ),
      ),
    );
  }
}
