import 'package:azcourses/ui/widgets/global/tag_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/controller/buy_controller.dart';
import 'package:azcourses/bloc/controller/class_controller.dart';
import 'package:azcourses/bloc/controller/video_controller.dart';
import 'package:azcourses/bloc/model/course.dart';
import 'package:azcourses/bloc/model/video_model.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/student/rewie_screen.dart';
import 'package:azcourses/ui/screens/student/teacher_profile.dart';
import 'package:azcourses/ui/screens/student/view_all.dart';
import 'package:azcourses/ui/widgets/global/progress_widget.dart';
import 'package:azcourses/ui/widgets/global/request_dialog.dart';
import 'package:azcourses/ui/widgets/global/course_list.dart';
import 'package:azcourses/ui/widgets/global/view_all.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:get_storage/get_storage.dart';

import '../must_login_dialog.dart';
import 'class_list.dart';
import 'loading_dialog.dart';



class CourseDetailsSheet extends StatefulWidget {
  Course course;

  CourseDetailsSheet({this.course});

  @override
  _CourseDetailsSheetState createState() => _CourseDetailsSheetState();
}

class _CourseDetailsSheetState extends State<CourseDetailsSheet> {
  VideoController videoController = Get.put(VideoController());
  ClassController classController = Get.put(ClassController());
  BuyController buyController = Get.put(BuyController());

  // Future<void> fetchTeachersVideos() async {
  //   await videoController.fetchVideosByTeacherId(
  //       teacherID: widget.course.teacherId);
  // }

