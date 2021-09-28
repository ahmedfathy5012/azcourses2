import 'package:azcourses/bloc/model/notification_model.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  NotificationModel notificationModel;

  NotificationItem({this.notificationModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: ScreenHelper.screenHeight(context, 40),
            height:  ScreenHelper.screenHeight(context, 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context,30)),
              color: Color(0xff4D78FF)
            ),
            child: Center(
              child: ImageIcon(
                AssetImage("assets/reicons/notification.png"),
                color: Colors.white,
                size: ScreenHelper.screenHeight(context,20),
              ),
            ),
          ),
          SizedBox(
            width: ScreenHelper.screenWidth(context,15),
          ),
          Column(
            children: [
              Container(
                width: ScreenHelper.screenWidth(context,250),
                child: Text(
                  // "هذا مثال لاشعار جديد",
                  notificationModel.title,
                  style: Theme.of(context).textTheme.headline2.copyWith(
                      fontSize: ScreenHelper.screenFont(context, 20),
                      color: Color(0xff2C2828)
                  ),
                ),
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 3),
              ),
              Container(
                width: ScreenHelper.screenWidth(context,250),
                child: Text(
                  // "هذا مثال لاشعار جديد",
                  notificationModel.subtitle,
                  style: Theme.of(context).textTheme.headline2.copyWith(
                      fontSize: ScreenHelper.screenFont(context, 17),
                      color: Color(0xff9898AE)
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
