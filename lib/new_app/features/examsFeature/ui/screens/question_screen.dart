import 'package:azcourses/new_app/features/examsFeature/ui/screens/exam_result_screen.dart';
import 'package:azcourses/new_app/features/examsFeature/ui/widgets/question_item.dart';
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

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MAINCOLOR,
      body: Stack(
        children: [
          HeaderBackGround(),
          Column(
            children: [
              BackBar(
                title: "أختبار",
              ),
              Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: ScreenHelper.screenWidth(context,16)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: ScreenHelper.screenHeight(context,32),
                      width: ScreenHelper.screenWidth(context,53),
                      decoration: BoxDecoration(
                        color: Color(0xff79ABCC),
                        borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context,7))
                      ),
                      child: Center(
                        child: CustomText(
                          text: '5:00',
                          fontW: FW.semibold,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: ScreenHelper.screenWidth(context,180),
                          height: ScreenHelper.screenHeight(context,4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context,2)),
                            color: Color(0xff3F7095)
                          ),
                        ),
                        Container(
                          width:  ScreenHelper.screenWidth(context,50),
                          height: ScreenHelper.screenHeight(context,4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context,2)),
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: ScreenHelper.screenWidth(context,53),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                  width: double.infinity,
                  height: ScreenHelper.screenHeight(context, 150)
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
                    child: Stack(
                      children: [
                        QuestionItem(),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child:
                          false?
                          UsedButton(
                            onTap: (){
                              // TODO Skip This Question
                              print("this question has been skipped successfully");
                            },
                            title: 'تخطي السؤال',
                            textColor: MAINCOLOR,
                            buttonColor: Colors.transparent,
                            widthFraction: 343,
                          ): Padding(
                            padding:  EdgeInsets.symmetric(
                              vertical: ScreenHelper.screenHeight(context,16)
                            ),
                            child: UsedButton(
                              onTap: (){
                                print("this question has been skipped successfully");
                                Get.to(()=>ExamResultScreen());
                                },
                              title: 'التالي',
                              widthFraction: 343,
                            ),
                          )
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