  @override
  void initState() {
    // TODO: implement initState
   classController.fetchClasses(classId: widget.course.id,categoryId: widget.course.categoryId);
    super.initState();
  }

  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenHelper.screenHeight(context, 450),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(ScreenHelper.screenRadius(context, 0)),
            topRight: Radius.circular(ScreenHelper.screenRadius(context, 0))),
        color: Color(0xffFDFDFD),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenHelper.screenWidth(context, 16)),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: ScreenHelper.screenHeight(context, 19),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenHelper.screenWidth(context, 150)),
                child: Container(
                  height: ScreenHelper.screenHeight(context, 6),
                  //width: ScreenHelper.screenWidth(context, 78),
                  decoration: BoxDecoration(
                      color: GREYCOLOR,
                      borderRadius: BorderRadius.all(Radius.circular(
                          ScreenHelper.screenRadius(context, 275)))),
                ),
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 19),
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundImage: NetworkImage(
                        // "https://files.elnashra.com/elnashra/pictures/4213882_1422469842.jpg",
                        widget.course.publichByImage
                    ),
                  ),
                  SizedBox(
                    width: ScreenHelper.screenWidth(context, 5),
                  ),
                  Text(
//                          widget.videoModel.subject,
                    "بواسطة ${widget.course.publichByName}",
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          color: Color(0xffB1B1B1),
                          fontSize: 12,
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 11),
              ),
              Container(
                width: ScreenHelper.screenWidth(context, 200),
                child: Text(
                   widget.course.name,
//                   "مبادئ الحوائط و الخرسانة ذاتية المعالجة",
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.headline3.copyWith(
                      color: DARKBLACKCOLOR,
                      fontSize: ScreenHelper.screenWidth(context, 20)),
                ),
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 11),
              ),
              drawStar(widget.course.rate),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 11),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(
                          TeacherProfile(
                            teacherId: widget.course.lecturer_id,
                            lecturerImage: widget.course.lecturer_image,
                            lecturerName: widget.course.lecturer_name,
                            subject: widget.course.subject,
                              ),
                          transition: Transition.cupertino);
                    },
                    child: Container(
                      height: ScreenHelper.screenHeight(context, 27),
                      width: ScreenHelper.screenWidth(context, 113),
                      decoration: BoxDecoration(
                          color: Color(0xffEEEEEE),
                          borderRadius: BorderRadius.all(Radius.circular(
                              ScreenHelper.screenRadius(context, 20)))),
                      child: Center(
                        child: Text(
                         widget.course.lecturer_name,
//                           "احمد فتحي",
                          textDirection: TextDirection.rtl,
                          style: Theme.of(context).textTheme.headline1.copyWith(
                              color: Color(0xff6B8287),
                              fontSize: ScreenHelper.screenWidth(context, 13)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ScreenHelper.screenWidth(context, 8),
                  ),
                  Text(
                    ".",
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.headline3.copyWith(
                        color: GREYCOLOR,
                        fontSize: ScreenHelper.screenWidth(context, 10)),
                  ),
                  SizedBox(
                    width: ScreenHelper.screenWidth(context, 8),
                  ),
                  Text(
                    // "${widget.course.mintues}m",
                   // "   ",
                    '${(widget.course.mintues==null || widget.course.mintues==0)?" ":"${widget.course.mintues} m"}',
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.headline1.copyWith(
                        color: MAINCOLOR,
                        fontSize: ScreenHelper.screenWidth(context, 12)),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 50),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "الوصف",
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.headline1.copyWith(
                        color: DARKBLACKCOLOR,
                        fontSize: ScreenHelper.screenWidth(context, 17)),
                  ),
                  SizedBox(
                    height: ScreenHelper.screenHeight(context, 8),
                  ),
                  Text(
                    widget.course.description,
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.caption.copyWith(
                        color: DARKBLACKCOLOR,
                        fontSize: ScreenHelper.screenWidth(context, 16)),
                  ),
                  SizedBox(
                    height: ScreenHelper.screenHeight(context, 8),
                  ),
                  TagList()
                ],
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 14),
              ),
             GetBuilder<ClassController>(
                 builder: (_) => _.isLoading?
                     Center(
                       child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Center(child: ProgressWidget()),
                       ],
                     )
                     ):
                     Column(
                       children: [
                         ViewAll(
                           title: "دروس الكورس",
                           onNavigateTap: () {},
                           padding: 0,
                           isViewAll: false,
                         ),
                         SizedBox(
                           height: ScreenHelper.screenHeight(context, 14),
                         ),
                         ClassList(
                           padding: 0,
                           classes: _.classModels,
                           course: widget.course,
                         ),
                       ],
                     )
             ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 40),
              ),
              Container(
                height: ScreenHelper.screenHeight(context, 99),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(ScreenHelper.screenRadius(context, 6))),
                  color: Color(0xffEFFEF7),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenHelper.screenWidth(context, 24)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: ScreenHelper.screenHeight(context, 50),
                        width: ScreenHelper.screenWidth(context, 147),
                        child: RaisedButton(
                          onPressed:  widget.course.isAllow==1? (){}:()
                          {
                            if(box.hasData("login")){
                              Get.dialog(Center(
                                  child: RequestDialog(
                                    onTap: () {
                                      Get.back();
                                    },
                                    onSuccess: (){
                                      buyController.buyCourse(courseId: widget.course.id);
                                    },
                                    points: widget.course.points,
                                    title: "تهانينا",
                                    subtitle:
                                    "تم تحويل النقاط بنجاح ,اطلع علي رصيدك الحالي",
                                    buttonTitle: "العودة",
                                  )));
                            }else{
                             Get.dialog(MustLoginDialog());
                           }

                          },
                          color: MAINCOLOR,
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                              widget.course.isAllow==1?"تم شراء الكورس":"أشتري الكورس",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .copyWith(
                                      color: Colors.white,
                                      fontSize:
                                          ScreenHelper.screenFont(context, 16)),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 30),
                          ),
                          Text(
                            "الاجمالي",
                            textDirection: TextDirection.rtl,
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                .copyWith(
                                    color: Color(0xff616161),
                                    fontSize:
                                        ScreenHelper.screenWidth(context, 10)),
                          ),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 10),
                          ),
                          Row(
                            children: [
                              Text(
                                "${widget.course.points} نقطه",
                                textDirection: TextDirection.rtl,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(
                                        color: DARKBLACKCOLOR,
                                        fontSize: ScreenHelper.screenWidth(
                                            context, 25)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 40),
              ),
            ],
          ),
        ),
      ),
    );
  }

  drawStar(int activeStar) {
    return GestureDetector(
      onTap: () {
        Get.to(ReviewScreen(courseId: widget.course.id??1,),
            transition: Transition.cupertino,
            duration: Duration(milliseconds: 100));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i < activeStar; i++)
            Padding(
              padding:
                  EdgeInsets.only(left: ScreenHelper.screenWidth(context, 2)),
              child: Icon(
                Icons.star,
                color: Color(0xffF9CA24),
                size: ScreenHelper.screenHeight(context, 10),
              ),
            ),
          for (int i = 5; i > activeStar; i--)
            Padding(
              padding:
                  EdgeInsets.only(left: ScreenHelper.screenWidth(context, 2)),
              child: Icon(
                Icons.star,
                color: Color(0xffD1D1D3),
                size: ScreenHelper.screenHeight(context, 10),
              ),
            ),
          SizedBox(width: ScreenHelper.screenWidth(context, 5)),
          Text(
            "$activeStar/5",
            style: Theme.of(context).textTheme.headline1.copyWith(
                fontSize: ScreenHelper.screenFont(context, 10),
                color: Color(0xffD1D1D3)),
          ),
          SizedBox(
            width: ScreenHelper.screenWidth(context, 10),
          ),
          Text(
            "عرض التقييميات",
            style: Theme.of(context).textTheme.headline1.copyWith(
                fontSize: ScreenHelper.screenFont(context, 10),
                color: Color(0xff383838)),
          ),
          SizedBox(
            width: ScreenHelper.screenWidth(context, 2),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: ScreenHelper.screenWidth(context, 7),
          ),
        ],
      ),
    );
  }
}
