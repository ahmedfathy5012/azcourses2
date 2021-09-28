import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/ui/widgets/global/custom_carsoul.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/controller/connectivity.dart';
import 'package:azcourses/bloc/controller/home_controller.dart';
import 'package:azcourses/bloc/controller/menu_controller.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/student/all_courses.dart';
import 'package:azcourses/ui/screens/student/all_lecturer.dart';
import 'package:azcourses/ui/screens/student/view_all.dart';
import 'package:azcourses/ui/widgets/global/HomeCourseList.dart';
import 'package:azcourses/ui/widgets/global/lecturer_home_list.dart';
import 'package:azcourses/ui/widgets/global/lecturer_list.dart';
import 'package:azcourses/ui/widgets/global/progress_widget.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/ui/widgets/global/tab_row.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/ui/widgets/global/course_list.dart';
import 'package:azcourses/ui/widgets/global/course_show_card.dart';
import 'package:azcourses/ui/widgets/global/view_all.dart';
import 'package:azcourses/ui/widgets/student/home_header.dart';
import 'package:azcourses/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());

  ConnectivityController connectivityController =
      Get.put(ConnectivityController());
  bool isConnectivety = true;
  Future<int> fetchHome() async {
    try {
      await homeController.fetchHome();
      homeController.setTabsIndex(homeController.categories[0].id);
    } catch (e) {
      print(e);
      return 1;
    }
  }

  Future<void> fetchConnectivety() async {
    try {
      bool storeConnectivety = await connectivityController.chekConnectivety();
      setState(() {
        isConnectivety = storeConnectivety;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//
  }

  @override
  Widget build(BuildContext context) {
    HomeController _homeController = Get.put(HomeController());
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(onTap: () {}, child: HomeHeader(courses: _homeController.categories.isNotEmpty?_homeController.categories.first.courses:[],)),
          SizedBox(
            height: ScreenHelper.screenHeight(context, 20),
          ),
          GetBuilder<HomeController>(
              builder: (_) => _.isLoading
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: ProgressWidget()),
                      ],
                    )
                  : Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          _.offers.isEmpty
                              ? SizedBox(
                            height: 0,
                          )
                              :
                          CustomCarousel(offers: _.offers,),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 24),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(
                              horizontal: ScreenHelper.screenWidth(context,16)
                            ),
                            child: CustomText(
                              text: 'الأقسام',
                              color: MAINCOLOR,
                              fontSize: 16,
                              fontW: FW.regular,
                            ),
                          ),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 16),
                          ),
                          Container(
                            height: ScreenHelper.screenHeight(context, 110),
                            child: TabRow(
                              categories: _.categories.isEmpty?[]:_.categories,
                            ),
                          ),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 40),
                          ),
                          HomeCourseList(
                            courses: _.categories.isNotEmpty?_.categories[_.tabIndex].courses??[]:[],
                            tabIndex: _.tabIndex,
                            subjectId: _.categories.isNotEmpty?_.categories[_.tabIndex].id:0,
                            viewAllTitle: "كل الكورسات",
                            isRecently: 0,
                          ),
                          // ViewAll(
                          //   title: "الكورسات",
                          //   onNavigateTap: () {
                          //     // Get.to(
                          //     //     AllCoursesScreen(
                          //     //       subjectId: _.categories[_.tabIndex].id,
                          //     //       isRecently: 0,
                          //     //       title: "كل الكورسات",
                          //     //     ),
                          //     //     transition: Transition.cupertino);
                          //   },
                          // ),
                          // SizedBox(
                          //   height: ScreenHelper.screenHeight(context, 15),
                          // ),
                          // CourseList(
                          //   courses: _.categories.isNotEmpty?_.categories[_.tabIndex].courses:[],
                          // ),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 40),
                          ),
                          _.offers.isEmpty
                              ? SizedBox(
                            height: 0,
                          )
                              :
                          CustomCarousel(offers: _.offers,),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 40),
                          ),
                          HomeCourseList(
                            courses: _.categories.isNotEmpty?_.categories[_.tabIndex].recentlyCourses??[]:[],
                            tabIndex: _.tabIndex,
                            viewAllTitle: "اخر الاضافات",
                            subjectId: _.categories.isNotEmpty?_.categories[_.tabIndex].id:0,
                            isRecently: 1,
                          ),
                          // ViewAll(
                          //   title: "اخر الاضافات",
                          //   onNavigateTap: () {
                          //     Get.to(
                          //         AllCoursesScreen(
                          //          subjectId: _.categories[_.tabIndex].id,
                          //           isRecently: 1,
                          //           title: "اخر الاضافات",
                          //         ),
                          //         transition: Transition.cupertino);
                          //   },
                          // ),
                          // SizedBox(
                          //   height: ScreenHelper.screenHeight(context, 15),
                          // ),
                          // CourseList(
                          //   courses: _.categories[_.tabIndex].recentlyCourses,
                          // ),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 40),
                          ),
                          LecturerHomeList(
                            tabIndex: _.tabIndex,
                            subjectId: _.categories.isNotEmpty ?_.categories[_.tabIndex].id:0,
                            lecturers: _.categories.isNotEmpty?_.categories[_.tabIndex].lecturers??[]:[],
                          ),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 50),
                          ),
                          // ViewAll(
                          //   title: "المدرسين",
                          //   onNavigateTap: () {
                          //     Get.to(
                          //         AllLecturerScreen(
                          //          subjectId: _.categories[_.tabIndex].id,
                          //         ),
                          //         transition: Transition.cupertino);
                          //   },
                          // ),
                          // SizedBox(
                          //   height: ScreenHelper.screenHeight(context, 15),
                          // ),
                          // _.categories.isNotEmpty?
                          // _.categories[_.tabIndex].lecturers.isNotEmpty?
                          // Center(
                          //   child: Text("لا يوجد مدرسين لعرضهم",
                          //     textDirection: TextDirection.rtl,
                          //     style: Theme.of(context).textTheme.headline1.copyWith(
                          //         fontSize: ScreenHelper.screenFont(context, 13),
                          //         color: MAINCOLOR
                          //     ),),
                          // ):
                          // LecturerList(
                          //   lecturers: _.categories[_.tabIndex].lecturers,
                          // ):
                          // Center(
                          //       child: Text(
                          //         "لا يوجد مدرسين لعرضها",
                          //         style: Theme.of(context).textTheme.bodyText1.copyWith(
                          //           color: GREYCOLOR,
                          //           fontSize: ScreenHelper.screenFont(context,10)
                          //         ),
                          //       ),
                          //     ),
                          // SizedBox(
                          //   height: ScreenHelper.screenHeight(context, 50),
                          // ),
                        ],
                      ),
                    ))
        ],
      ),
    );
  }
}

