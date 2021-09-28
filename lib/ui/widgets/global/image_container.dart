import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
// Dart Packages
import 'dart:async';
// Flutter packages
// Screens
// Widgets
// Providers
// Models
// Helpers
import '../../../helpers/screen_helper.dart';




class ImageContainer extends StatelessWidget {
  double width;
  double height;
  final ImageProvider image;
  final Color imageColor;


  ImageContainer({@required this.width,@required this.height,@required this.image,this.imageColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenHelper.screenWidth(context,width),
      height: ScreenHelper.screenHeight(context,height),
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: image,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
