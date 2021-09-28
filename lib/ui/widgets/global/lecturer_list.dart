import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/model/lecturer.dart';
import 'package:azcourses/bloc/model/video_model.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/student/teacher_profile.dart';
import 'package:azcourses/ui/screens/student/course_details_screen.dart';
import 'package:azcourses/ui/widgets/global/course_show_card.dart';

import 'lecturer_item.dart';

class LecturerList extends StatefulWidget {
  double padding;
  List<Lecturer> lecturers;

  LecturerList({this.padding = 16, this.lecturers});

  @override
  _LecturerListState createState() => _LecturerListState();
}

class _LecturerListState extends State<LecturerList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenHelper.screenHeight(context, 240),
      child: Padding(
        padding: EdgeInsets.only(
            right: ScreenHelper.screenWidth(context, widget.padding)),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.separated(
            itemBuilder: (context, index) => GestureDetector(onTap: () {
//              Get.back();
              Get.to(TeacherProfile(), transition: Transition.cupertino);
            }, child: LayoutBuilder(builder: (context, constraints) {
              print("${constraints.maxHeight}  jjjjjjjjjj");
              return LecturerItem(
                lecturer: widget.lecturers[index],
                onTap: () {
                 Get.to(
                     TeacherProfile(
                       subject: widget.lecturers[index].subjects,
                       lecturerName: widget.lecturers[index].name,
                       lecturerImage:  widget.lecturers[index].image,
                       teacherId:  widget.lecturers[index].id,
                     ),
                     transition: Transition.cupertino);
                },
                height: constraints.maxHeight - 10,
//                videoModel: widget.videos[index],
              );
            })),
            separatorBuilder: (context, index) => SizedBox(
              width: ScreenHelper.screenWidth(context, 10),
            ),
            itemCount: widget.lecturers.length,
            // itemCount: widget.lecturers.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
