import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../helpers/screen_helper.dart';
import '../../../helpers/screen_helper.dart';
import '../../../utils/constants.dart';
import 'used_button.dart';
import '../../../utils/constants.dart';
import 'package:get/get.dart';

class ErrorDialog extends StatelessWidget {
  String message;
  String buttonTitle;
  Function onSave;

  ErrorDialog(
      {this.message, this.buttonTitle = "الرجوع للتسجيل", this.onSave = null});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: ScreenHelper.screenWidth(context, 300),
        height: ScreenHelper.screenHeight(context, 150),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
                Radius.circular(ScreenHelper.screenRadius(context, 15)))),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: ScreenHelper.screenWidth(context, 20)),
          child: Column(
            children: [
              Text(
                message,
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.headline1.copyWith(
                    fontSize: ScreenHelper.screenFont(context, 15),
                    color: MAINCOLOR),
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenHelper.screenWidth(context, 50)),
                child: UsedButton(
                  widthFraction: ScreenHelper.screenWidth(context, 200),
                  textColor: Colors.white,
                  buttonColor: MAINCOLOR,
                  title: buttonTitle,
                  onTap: () {
//                  Get.back();
                    if (onSave != null) {
                      onSave();
                    } else {
                      Get.back();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
