import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:azcourses/helpers/screen_helper.dart';

class LoadingDialog extends StatelessWidget {
  Color color;

  LoadingDialog({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.transparent,
      child: Center(
        child: SpinKitThreeBounce(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            );
          },
          size: ScreenHelper.screenWidth(context, 40),
        ),
      ),
    );
  }
}
