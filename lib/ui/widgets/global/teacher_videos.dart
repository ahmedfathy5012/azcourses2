import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/model/course.dart';
import 'package:azcourses/bloc/model/teacher.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/course_show_card.dart';
import 'package:azcourses/ui/widgets/global/viedoe_show_grid.dart';

import '../../screens/student/course_details_screen.dart';

class TeacherVideos extends StatelessWidget {
  List<Course> courses;

  TeacherVideos({this.courses});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: ScreenHelper.screenWidth(context, 16),
        right: ScreenHelper.screenWidth(context, 16),
        top: ScreenHelper.screenHeight(context, 27),
      ),
      child: GridView.builder(
//        itemCount: teacher.videos.length,
        itemCount: courses.length,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .89,
            mainAxisSpacing: ScreenHelper.screenWidth(context, 21),
            crossAxisSpacing: ScreenHelper.screenHeight(context, 21)),
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Get.to(
                  CourseDetailsScreen(
                  course: courses[index],
                      ),
                  transition: Transition.cupertino);
            },
            child: LayoutBuilder(
                builder: (context, constraints) => CourseShowCart(
                  course: courses[index],
                      onTap: () {
                        print("to course screen >>");
                        Get.to(
                          CourseDetailsScreen(
                              course: courses[index],
                              ),
                          transition: Transition.cupertino,
                        );
                      },
                      height: constraints.maxHeight - 25,
//                videoModel: widget.videos[index],
                    )
//                  VideoShowGrid(
//                onTap: () {
//                  Get.to(
//                      VideoDetailsScreen(
////                        videoModel: teacher.videos[index],
//                          ),
//                      transition: Transition.cupertino);
//                },
//                height: constraints.maxHeight - 10,
//                width: constraints.maxWidth - 5,
////                videoModel: teacher.videos[index],
//              ),
                )),
      ),
    );
  }
}
