import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/controller/general_courses_controller.dart';
import 'package:azcourses/bloc/controller/video_controller.dart';
import 'package:azcourses/helpers/get_services.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/global/request_center_screen.dart';
import 'package:azcourses/ui/screens/student/course_details_screen.dart';
import 'package:azcourses/ui/widgets/global/ViewAllHeader.dart';
import 'package:azcourses/ui/widgets/global/header_back_ground.dart';
import 'package:azcourses/ui/widgets/global/outer_general_course_card.dart';
import 'package:azcourses/ui/widgets/global/progress_widget.dart';
import 'package:azcourses/ui/widgets/global/rate_sheet.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/ui/widgets/global/viedoe_show_grid.dart';
import 'package:azcourses/utils/constants.dart';

class GeneralCourseScreen extends StatefulWidget {
  @override
  _GeneralCourseScreenState createState() => _GeneralCourseScreenState();
}

class _GeneralCourseScreenState extends State<GeneralCourseScreen> {
  @override
  Widget build(BuildContext context) {
    GeneralCoursesController generalCoursesController = Get.put(GeneralCoursesController());
    return Scaffold(
      backgroundColor: MAINCOLOR,
      body: Stack(
        children: [
          HeaderBackGround(),
          Column(
            children: [
              Container(
                width: double.infinity,
                height: ScreenHelper.screenHeight(context, 100),
              ),
              Expanded(
                  child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(ScreenHelper.screenRadius(context, 30)),
                        topRight: Radius.circular(
                            ScreenHelper.screenRadius(context, 30)))),
                  child: GetBuilder<GeneralCoursesController>(
                    builder: (_) =>
                    _.isLoading?
                    Center(
                      child: ProgressWidget(),
                    ):
                    _.courses.isEmpty?
                    Center(
                      child: Text(
                        "لا توجد كورسات لعرضها",
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context).textTheme.headline3.copyWith(
                            color: MAINCOLOR,
                            fontSize: ScreenHelper.screenFont(context, 20)),
                      ),
                    ):
                   Padding(
                    padding: EdgeInsets.only(
                      top: ScreenHelper.screenHeight(context, 32),
                      right: ScreenHelper.screenWidth(context, 16),
                      left: ScreenHelper.screenWidth(context, 16),
                    ),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                        childAspectRatio: .77,
                      ),
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: _.courses.length,
                      itemBuilder: (context, index) => OuterGeneralCourseCard(course:_.courses[index]),
                    ),
                ),
                  ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
