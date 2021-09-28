import 'package:azcourses/ui/screens/student/general_course_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/controller/general_courses_controller.dart';
import 'package:azcourses/bloc/controller/inner_general_controller.dart';
import 'package:azcourses/bloc/controller/video_controller.dart';
import 'package:azcourses/helpers/get_services.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/global/request_center_screen.dart';
import 'package:azcourses/ui/screens/student/course_details_screen.dart';
import 'package:azcourses/ui/widgets/global/ViewAllHeader.dart';
import 'package:azcourses/ui/widgets/global/back_bar.dart';
import 'package:azcourses/ui/widgets/global/outer_general_course_card.dart';
import 'package:azcourses/ui/widgets/global/progress_widget.dart';
import 'package:azcourses/ui/widgets/global/rate_sheet.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/ui/widgets/global/tab_general_row.dart';
import 'package:azcourses/ui/widgets/global/tab_row.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/ui/widgets/global/viedoe_general_card.dart';
import 'package:azcourses/ui/widgets/global/course_show_card.dart';
import 'package:azcourses/ui/widgets/global/viedoe_show_grid.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:azcourses/ui/widgets/global/header_back_ground.dart';

class InnerGeneralCourseScreen extends StatefulWidget {
  int generalId;
  String title;
  InnerGeneralCourseScreen({
    this.generalId,
    this.title
});

  @override
  _InnerGeneralCourseScreenState createState() =>
      _InnerGeneralCourseScreenState();
}

class _InnerGeneralCourseScreenState extends State<InnerGeneralCourseScreen> {
  InnerGeneralController _generalCoursesController = Get.put(InnerGeneralController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("my data issssssssssssssssssssss ${widget.generalId}");
    _generalCoursesController.fetchGenralCourses(id: widget.generalId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MAINCOLOR,
      body: Stack(
        children: [
          HeaderBackGround(),
          BackBar(
            title: widget.title??"الكورسات العامة",
          ),
          GetBuilder<InnerGeneralController>(
            builder: (_) =>
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: ScreenHelper.screenHeight(context, 150),
                    ),
                    Container(
                        width: double.infinity,
                        height: ScreenHelper.screenHeight(context, 662),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                    ScreenHelper.screenRadius(context, 30)),
                                topRight: Radius.circular(
                                    ScreenHelper.screenRadius(context, 30)))),
                        child:
                        _.isLoading?
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(child: ProgressWidget()),
                          ],
                        ):
                        _.categories.isEmpty?
                        Center(
                          child: Text(
                            "لا توجد كورسات لعرضها",
                            textDirection: TextDirection.rtl,
                            style: Theme.of(context).textTheme.headline3.copyWith(
                                color: MAINCOLOR,
                                fontSize: ScreenHelper.screenFont(context, 20)),
                          ),
                        ):
                        Column(
                          children: [
                            SizedBox(
                              height: ScreenHelper.screenHeight(context, 55),
                            ),
                            Container(
                              height: ScreenHelper.screenHeight(context, 45),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: ScreenHelper.screenWidth(context, 16)),
                                child: TabGeneralRow(
                                  categories: _.categories
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: ScreenHelper.screenHeight(context, 20),
                                  right: ScreenHelper.screenWidth(context, 16),
                                  left: ScreenHelper.screenWidth(context, 16),
                                ),
                                child: GridView.builder(
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 5.0,
                                    mainAxisSpacing: 5.0,
                                    childAspectRatio: .85,
                                  ),
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  itemCount: _.categories[_.tabIndex].generalCourses.length,
                                  itemBuilder: (context, index) => LayoutBuilder(
                                      builder: (context, constraints) =>
                                          GestureDetector(
                                            onTap: (){
                                              Get.to(
                                               GeneralCourseDetailsScreen(
                                                 course: _.categories[_.tabIndex].generalCourses[index],
                                                 courseIntro: _.categories[_.tabIndex].generalCourses[index].intro,
                                               ),
                                               duration: Duration(milliseconds: 150),
                                               transition: Transition.leftToRight
                                              );
                                            },
                                            child: VideoGeneralCart(
                                              course: _.categories[_.tabIndex].generalCourses[index],
                                              height: constraints.maxHeight,
                                              width: constraints.maxWidth,
                                            ),
                                          )),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
          ),
          // Column(
          //   children: [
          //     SizedBox(height: ScreenHelper.screenHeight(context, 120)),
          //     Center(
          //       child: Container(
          //         width: ScreenHelper.screenWidth(context, 335),
          //         height: ScreenHelper.screenHeight(context, 70),
          //         decoration: BoxDecoration(
          //             boxShadow: [
          //               BoxShadow(
          //                 color: Color(0xff67676717),
          //                 spreadRadius: .5,
          //                 blurRadius: 7,
          //                 offset: Offset(0, 3), // changes position of shadow
          //               ),
          //             ],
          //             color: Colors.white,
          //             borderRadius: BorderRadius.all(Radius.circular(
          //                 ScreenHelper.screenRadius(context, 10)))),
          //         child: Padding(
          //           padding: EdgeInsets.only(
          //             right: ScreenHelper.screenWidth(context, 17),
          //             left: ScreenHelper.screenWidth(context, 10),
          //           ),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text(
          //                 "ابحث عن كورس معين",
          //                 textDirection: TextDirection.rtl,
          //                 textAlign: TextAlign.center,
          //                 style: Theme.of(context).textTheme.headline2.copyWith(
          //                     fontSize: ScreenHelper.screenFont(context, 14),
          //                     color: DARKCOLOR),
          //               ),
          //               Container(
          //                 height: ScreenHelper.screenWidth(context, 42),
          //                 width: ScreenHelper.screenWidth(context, 42),
          //                 child: Center(
          //                   child: Icon(
          //                     Icons.search,
          //                     color: Colors.white,
          //                   ),
          //                 ),
          //                 decoration: BoxDecoration(
          //                     color: SECONDERYCOLOR,
          //                     borderRadius: BorderRadius.all(Radius.circular(
          //                         ScreenHelper.screenRadius(context, 10)))),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
