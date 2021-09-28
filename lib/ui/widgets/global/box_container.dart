import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/utils/constants.dart';

class BoxContainer extends StatefulWidget {
  String icon;
  double size;
  bool isActive;
//  Color color;
//  Color borderColor;
//  double borderwidth;
//  BoxContainer({this.icon,this.size=47, this.color,this.borderColor , this.borderwidth});
  BoxContainer({this.icon, this.size = 47, this.isActive});

  @override
  _BoxContainerState createState() => _BoxContainerState();
}

class _BoxContainerState extends State<BoxContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenHelper.screenWidth(context, widget.size),
      width: ScreenHelper.screenWidth(context, widget.size),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xff67676717),
              spreadRadius: .2,
              blurRadius: 3,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.all(
              Radius.circular(ScreenHelper.screenRadius(context, 7))),
          color: widget.isActive ? MAINCOLOR : WHITECOLOR,
          border: Border.all(
            color: !widget.isActive ? Color(0xffDCDCDC) : Colors.transparent,
            width: .5,
          )),
      child: Center(
        child: Image(
          image: AssetImage("assets/images/Category.png"),
          color: widget.isActive ? Colors.white : Color(0xffDFDFDF),
          height: ScreenHelper.screenWidth(context, widget.size - 20),
          width: ScreenHelper.screenWidth(context, widget.size - 20),
        ),
      ),
    );
  }
}
