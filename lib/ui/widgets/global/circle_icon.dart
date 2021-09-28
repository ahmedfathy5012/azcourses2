import 'package:flutter/material.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';

class CirlceIcon extends StatefulWidget {
  Function onTap;
  String stringIcon;
  IconData icon;
  double size;
  Color iconColor;
  Color buttonColor;
  CirlceIcon(
      {this.iconColor = null,
      this.buttonColor = null,
      this.onTap,
      this.stringIcon = null,
      this.icon = null,
      this.size = 41});

  @override
  _CirlceIconState createState() => _CirlceIconState();
}

class _CirlceIconState extends State<CirlceIcon> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: ScreenHelper.screenWidth(context, widget.size),
        height: ScreenHelper.screenWidth(context, widget.size),
        decoration: BoxDecoration(
            color: widget.buttonColor == null
                ? Colors.grey.withOpacity(.5)
                : widget.buttonColor,
            borderRadius: BorderRadius.all(Radius.circular(
                ScreenHelper.screenRadius(context, widget.size / 2)))),
        child: widget.icon != null
            ? Icon(
                widget.icon,
                color: widget.buttonColor == null
                    ? Colors.white
                    : widget.iconColor,
                size: ScreenHelper.screenWidth(context, widget.size / 2),
              )
            : SquareImageContainer(
                size: ScreenHelper.screenWidth(context, widget.size / 2),
                image: AssetImage(widget.stringIcon),
              ),
      ),
    );
  }
}
