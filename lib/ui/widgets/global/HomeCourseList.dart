import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/model/course.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/student/all_courses.dart';
import 'package:azcourses/ui/widgets/global/course_list.dart';
import 'package:azcourses/ui/widgets/global/view_all.dart';
import 'package:azcourses/utils/constants.dart';

class HomeCourseList extends StatelessWidget {
  List<Course> courses;
  int tabIndex;
  String viewAllTitle;
  int isRecently;
  int subjectId;
  HomeCourseList({this.courses,this.tabIndex,this.viewAllTitle,this.isRecently=0,this.subjectId});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ViewAll(
          title: viewAllTitle,
          onNavigateTap: () {
            Get.to(
                AllCoursesScreen(
                  subjectId: subjectId,
                  isRecently: isRecently,
                  title: viewAllTitle,
                ),
                transition: Transition.cupertino);
          },
        ),
        SizedBox(
          height: ScreenHelper.screenHeight(context, 15),
        ),
        courses.isEmpty?
            Center(
              child: Text("لا توجد كورسات لعرضها",
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.headline1.copyWith(
                    fontSize: ScreenHelper.screenFont(context, 13),
                    color: MAINCOLOR
                ),),
            ):
        CourseList(
          courses:courses,
        ),
      ],
    );
  }
}
