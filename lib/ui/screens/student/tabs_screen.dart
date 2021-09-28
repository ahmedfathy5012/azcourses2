import 'package:azcourses/new_app/features/examsFeature/ui/screens/main_bank.dart';
import 'package:azcourses/new_app/features/studentProfile/ui/screens/student_profile_screen.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/ui/widgets/success_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:polygon_clipper/polygon_border.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:azcourses/bloc/controller/home_controller.dart';
import 'package:azcourses/bloc/controller/menu_controller.dart';
import 'package:azcourses/bloc/controller/video_controller.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:polygon_clipper/polygon_clipper.dart';
import 'package:azcourses/ui/screens/global/welcome_screen.dart';
import 'package:azcourses/ui/screens/student/home_screen.dart';
import 'package:azcourses/ui/screens/student/point_screen.dart';
import 'package:azcourses/ui/widgets/global/master_app_ber.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/utils/constants.dart';
import '../global/soon_screen.dart';

import '../test_screen.dart';
import 'add_center_screen.dart';
import 'general_course_screen.dart';
import 'home_screen.dart';
import 'point_screen.dart';

List<String> barTitels = [" ", "الكورسات العامة", "بنك الأسئلة", "نقاطي", "الملف الشخصي"];

class TabsScreen extends StatefulWidget {
  Function onMenuTap;
  int homeIndex;

  TabsScreen({this.onMenuTap, this.homeIndex = 0});

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  PageStorageBucket bucket = PageStorageBucket();
  Widget currentPage = HomeScreen();
  HomeController homeController = Get.put(HomeController());
  VideoController videoController = Get.put(VideoController());
  MenuController menuController = Get.put(MenuController());
  int currentTap = 0;
  GetStorage box = GetStorage();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentTap = widget.homeIndex;
  }

  @override
  Widget build(BuildContext context) {
    // //
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.circular(ScreenHelper.screenRadius(context, 10))),
      ),
      child: SafeArea(
        child: GetBuilder<MenuController>(
          builder: (_) => Scaffold(
            body: PageStorage(
              bucket: bucket,
              child: Stack(
                children: [
                  currentPage,
                  Align(
                    alignment: Alignment.topCenter,
                    child: MasterAppBar(
                      onMenuTap: widget.onMenuTap,
                      title: barTitels[currentTap],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              height: ScreenHelper.screenHeight(context, 80),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff67676717),
                      spreadRadius: .5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.circular(ScreenHelper.screenRadius(context, 18)),
                    topRight:
                        Radius.circular(ScreenHelper.screenRadius(context, 18)),
                  )),
              child: Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentPage = HomeScreen();
                        currentTap = 0;
                      });
                    },
                    child: Container(
                      width: ScreenHelper.screenWidth(context, 75),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: ScreenHelper.screenHeight(context, 20),
                            ),
                            Image(
                              image: AssetImage(currentTap == 0
                                  ? "assets/reicons/Home.png"
                                  : "assets/reicons/Home2.png"),
                              // color: widget.homeIndex == 0
                              //     ? MAINCOLOR
                              //     : DISABLENAVBARCOLOR,
                              height: ScreenHelper.screenHeight(context, 28),
                              width: ScreenHelper.screenHeight(context, 28),
                            ),
                            SizedBox(
                              height: ScreenHelper.screenHeight(context, 7),
                            ),
                            Container(
                              width: ScreenHelper.screenWidth(context, 75),
                              child: Center(
                                child: CustomText(
                                  text: 'الرئيسية',
                                  overflow: true,
                                  fontW: currentTap == 0 ?FW.bold:FW.semibold,
                                  color: currentTap == 0 ?MAINCOLOR:LIGHTGREYCOLOR,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentPage = GeneralCourseScreen();
                        currentTap = 1;
                      });
                    },
                    child: Container(
                      width: ScreenHelper.screenWidth(context, 75),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: ScreenHelper.screenHeight(context, 20),
                            ),
                            Image(
                              image:AssetImage(currentTap == 1
                                  ? "assets/reicons/blue.png"
                                  : "assets/reicons/Work.png"),
                              height: ScreenHelper.screenHeight(context, 28),
                              width: ScreenHelper.screenHeight(context, 28),
                            ),
                            SizedBox(
                              height: ScreenHelper.screenHeight(context, 7),
                            ),
                            Container(
                              width: ScreenHelper.screenWidth(context, 75),
                              child: Center(
                                child: CustomText(
                                  text: 'الكورسات',
                                  overflow: true,
                                  fontW: currentTap == 1 ?FW.bold:FW.semibold,
                                  color: currentTap == 1 ?MAINCOLOR:LIGHTGREYCOLOR,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentPage = StudentProfileScreen();
                        currentTap = 4;
                      });
                    },
                    child: Container(
                      width: ScreenHelper.screenWidth(context, 75),
                      child: Center(
                        child: Image.asset(
                          'assets/icons/Group 52255.png',
                          height: ScreenHelper.screenHeight(context,64.6),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        // currentPage = AddCenterScreen();
                           currentPage = MainBank();
                        currentTap = 2;
                      });
                    },
                    child: Container(
                      width: ScreenHelper.screenWidth(context, 75),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: ScreenHelper.screenHeight(context, 20),
                            ),
                            Image(
                              image:AssetImage(currentTap == 2
                                  ? "assets/reicons/Discovery2.png"
                                  : "assets/reicons/Discovery.png"),
                              height: ScreenHelper.screenHeight(context, 28),
                              width: ScreenHelper.screenHeight(context, 28),
                            ),
                            SizedBox(
                              height: ScreenHelper.screenHeight(context, 7),
                            ),
                            Container(
                              width: ScreenHelper.screenWidth(context, 75),
                              child: Center(
                                child: CustomText(
                                  text: 'بنك الأسئلة',
                                  overflow: true,
                                  fontW: currentTap == 2 ?FW.bold:FW.semibold,
                                  color: currentTap == 2 ?MAINCOLOR:LIGHTGREYCOLOR,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentPage = PointScreen();
                        currentTap = 3;
                      });
                    },
                    child: Container(
                      width: ScreenHelper.screenWidth(context, 75),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: ScreenHelper.screenHeight(context, 20),
                            ),
                            Image(
                              image:AssetImage(currentTap == 3
                                  ? "assets/reicons/Wallet2.png"
                                  : "assets/reicons/Wallet.png"),
                              // color: widget.homeIndex == 3
                              //     ? null
                              //     : DISABLENAVBARCOLOR,
                              height: ScreenHelper.screenHeight(context, 28),
                              width: ScreenHelper.screenHeight(context, 28),
                            ),
                            SizedBox(
                              height: ScreenHelper.screenHeight(context, 7),
                            ),
                            Container(
                              width: ScreenHelper.screenWidth(context, 75),
                              child: Center(
                                child: CustomText(
                                  text: 'النقاط',
                                  overflow: true,
                                  fontW: currentTap == 3 ?FW.bold:FW.semibold,
                                  color: currentTap == 3 ?MAINCOLOR:LIGHTGREYCOLOR,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
