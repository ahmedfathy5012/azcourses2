import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/controller/my_courses_controller.dart';
import 'package:azcourses/bloc/controller/video_controller.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/student/course_details_screen.dart';
import 'package:azcourses/ui/widgets/global/ViewAllHeader.dart';
import 'package:azcourses/ui/widgets/global/back_bar.dart';
import 'package:azcourses/ui/widgets/global/header_back_ground.dart';
import 'package:azcourses/ui/widgets/global/progress_widget.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/ui/widgets/global/course_show_card.dart';
import 'package:azcourses/ui/widgets/global/viedoe_show_grid.dart';
import 'package:azcourses/utils/constants.dart';

class MyCoursesScreen extends StatefulWidget {
  int categoryId;
  int isClosest;
  bool isSubject;
  String subject;
  bool isType;
  bool isSubType;
  String type;
  String subType;
  int typeId;
  int subTypeId;

  String title;

  MyCoursesScreen(
      {
        this.title="",
      this.categoryId,
      this.isClosest,
      this.isSubject = false,
      this.subject,
      this.isSubType = false,
      this.isType = false,
      this.type,
      this.subType,
      this.typeId,
      this.subTypeId});

  @override
  _MyCoursesScreenState createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  VideoController videoController = Get.put(VideoController());
  MyCoursesController myCoursesController = Get.put(MyCoursesController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myCoursesController.fetchCourses();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HeaderBackGround(),
          BackBar(
            title: "كورساتي",
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
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              ScreenHelper.screenRadius(context, 30)),
                          topRight: Radius.circular(
                              ScreenHelper.screenRadius(context, 30)))),
                  child:   GetBuilder<MyCoursesController>(
                    builder: (_) =>
                    _.isLoading?
                    Center(
                      child: ProgressWidget(),
                    ):
                    _.courses.isEmpty?
                    Center(
                      child: Text(
                        "لا توجد كورسات لعرضها",
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context).textTheme.headline3.copyWith(
                            color: MAINCOLOR,
                            fontSize: ScreenHelper.screenFont(context, 20)),
                      ),
                    ):
                    Padding(
                      padding: EdgeInsets.only(
                        left: ScreenHelper.screenWidth(context, 16),
                        right: ScreenHelper.screenWidth(context, 16),
                        top: ScreenHelper.screenHeight(context, 27),
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Container(
                          height: ScreenHelper.screenHeight(context, 580),
                          child: GridView.builder(
//            itemCount: videoController.videos.length,
                            itemCount: _.courses.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: .89,
                                mainAxisSpacing:
                                ScreenHelper.screenWidth(context, 21),
                                crossAxisSpacing:
                                ScreenHelper.screenHeight(
                                    context, 21)),
                            itemBuilder: (context, index) => LayoutBuilder(
                                builder: (context, constraints) {
                                  print(constraints.maxWidth);
                                  return CourseShowCart(
                                    course: _.courses[index],
                                    onTap: () {
                                      Get.to(
                                          CourseDetailsScreen(
                                            course: _.courses[index],
                                          ),
                                          transition: Transition.cupertino);
                                    },
                                    height: constraints.maxHeight - 25,
                                    width: constraints.maxWidth - 5,
                                    //videoModel: videoController.videos[index],
                                  );
                                }),
                          ),
                        ),
                      ),
                    ),
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


//
// Expanded(
// child: Center(
// child: Container(
// height: ScreenHelper.screenHeight(context, 500),
// child: Column(
// children: [
// SquareImageContainer(
// image: AssetImage("assets/images/internet.png"),
// size: 230.0,
// ),
// SizedBox(
// height: ScreenHelper.screenHeight(context, 100),
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