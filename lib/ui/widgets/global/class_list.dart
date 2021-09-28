import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/model/class_model.dart';
import 'package:azcourses/bloc/model/course.dart';
import 'package:azcourses/bloc/model/video_model.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/student/class_screen.dart';
import 'package:azcourses/ui/screens/student/course_details_screen.dart';
import 'package:azcourses/ui/widgets/global/course_show_card.dart';

import 'class_item.dart';
import 'lecturer_item.dart';

class ClassList extends StatefulWidget {
  double padding;
  List<ClassModel> classes;
  Course course;
  final bool isInit;
  final int classIndex;

  ClassList({this.padding = 16, this.classes,this.course,this.isInit=true,this.classIndex=0});

  @override
  _ClassListState createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenHelper.screenHeight(context, 245),
      child: Padding(
        padding: EdgeInsets.only(
            right: ScreenHelper.screenWidth(context, widget.padding)),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.separated(
            itemBuilder: (context, index) =>
                index<widget.classIndex?
                    SizedBox(width: 0,):
                LayoutBuilder(builder: (context, constraints) {
              return ClassItem(
                classModel: widget.classes[index],
                onTap: widget.isInit? () {
                  Get.to(
                      ClassScreen(
                        classModel: widget.classes[index],
                        course: widget.course,
                        classModels: widget.classes,
                        classIndex: index,
                          ),
                      transition: Transition.cupertino);
                }:(){
                  Get.back();
                  Get.to(
                      ClassScreen(
                        classModel: widget.classes[index],
                        course: widget.course,
                        classModels: widget.classes,
                        classIndex: index,
                      ),
                      transition: Transition.cupertino);
                },
                height: constraints.maxHeight - 10,
              );
            }),
            separatorBuilder: (context, index) => SizedBox(
              width: ScreenHelper.screenWidth(context, 10),
            ),
            itemCount: widget.classes.length,
//            itemCount: widget.videos.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
