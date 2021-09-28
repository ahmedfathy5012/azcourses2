import 'package:flutter/material.dart';
import 'package:azcourses/helpers/screen_helper.dart';


class PlayIcon extends StatefulWidget {
  Function onTap;

  PlayIcon({this.onTap});

  @override
  _PlayIconState createState() => _PlayIconState();
}

class _PlayIconState extends State<PlayIcon> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width:  ScreenHelper.screenWidth(context, 44),
        height: ScreenHelper.screenWidth(context, 44),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.6),
          borderRadius: BorderRadius.all(Radius.circular(ScreenHelper.screenRadius(context,25)))
        ),
        child: Icon(Icons.play_arrow,color: Colors.white),
      ),
    );
  }
}
