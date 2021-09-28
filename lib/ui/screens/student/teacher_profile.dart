import 'package:azcourses/bloc/controller/lecturer_cover.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/controller/teacher_controller.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/progress_widget.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/ui/widgets/global/teacher_tabs.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/utils/constants.dart';

class TeacherProfile extends StatefulWidget {
  int tabIndex;
  int teacherId;
  String lecturerImage;
  String subject;
  String lecturerName;

  TeacherProfile({this.tabIndex = 0, this.teacherId = 0,this.subject="",this.lecturerName="",this.lecturerImage=""});

  @override
  _TeacherProfileState createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  TeacherController teacherController = Get.put(TeacherController());
  Future<void> fetchTeachersVideos() async {
//    await teacherController.fetchTeacher(teacherID: widget.teacherId);
  }


  @override
  Widget build(BuildContext context) {
    LecturerCoverController  _coverController = Get.put(LecturerCoverController(id: widget.teacherId));
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              GetBuilder<LecturerCoverController>(
                builder: (_) =>  Container(
                  height: ScreenHelper.screenHeight(context, 180),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: MAINCOLOR,
                    image: DecorationImage(
                        image: NetworkImage(
                          // "https://filedn.com/ltOdFv1aqz1YIFhf4gTY8D7/ingus-info/BLOGS/Photography-stocks3/stock-photography-slider.jpg",
                          _.isLoading?
                              " ":
                              _.cover??" "
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 133),
                    ),
                    Center(
                      child: Container(
                        width: ScreenHelper.screenHeight(context, 94),
                        height: ScreenHelper.screenHeight(context, 94),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(
                                ScreenHelper.screenHeight(context, 47))),
                            border: Border.all(width: 1, color: Colors.white),
                            image: DecorationImage(
                                image: NetworkImage(
                                  // "https://engineering.unl.edu/images/staff/Kayla_Person-small.jpg",
                                  widget.lecturerImage
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 7),
                    ),
                    Text(
                      widget.lecturerName,
//                       "احمد فتحي",
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.headline3.copyWith(
                          color: DARKBLACKCOLOR,
                          fontSize: ScreenHelper.screenWidth(context, 20)),
                    ),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 0),
                    ),
                    Text(
                   widget.subject,
//                       "عربي",
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.headline1.copyWith(
                          color: GREYCOLOR,
                          fontSize: ScreenHelper.screenWidth(context, 14)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: TeacherTabs(
              initialIndex: widget.tabIndex,
              lecturerId: widget.teacherId,
            ),
          )
        ],
      ),
    );

//      SafeArea(
//      top: false,
//      child: Scaffold(
//          backgroundColor: Color(0xffFDFDFD),
//          body: FutureBuilder(
//            future: teacherController.fetchTeacher(teacherID: widget.teacherId),
//            // ignore: missing_return
//            builder: (context, snapshot) {
//              switch (snapshot.connectionState) {
//                case ConnectionState.none:
//                  return Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: [
//                      Center(child: ProgressWidget()),
//                    ],
//                  );
//                  break;
//                case ConnectionState.waiting:
//                case ConnectionState.active:
//                  return Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: [
//                      Center(child: ProgressWidget()),
//                    ],
//                  );
//                  break;
//                case ConnectionState.done:
//                  if (snapshot.hasData) {
//                    if (snapshot.data == 0) {
//                      return Column(
//                        children: [
//                          Stack(
//                            children: [
//                              Container(
//                                height: ScreenHelper.screenHeight(context, 180),
//                                width: double.infinity,
//                                decoration: BoxDecoration(
//                                  image: DecorationImage(
//                                      image: NetworkImage(
//                                        //"https://engineering.unl.edu/images/staff/Kayla_Person-small.jpg"
//                                        "https://filedn.com/ltOdFv1aqz1YIFhf4gTY8D7/ingus-info/BLOGS/Photography-stocks3/stock-photography-slider.jpg",
//                                      ),
//                                      fit: BoxFit.cover),
//                                ),
//                              ),
//                              Column(
//                                children: [
//                                  SizedBox(
//                                    height:
//                                        ScreenHelper.screenHeight(context, 133),
//                                  ),
//                                  Center(
//                                    child: Container(
//                                      width: ScreenHelper.screenHeight(
//                                          context, 94),
//                                      height: ScreenHelper.screenHeight(
//                                          context, 94),
//                                      decoration: BoxDecoration(
//                                          color: Colors.transparent,
//                                          borderRadius: BorderRadius.all(
//                                              Radius.circular(
//                                                  ScreenHelper.screenHeight(
//                                                      context, 47))),
//                                          border: Border.all(
//                                              width: 1, color: Colors.white),
//                                          image: DecorationImage(
//                                              image: NetworkImage(
//                                                "https://engineering.unl.edu/images/staff/Kayla_Person-small.jpg",
//                                              ),
//                                              fit: BoxFit.cover)),
//                                    ),
//                                  ),
//                                  SizedBox(
//                                    height:
//                                        ScreenHelper.screenHeight(context, 7),
//                                  ),
//                                  Text(
////                                    teacherController.teacher.name,
//                                    "احمد فتحي",
//                                    textDirection: TextDirection.rtl,
//                                    style: Theme.of(context)
//                                        .textTheme
//                                        .headline3
//                                        .copyWith(
//                                            color: DARKBLACKCOLOR,
//                                            fontSize: ScreenHelper.screenWidth(
//                                                context, 20)),
//                                  ),
//                                  SizedBox(
//                                    height:
//                                        ScreenHelper.screenHeight(context, 0),
//                                  ),
//                                  Text(
////                                    teacherController.teacher.subject,
//                                    "عربي",
//                                    textDirection: TextDirection.rtl,
//                                    style: Theme.of(context)
//                                        .textTheme
//                                        .headline1
//                                        .copyWith(
//                                            color: GREYCOLOR,
//                                            fontSize: ScreenHelper.screenWidth(
//                                                context, 14)),
//                                  ),
//                                ],
//                              ),
//                            ],
//                          ),
//                          Expanded(
//                            child: TeacherTabs(
//                              initialIndex: widget.tabIndex,
//                              teacher: teacherController.teacher,
//                            ),
//                          )
//                        ],
//                      );
//                    } else {
//                      return Center(
//                        child: Container(
//                          height: ScreenHelper.screenHeight(context, 500),
//                          child: Column(
//                            children: [
//                              SquareImageContainer(
//                                image: AssetImage("assets/images/internet.png"),
//                                size: 230.0,
//                              ),
//                              SizedBox(
//                                height: ScreenHelper.screenHeight(context, 100),
//                              ),
//                              Padding(
//                                padding: EdgeInsets.symmetric(
//                                    horizontal:
//                                        ScreenHelper.screenWidth(context, 100)),
//                                child: UsedButton(
//                                  title: "إعادة الاتصال",
//                                  onTap: () {
//                                    setState(() {});
//                                  },
//                                ),
//                              ),
//                            ],
//                          ),
//                        ),
//                      );
//                    }
//                  }
//                  break;
//              }
//            },
//          )),
//    );
  }
}

////
//
//FutureBuilder(
//future: fetchTeachersVideos(),
//// ignore: missing_return
//builder: (context, snapshot) {
//switch (snapshot.connectionState) {
//case ConnectionState.none:
//return Text("loading .....");
//break;
//case ConnectionState.waiting:
//case ConnectionState.active:
//return Text("loading .....");
//break;
//case ConnectionState.done:
//return Expanded(
//child: TeacherTabs(
//initialIndex: widget.tabIndex,
//teacher: teacherController.teacher,
//),
//);
//break;
//}
//},
//),
