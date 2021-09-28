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




class SquareImageContainer extends StatelessWidget {
  final size;
  final ImageProvider image;
  final Color imageColor;


  SquareImageContainer({@required this.size,@required this.image,this.imageColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenHelper.screenWidth(context,size),
      height: ScreenHelper.screenWidth(context,size),
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
