import 'package:flutter/material.dart';
import 'package:azcourses/helpers/screen_helper.dart';

class HeaderBackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: ScreenHelper.screenHeight(context, 200),
        child: Image.asset("assets/reicons/headerback.png",fit: BoxFit.cover,)
    );
  }
}
