import 'package:flutter/material.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/utils/constants.dart';


class DefaultDialog extends StatefulWidget {
  String title;
  String subtitle;
  String rightButton;
  String leftButton;
  Function leftButtonTap;
  Function rightButtonTap;


  DefaultDialog({
    this.title, this.subtitle, this.rightButton, this.leftButton,
    this.leftButtonTap, this.rightButtonTap
});

  @override
  _DefaultDialogState createState() => _DefaultDialogState();
}

class _DefaultDialogState extends State<DefaultDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: ScreenHelper.screenHeight(context, 134),
        width:  ScreenHelper.screenWidth(context, 269),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(ScreenHelper.screenRadius(context, 5))),
          color: Colors.white
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
                child: Column(
                  children: [
                    SizedBox(
                      height: ScreenHelper.screenHeight(context,23),
                    ),
                    Text(
                      widget.title,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1.copyWith(
                        color: DARKBLACKCOLOR,
                        fontSize: ScreenHelper.screenFont(context, 12)
                      ),
                    ),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context,9),
                    ),
                    Text(
                      widget.subtitle,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1.copyWith(
                          color: DIALOGSUBTITLECOLOR,
                          fontSize: ScreenHelper.screenFont(context, 9)
                      ),
                    ),

                  ],
                )
            ),
            Container(
              color: DIALOGSUBTITLECOLOR,
              height: .5,
            ),
            Expanded(
              flex: 1,
              child:Row(
                textDirection: TextDirection.rtl,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: widget.rightButtonTap,
                      child: Container(
                        child: Text(
                          widget.rightButton,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline3.copyWith(
                              color: DARKBLACKCOLOR,
                              fontSize: ScreenHelper.screenFont(context, 12)
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: DIALOGSUBTITLECOLOR,
                    width: .5,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap:widget.leftButtonTap,
                      child: Container(
                        child: Text(
                          widget.leftButton,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline3.copyWith(
                              color: DARKBLACKCOLOR,
                              fontSize: ScreenHelper.screenFont(context, 12)
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
