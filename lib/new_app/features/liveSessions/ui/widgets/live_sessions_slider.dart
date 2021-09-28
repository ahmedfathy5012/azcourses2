import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/new_app/features/liveSessions/bloc/controller/my_live_lessons_controller.dart';
import 'package:azcourses/new_app/features/liveSessions/ui/widgets/live_session.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class LiveSessionsSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyLiveLessonsController _liveLessonsController = Get.put(MyLiveLessonsController());
    return  Padding(
      padding:  EdgeInsets.symmetric(
        vertical: ScreenHelper.screenHeight(context,0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(
                horizontal: ScreenHelper.screenWidth(context,16)
            ),
            child: CustomText(
              text: 'مواعيد البث المباشر',
              color: MAINBlack,
              fontW: FW.semibold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: ScreenHelper.screenHeight(context,16),
          ),
          GetBuilder<MyLiveLessonsController>(
            builder: (_) =>
                _.isLoading?
                    SizedBox(height: 0,):
                ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context,16)),
                child: LiveSession(
                  liveLesson: _.lessons[index],
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(height: ScreenHelper.screenWidth(context,16),),
              itemCount: _.lessons.length,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
