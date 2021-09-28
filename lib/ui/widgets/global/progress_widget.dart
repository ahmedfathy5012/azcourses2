import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/utils/constants.dart';

class ProgressWidget extends StatelessWidget {
  Color color;

  ProgressWidget({this.color = MAINCOLOR});

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      size: ScreenHelper.screenWidth(context, 20),
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        );
      },
    );
  }
}
