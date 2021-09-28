import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:azcourses/helpers/screen_helper.dart';


class CarsoulItem extends StatelessWidget {
  String image;
  bool active;


  CarsoulItem({this.image, this.active=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: ScreenHelper.screenHeight(context, 308),
      width: ScreenHelper.screenWidth(context, 217),
      decoration: BoxDecoration(
        color: Color(0xffF4F4F4),
        borderRadius: BorderRadius.all(Radius.circular(ScreenHelper.screenRadius(context, 10)))
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => Container(

          clipBehavior: Clip.hardEdge,
           decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage(image),
             )
           ),
        ),
      ),

    );
  }
}
