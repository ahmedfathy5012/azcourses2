import 'package:azcourses/new_app/features/discussionsFeature/ui/screens/discussion_screen.dart';
import 'package:azcourses/new_app/features/examsFeature/ui/screens/build_custom_exam.dart';
import 'package:azcourses/new_app/features/examsFeature/ui/screens/exams_screen.dart';
import 'package:azcourses/new_app/features/examsFeature/ui/screens/question_bank_screen.dart';
import 'package:azcourses/new_app/features/groupsFeature/ui/screens/groups_screen.dart';
import 'package:azcourses/new_app/features/libraryFeature/ui/screens/library_screen.dart';
import 'package:azcourses/new_app/features/libraryFeature/ui/widgets/subject_grid.dart';
import 'package:azcourses/new_app/features/libraryFeature/ui/widgets/subjects_sheet.dart';
import 'package:azcourses/new_app/features/liveSessions/ui/screens/live_sessions_screen.dart';
import 'package:azcourses/new_app/ui/widget/profile_header.dart';
import 'package:azcourses/new_app/ui/widget/profile_row.dart';
import 'package:azcourses/ui/screens/global/change_password.dart';
import 'package:azcourses/ui/screens/global/signup_second_screen.dart';
import 'package:azcourses/ui/widgets/customText.dart';
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


class MainBank extends StatelessWidget {

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
                    child: Padding(
                      padding:  EdgeInsets.symmetric(
                          horizontal: ScreenHelper.screenWidth(context,16)
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 16),
                          ),
                          Row(
                            children: [
                              CustomText(
                                text: 'أختار المادة',
                                color: MAINBlack2,
                                fontSize: 16,
                                fontW: FW.semibold,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 16),
                          ),
                          Container(
                            height: ScreenHelper.screenHeight(context,370),
                            width:  double.infinity,
                            child:  SubjectGrid(
                              onTap: (int id){
                                Get.to(()=>QuestionBankScreenState());
                              },
                            ),
                          ),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 32),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width:ScreenHelper.screenWidth(context, 150),
                                  child: Divider(
                                    height: 2,
                                  )
                              ),
                              CustomText(
                                text: 'او',
                                fontW: FW.light,
                                fontSize: 12,
                                color: Color(0xffA7A7A7),
                              ),
                              SizedBox(
                                  width:ScreenHelper.screenWidth(context, 150),
                                  child: Divider(
                                    height: 2,
                                  )
                              ),
                            ],
                          ),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 32),
                          ),
                          UsedButton(
                            onTap: (){
                              Get.dialog(
                                SubjectsSheet(
                                  onTap: (){
                                    Get.to(()=>BuildCustomExam());
                                  },
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/examyou.png',
                                  height: ScreenHelper.screenHeight(context,19),
                                ),
                                SizedBox(
                                  width: ScreenHelper.screenWidth(context,3),
                                ),
                                CustomText(
                                  text: 'أختبر نفسك',
                                  fontSize: 16,
                                  fontW: FW.semibold,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
