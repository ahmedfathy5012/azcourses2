import 'package:azcourses/ui/screens/global/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:get/get.dart';

class MasterAppBar extends StatefulWidget {
  Function onMenuTap;
  Function onNotifyTap;
  bool isNotifyOn;
  String title;
  MasterAppBar({this.onMenuTap, this.title,this.isNotifyOn=false,this.onNotifyTap});

  @override
  _MasterAppBarState createState() => _MasterAppBarState();
}

class _MasterAppBarState extends State<MasterAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenHelper.screenHeight(context, 70),
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenHelper.screenWidth(context, 18)),
        child: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: widget.onMenuTap,
              child:  Container(
                height: ScreenHelper.screenHeight(context,30),
                width:  ScreenHelper.screenWidth(context,35),
                // color: Colors.red,
                child: Center(
                  child: Image.asset(
                    "assets/icons/menu.png",
                    height: ScreenHelper.screenHeight(context,15),
                  ),
                ),
              )
            ),
            Text(
              widget.title ?? " ",
              style: Theme.of(context).textTheme.headline3.copyWith(
                  color: Colors.white,
                  fontSize: ScreenHelper.screenFont(context, 18)),
            ),
            InkWell(
                onTap: (){
                  Get.to(
                    NotificationScreen(),
                    duration: Duration(milliseconds: 150),
                    transition: Transition.downToUp
                  );
                },
                child:  Container(
                  height: ScreenHelper.screenHeight(context,30),
                  width:  ScreenHelper.screenWidth(context,35),
                  // color: Colors.red,
                  child: Center(
                    child: Image.asset(
                      "assets/reicons/notifyon.png",
                      height: ScreenHelper.screenHeight(context,25),
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
