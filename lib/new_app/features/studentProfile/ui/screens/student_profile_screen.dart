import 'package:azcourses/new_app/features/discussionsFeature/ui/screens/discussion_screen.dart';
import 'package:azcourses/new_app/features/examsFeature/ui/screens/exams_screen.dart';
import 'package:azcourses/new_app/features/groupsFeature/ui/screens/groups_screen.dart';
import 'package:azcourses/new_app/features/libraryFeature/ui/screens/student_profile_screen.dart';
import 'package:azcourses/new_app/features/libraryFeature/ui/widgets/subjects_sheet.dart';
import 'package:azcourses/new_app/features/liveSessions/ui/screens/live_sessions_screen.dart';
import 'package:azcourses/new_app/ui/widget/profile_header.dart';
import 'package:azcourses/new_app/ui/widget/profile_row.dart';
import 'package:azcourses/ui/screens/global/change_password.dart';
import 'package:azcourses/ui/screens/global/signup_second_screen.dart';
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

class StudentProfileScreen extends StatefulWidget {
  @override
  _StudentProfileScreenState createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {

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
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              ScreenHelper.screenRadius(context, 30)),
                          topRight: Radius.circular(
                              ScreenHelper.screenRadius(context, 30)))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: ScreenHelper.screenHeight(context,17),
                      ),
                      ProfileHeader(),
                      SizedBox(
                        height: ScreenHelper.screenHeight(context,30),
                      ),
                      ProfileRow(
                        title: 'نقاشات عامة',
                        onTap: (){
                          print("نقاشات عامة'");
                          Get.to(()=>DiscussionsScreen());
                        },
                      ),
                      Divider(),
                      ProfileRow(
                        title: 'المجموعات',
                        onTap: (){
                          print("المجموعات");
                          Get.to(()=>GroupsScreen());
                        },
                      ),
                      Divider(),
                      ProfileRow(
                        title: 'حصص البث المباشر',
                        onTap: (){
                          print("حصص البث المباشر");
                          Get.to(()=>LiveSessionsScreen());
                        },
                      ),
                      Divider(),
                      ProfileRow(
                        title: 'الأمتحانات',
                        onTap: (){
                          print("الأمتحانات");
                          Get.to(()=>ExamsScreen());
                        },
                      ),
                      Divider(),
                      ProfileRow(
                        title: 'اسأل مدرسك',
                        onTap: (){
                          print("اسأل مدرسك");
                        },
                      ),
                      Divider(),
                      ProfileRow(
                        title: 'مكتبتي',
                        onTap: (){
                          print("مكتبتي");
                          Get.bottomSheet(
                            SubjectsSheet(
                              onTap: (id){
                                Get.back();
                                print('my id is ${id}');
                                Get.to((int id)=>LibraryScreen()
                                );
                              },
                            ),
                            isScrollControlled: true
                          );
                        },
                      ),

                    ],
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
