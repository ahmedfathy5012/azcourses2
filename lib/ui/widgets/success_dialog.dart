import 'dart:async';

import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessDialog extends StatefulWidget {
  final String title;


  SuccessDialog({this.title});

  @override
  _SuccessDialogState createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 1), () {
      Get.back();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
          color: Colors.transparent,
          child: Container(
            height: ScreenHelper.screenHeight(context,326),
            width:  ScreenHelper.screenWidth(context,306),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(ScreenHelper.screenRadius(context, 8))
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(
                vertical: ScreenHelper.screenHeight(context,40)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/reicons/trueicon.png",
                    height: ScreenHelper.screenHeight(context, 150),
                  ),
                  Text(
                    widget.title??"تمت العملية بنجاح",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3.copyWith(
                      color: BLACKCOLOR,
                      fontSize: ScreenHelper.screenFont(context,18)
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
