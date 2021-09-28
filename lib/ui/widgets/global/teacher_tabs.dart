import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/controller/lecturer_info_controller.dart';
import 'package:azcourses/bloc/model/teacher.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/progress_widget.dart';
import 'package:azcourses/ui/widgets/global/teacher_info.dart';
import 'package:azcourses/ui/widgets/global/teacher_videos.dart';
import 'package:azcourses/utils/constants.dart';

import 'ask_me.dart';

class TeacherTabs extends StatefulWidget {
  int initialIndex;
  Teacher teacher;
  int lecturerId;

  TeacherTabs({this.initialIndex = 0, this.teacher,this.lecturerId});

  @override
  _TeacherTabsState createState() => _TeacherTabsState();
}

class _TeacherTabsState extends State<TeacherTabs> {
  LecturerInfoController lecturerInfoController = Get.put(LecturerInfoController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lecturerInfoController.fetchLecturerInfo(lecturerId: widget.lecturerId);
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: widget.initialIndex,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Color(0xffFDFDFD),
          appBar: TabBar(
            indicatorColor: MAINCOLOR,
            labelColor: MAINCOLOR,
            unselectedLabelColor: GREYCOLOR,
            labelStyle: Theme.of(context).textTheme.headline2.copyWith(
                  fontSize: ScreenHelper.screenFont(context, 14),
                ),
            tabs: [
              Tab(
                text: "نبذة عني",
              ),
              Tab(
                text: "الكورسات",
              ),
              Tab(
                text: "أسألني",
              ),
            ],
          ),
          body: GetBuilder<LecturerInfoController>(
            builder: (_) =>  TabBarView(
              children: [
                _.isLoading?
                    Center(
                      child: ProgressWidget(),
                    ):
                TeacherInfo(
                  lecturer: _.lecturer,
                    ),
                _.isLoading?
                Center(
                  child: ProgressWidget(),
                ):
                TeacherVideos(
                  courses: _.courses,
                    ),
                AskMe(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
