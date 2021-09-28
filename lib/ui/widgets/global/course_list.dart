import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/model/course.dart';
import 'package:azcourses/bloc/model/video_model.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/student/course_details_screen.dart';
import 'package:azcourses/ui/widgets/global/course_show_card.dart';

class CourseList extends StatefulWidget {
  double padding;
  List<Course> courses;
  int classIndex;
  CourseList({this.padding = 16, this.courses,this.classIndex=0});

  @override
  _CourseListState createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenHelper.screenHeight(context, 325),
      child: Padding(
        padding: EdgeInsets.only(
            right: ScreenHelper.screenWidth(context, widget.padding)),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.separated(
            itemBuilder: (context, index) => index<widget.classIndex?
            SizedBox(width: 0,):
            LayoutBuilder(builder: (context, constraints) {
              return CourseShowCart(
                course: widget.courses[index],
                isHome: true,
                onTap: () {
                  print("to course screen >>");
                  Get.to(
                      CourseDetailsScreen(
                          course: widget.courses[index],
                          ),
                      transition: Transition.cupertino);
                },
                height: constraints.maxHeight - 10,
//                videoModel: widget.videos[index],
              );
            }),
            separatorBuilder: (context, index) => SizedBox(
              width: ScreenHelper.screenWidth(context, 10),
            ),
            itemCount: widget.courses.length,
//            itemCount: widget.videos.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
