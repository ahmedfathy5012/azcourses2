import 'package:azcourses/helpers/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InnerReturnedAppBar extends StatelessWidget {
  final String title;


  InnerReturnedAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
              height: ScreenHelper.screenHeight(context, 16),
              child: Image.asset("assets/icons/backicon.png",height: ScreenHelper.screenHeight(context,16),)
          ),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headline1.copyWith(
              fontSize: ScreenHelper.screenFont(context, 17),
              color: Colors.white),
        ),
        Container(
            height: ScreenHelper.screenHeight(context, 16),
            child: Image.asset("assets/icons/backicon.png",color: Colors.transparent,height: ScreenHelper.screenHeight(context,16),)
        ),
      ],
    );
  }
}
