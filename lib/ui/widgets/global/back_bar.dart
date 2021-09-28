import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:azcourses/helpers/screen_helper.dart';

class BackBar extends StatelessWidget {
  final String title;

  BackBar({this.title = " "});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: ScreenHelper.screenHeight(context, 35),
          horizontal: ScreenHelper.screenWidth(context, 17)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
                height: ScreenHelper.screenHeight(context, 30),
                color: Colors.transparent,
                child: Center(
                  child: Image.asset(
                    "assets/icons/backicon.png",
                    height: ScreenHelper.screenHeight(context, 17),
                  ),
                )),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headline3.copyWith(
                color: Colors.white,
                fontSize: ScreenHelper.screenFont(context, 18)),
          ),
          Container(
              height: ScreenHelper.screenHeight(context, 16),
              child: Image.asset(
                "assets/icons/backicon.png",
                height: ScreenHelper.screenHeight(context, 16),
                color: Colors.transparent,
              )),
        ],
      ),
    );
  }
}
