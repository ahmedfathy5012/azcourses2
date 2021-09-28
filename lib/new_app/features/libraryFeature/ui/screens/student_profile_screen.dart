import 'package:azcourses/new_app/features/examsFeature/ui/screens/question_explanation_sheet.dart';
import 'package:azcourses/new_app/features/examsFeature/ui/widgets/show_explanation_dialog.dart';
import 'package:azcourses/new_app/features/groupsFeature/ui/widgets/current_exams_slider.dart';
import 'package:azcourses/new_app/features/groupsFeature/ui/widgets/my_groups_slider.dart';
import 'package:azcourses/new_app/features/groupsFeature/ui/widgets/online_group.dart';
import 'package:azcourses/new_app/features/groupsFeature/ui/widgets/online_group_slider.dart';
import 'package:azcourses/new_app/features/libraryFeature/ui/widgets/download_paper_dialog.dart';
import 'package:azcourses/new_app/features/libraryFeature/ui/widgets/subjects_sheet.dart';
import 'package:azcourses/new_app/ui/widget/empty_widget.dart';
import 'package:azcourses/new_app/ui/widget/profile_header.dart';
import 'package:azcourses/new_app/ui/widget/profile_row.dart';
import 'package:azcourses/ui/screens/global/change_password.dart';
import 'package:azcourses/ui/screens/global/signup_second_screen.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/ui/widgets/global/main_divider.dart';
import 'package:azcourses/utils/image_network.dart';
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



class LibraryScreen extends StatelessWidget{

  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MAINCOLOR,
      body: Stack(
        children: [
          HeaderBackGround(),
          BackBar(
            title: "مكتبتي",
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
                    image: 'nopaper.png',
                    title: 'لا يوجد مذكرات في مكتبتك',
                    subtitle: "لا يوجد مذكرات محفوظة , قم بحفظ البعض و تحمليه او مشاركته",
                  ):
                  Padding(
                    padding:  EdgeInsets.only(
                      top:   ScreenHelper.screenHeight(context,17),
                      left:  ScreenHelper.screenWidth(context,16),
                      right: ScreenHelper.screenWidth(context,16),
                    ),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: ScreenHelper.screenWidth(context, 17),
                      mainAxisSpacing: ScreenHelper.screenHeight(context, 17),
                      childAspectRatio: 0.7803030303030303
                      ),
                        itemBuilder: (context, index) => Stack(
                          children: [
                            Container(
                              color: Color(0xffE7E7E7),
                              child: ImageNetwork(
                                url: 'https://images.pexels.com/photos/4090327/pexels-photo-4090327.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                height: double.infinity,
                                width: double.infinity,
                                placeholder: 'pdfi.png',
                                placeholderHeight: 34,
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.symmetric(
                                vertical: ScreenHelper.screenHeight(context,4)
                              ),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: ScreenHelper.screenWidth(context, 95),
                                  height: ScreenHelper.screenHeight(context,27),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context,5 ))
                                   ,color: Colors.white
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      text: 'بارت 1 طرق',
                                      color: MAINBlack2,
                                      fontW: FW.semibold,
                                      fontSize: 9,
                                      overflow: true,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.all(ScreenHelper.screenHeight(context,8)),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: (){
                                    Get.dialog(
                                        Center(child:
                                        DownloadPaperDialog()
                                        // ShowExplanationDialog(),
                                        ),
                                    );
                                    // Get.bottomSheet(
                                    //     // SubjectsSheet(),
                                    //     QuestionExplanationSheet(),
                                    //     isScrollControlled: true
                                    // );
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: ScreenHelper.screenHeight(context,9),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/icons/download.png',
                                        height: ScreenHelper.screenHeight(context,9.5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        shrinkWrap: true,
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
