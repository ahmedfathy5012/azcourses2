import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/model/lecturer.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/student/all_lecturer.dart';
import 'package:azcourses/ui/widgets/global/lecturer_list.dart';
import 'package:azcourses/ui/widgets/global/view_all.dart';
import 'package:azcourses/utils/constants.dart';

class LecturerHomeList extends StatelessWidget {
  List<Lecturer> lecturers;
  int tabIndex;
  int subjectId;

  LecturerHomeList({this.lecturers,this.tabIndex,this.subjectId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ViewAll(
          title: "المدرسين",
          onNavigateTap: () {
            Get.to(
                AllLecturerScreen(
                  subjectId: subjectId,
                ),
                transition: Transition.cupertino);
          },
        ),
        SizedBox(
          height: ScreenHelper.screenHeight(context, 15),
        ),
        lecturers.isEmpty?
        Center(
          child: Text("لا يوجد مدرسين لعرضهم",
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.headline1.copyWith(
                fontSize: ScreenHelper.screenFont(context, 13),
                color: MAINCOLOR
            ),),
        ):
        LecturerList(
          lecturers: lecturers,
        )

      ],
    );
  }
}
