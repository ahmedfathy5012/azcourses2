import 'package:azcourses/new_app/features/examsFeature/ui/screens/archieved_exams_screen.dart';
import 'package:azcourses/new_app/features/examsFeature/ui/widgets/main_archeived_exam_item.dart';
import 'package:azcourses/new_app/features/groupsFeature/ui/widgets/current_exams_slider.dart';
import 'package:azcourses/new_app/features/groupsFeature/ui/widgets/my_groups_slider.dart';
import 'package:azcourses/new_app/features/groupsFeature/ui/widgets/online_group.dart';
import 'package:azcourses/new_app/features/groupsFeature/ui/widgets/online_group_slider.dart';
import 'package:azcourses/new_app/ui/widget/empty_widget.dart';
import 'package:azcourses/new_app/ui/widget/profile_header.dart';
import 'package:azcourses/new_app/ui/widget/profile_row.dart';
import 'package:azcourses/ui/screens/global/change_password.dart';
import 'package:azcourses/ui/screens/global/signup_second_screen.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/ui/widgets/global/main_divider.dart';
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

import 'new_exams_screen.dart';

class ExamsScreen extends StatefulWidget {
  @override
  _ExamsScreenState createState() => _ExamsScreenState();
}

class _ExamsScreenState extends State<ExamsScreen> {

  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MAINCOLOR,
      body: Stack(
        children: [
          HeaderBackGround(),
          BackBar(
            title: "????????????????????",
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
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              ScreenHelper.screenRadius(context, 30)),
                          topRight: Radius.circular(
                              ScreenHelper.screenRadius(context, 30)))),
                    child:
                    false?
                    EmptyWidget(
                    image: 'nogroups.png',
                    title: '???? ?????????? ???? ?????????????? ??????',
                    subtitle: "???????? ???? ?????????? ???? ?????????????? ?????? ?????? ?????????????? ?????????? ?????? ?????????????????? ?? ???????????????? ????????????",
                     ):
                      ListView(
                        children: [
                          CurrentExamsSlider(),
                          MainDivider(),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context,18),
                          ),
                          MainArchievedExamItem(
                            title: '?????????? ????????????????????',
                            subtitle: '???? ???????????????????? , ???????????????????? ?????????????? , ???????????????? ?????? ??????????',
                            icons: 'arch1.png',
                            onTap: (){
                              Get.to(()=>ArchievedExamsScreen());
                            },
                          ),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context,16),
                          ),
                          MainArchievedExamItem(
                            title: '???????????????? ??????????',
                            subtitle: '???? ???????????????????? , ???????????????????? ?????????????? , ???????????????? ?????? ??????????',
                            icons: 'arch2.png',
                            onTap: (){
                              Get.to(()=>NewExamsScreen());
                            },
                          ),
                        ],
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
