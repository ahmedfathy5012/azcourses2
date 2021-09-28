import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Dart Packages
import 'dart:async';

import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/utils/constants.dart';
// Flutter packages
// Screens
// Widgets
// Providers
// Models
// Helpers

class ActionRow extends StatelessWidget {
  String title;
  // String icon;
  Function onTap;

  ActionRow({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
//              Image.asset(
//                icon,
//                width: ScreenHelper.screenWidth(context, 24.0),
//                height: ScreenHelper.screenWidth(context, 24.0),
//                color: SECONDERYCOLOR,
//              ),
//              SizedBox(
//                width: ScreenHelper.screenWidth(context, 11.0),
//              ),
              Text(
                title,
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.headline3.copyWith(
                    fontSize: ScreenHelper.screenFont(context, 16.0),
                    color: DARKBLUECOLR),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: DARKBLUECOLR,
            size: ScreenHelper.screenWidth(context, 12.0),
          ),
        ],
      ),
    );
  }
}
