import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';

class PointBox extends StatelessWidget {
  Color color;
  String icon;
  PointBox({this.color,this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenHelper.screenWidth(context,55),
      width: ScreenHelper.screenWidth(context,55),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(ScreenHelper.screenWidth(context, 6))),
        color: color,
      ),
      child: Center(
        child: SquareImageContainer(
          image: AssetImage(icon),
          size: 28.0,
        ),
      ),
    );
  }
}
