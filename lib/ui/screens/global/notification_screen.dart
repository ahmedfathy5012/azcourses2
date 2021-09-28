import 'package:azcourses/bloc/controller/notifications_controller.dart';
import 'package:azcourses/ui/screens/global/change_password.dart';
import 'package:azcourses/ui/screens/global/signup_second_screen.dart';
import 'package:azcourses/ui/widgets/global/loading_dialog.dart';
import 'package:azcourses/ui/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/controller/video_controller.dart';
import 'package:azcourses/helpers/get_services.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/global/request_center_screen.dart';
import 'package:azcourses/ui/screens/student/course_details_screen.dart';
import 'package:azcourses/ui/widgets/global/ViewAllHeader.dart';
import 'package:azcourses/ui/widgets/global/back_bar.dart';
import 'package:azcourses/ui/widgets/global/header_back_ground.dart';
import 'package:azcourses/ui/widgets/global/progress_widget.dart';
import 'package:azcourses/ui/widgets/global/rate_sheet.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/ui/widgets/global/viedoe_show_grid.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:get_storage/get_storage.dart';


class NotificationScreen extends StatelessWidget {
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    NotificationsController _notificationController = Get.put(NotificationsController());
    return Scaffold(
      backgroundColor: MAINCOLOR,
      body: Stack(
        children: [
          HeaderBackGround(),
          BackBar(
            title: "الاشعارات",
          ),
          Column(
            children: [
              Container(
                  width: double.infinity,
                  height: ScreenHelper.screenHeight(context, 100)
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              ScreenHelper.screenRadius(context, 30)),
                          topRight: Radius.circular(
                              ScreenHelper.screenRadius(context, 30)))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenHelper.screenWidth(context, 22),
                        vertical: ScreenHelper.screenHeight(context,22)
                    ),
                    child: GetBuilder<NotificationsController>(
                      builder: (_) =>
                          _.isLoading?
                              Center(
                                child: ProgressWidget(),
                              ):
                          ListView.separated(
                          itemBuilder: (context, index) => NotificationItem(notificationModel: _.notifications[index],),
                          separatorBuilder: (context, index) => SizedBox(height: ScreenHelper.screenHeight(context,20),),
                          itemCount: _.notifications.length,
                          shrinkWrap: true,
                      ),
                    )
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