//
//
// FutureBuilder(
// future: fetchHome(),
// // ignore: missing_return
// builder: (context, snapshot) {
// switch (snapshot.connectionState) {
// case ConnectionState.none:
// return Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Center(child: ProgressWidget()),
// ],
// );
// break;
// case ConnectionState.waiting:
// case ConnectionState.active:
// return Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Center(child: ProgressWidget()),
// ],
// );
// break;
// case ConnectionState.done:
// if (snapshot.hasData) {
// if (snapshot.data == 500) {
// print("dataaaa is >> ${snapshot.data}");
// return Expanded(
// child: Center(
// child: Container(
// height: ScreenHelper.screenHeight(context, 500),
// child: Column(
// children: [
// SquareImageContainer(
// image: AssetImage("assets/images/internet.png"),
// size: 200.0,
// ),
// SizedBox(
// height: ScreenHelper.screenHeight(context, 50),
// ),
// Padding(
// padding: EdgeInsets.symmetric(
// horizontal:
// ScreenHelper.screenWidth(context, 100)),
// child: UsedButton(
// title: "إعادة الاتصال",
// onTap: () {
// setState(() {});
// },
// ),
// ),
// ],
// ),
// ),
// ));
// } else {
// return Expanded(
// child: ListView(
// shrinkWrap: true,
// children: [
// Container(
// height: ScreenHelper.screenHeight(context, 35),
// child: Padding(
// padding: EdgeInsets.only(
// right:
// ScreenHelper.screenWidth(context, 16)),
// child: TabRow(
// categories: homeController.categories,
// ),
// ),
// ),
// SizedBox(
// height: ScreenHelper.screenHeight(context, 40),
// ),
// GetBuilder<HomeController>(
// builder: (_) => ViewAll(
// title: "الكورسات",
// onNavigateTap: () {
// Get.to(
// ViewAllScreen(
// categoryId: _.tabIndex,
// isClosest: 1,
// ),
// transition: Transition.cupertino);
// },
// ),
// ),
// SizedBox(
// height: ScreenHelper.screenHeight(context, 15),
// ),
// GetBuilder<HomeController>(
// builder: (_) => VideoList(
//
// //                                      videos: homeController
// //                                          .categories[homeController.categories
// //                                              .indexWhere((element) =>
// //                                                  element.id == _.tabIndex)]
// //                                          .closestVideos,
// )),
// SizedBox(
// height: ScreenHelper.screenHeight(context, 42),
// ),
// //                            homeController.offers.length < 1
// //                                ? SizedBox(
// //                                    height: 0,
// //                                  )
// //                                :
// GestureDetector(
// onTap: () {},
// child: CarouselSlider.builder(
// //                                  itemCount: homeController.offers.length,
// itemCount: 4,
// options: CarouselOptions(
// onPageChanged: (index, _) {
// //                          setState(() {
// //                            carsoulIndex=index;
// //                          });
// },
// autoPlay: true,
// enlargeCenterPage: true,
// viewportFraction: .7,
// height: ScreenHelper.screenHeight(
// context, 200.0),
// ),
// itemBuilder: (context, index) {
// return Padding(
// padding: EdgeInsets.symmetric(
// horizontal: ScreenHelper.screenWidth(
// context, 0)),
// child: AspectRatio(
// aspectRatio: 2,
// child: Card(
// clipBehavior: Clip.hardEdge,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.all(
// Radius.circular(
// ScreenHelper.screenRadius(
// context, 10)))),
// color: MAINCOLOR,
// elevation: 1,
// child: Image(
// //                                            image: NetworkImage(homeController
// //                                                .offers[index].image),
// image: NetworkImage(
// "https://files.elnashra.com/elnashra/pictures/4213882_1422469842.jpg"),
// fit: BoxFit.cover,
// ),
// ),
// ),
// );
// }),
// ),
// SizedBox(
// height: ScreenHelper.screenHeight(context, 42),
// ),
// SizedBox(
// height: ScreenHelper.screenHeight(context, 40),
// ),
// GetBuilder<HomeController>(
// builder: (_) => ViewAll(
// title: "اخر الاضافات",
// onNavigateTap: () {
// Get.to(
// ViewAllScreen(
// categoryId: _.tabIndex,
// isClosest: 1,
// ),
// transition: Transition.cupertino);
// },
// ),
// ),
// SizedBox(
// height: ScreenHelper.screenHeight(context, 15),
// ),
// GetBuilder<HomeController>(
// builder: (_) => VideoList(
// //                                      videos: homeController
// //                                          .categories[homeController.categories
// //                                              .indexWhere((element) =>
// //                                                  element.id == _.tabIndex)]
// //                                          .closestVideos,
// )),
// SizedBox(
// height: ScreenHelper.screenHeight(context, 40),
// ),
// GetBuilder<HomeController>(
// builder: (_) => ViewAll(
// title: "المدرسين",
// onNavigateTap: () {
// Get.to(
// ViewAllScreen(
// categoryId: _.tabIndex,
// isClosest: 1,
// ),
// transition: Transition.cupertino);
// },
// ),
// ),
// SizedBox(
// height: ScreenHelper.screenHeight(context, 15),
// ),
// GetBuilder<HomeController>(
// builder: (_) => LecturerList(
// //                                      videos: homeController
// //                                          .categories[homeController.categories
// //                                              .indexWhere((element) =>
// //                                                  element.id == _.tabIndex)]
// //                                          .closestVideos,
// )),
// SizedBox(
// height: ScreenHelper.screenHeight(context, 50),
// ),
// ],
// ),
// );
// }
// }
// break;
// }
// },
// )
