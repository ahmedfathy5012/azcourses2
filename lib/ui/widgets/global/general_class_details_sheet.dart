import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/controller/buy_controller.dart';
import 'package:azcourses/bloc/controller/video_controller.dart';
import 'package:azcourses/bloc/model/class_model.dart';
import 'package:azcourses/bloc/model/course.dart';
import 'package:azcourses/bloc/model/video_model.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/student/class_screen.dart';
import 'package:azcourses/ui/screens/student/rewie_screen.dart';
import 'package:azcourses/ui/screens/student/teacher_profile.dart';
import 'package:azcourses/ui/screens/student/view_all.dart';
import 'package:azcourses/ui/widgets/global/class_asset.dart';
import 'package:azcourses/ui/widgets/global/class_video_item.dart';
import 'package:azcourses/ui/widgets/global/progress_widget.dart';
import 'package:azcourses/ui/widgets/global/request_dialog.dart';
import 'package:azcourses/ui/widgets/global/course_list.dart';
import 'package:azcourses/ui/widgets/global/view_all.dart';
import 'package:azcourses/utils/constants.dart';

import 'asset_container.dart';
import 'class_list.dart';
import '../../screens/student/general_course_details_screen.dart';

class GeneralClassDetailsSheet extends StatefulWidget {
  ClassModel classModel;
  Course course;
  List<ClassModel> classModels;
  int classIndex;
  int videoPlayerIndex;
  GeneralClassDetailsSheet({this.classModel,this.course,this.classModels,this.classIndex=0,this.videoPlayerIndex=-1});

  @override
  _GeneralClassDetailsSheetState createState() => _GeneralClassDetailsSheetState();
}

class _GeneralClassDetailsSheetState extends State<GeneralClassDetailsSheet> {
  VideoController videoController = Get.put(VideoController());
  BuyController buyController = Get.put(BuyController());

  // Future<void> fetchTeachersVideos() async {
  //   await videoController.fetchVideosByTeacherId(
  //       teacherID: widget.classModel.teacherid);
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenHelper.screenHeight(context, 450),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(ScreenHelper.screenRadius(context, 27)),
        //     topRight: Radius.circular(ScreenHelper.screenRadius(context, 27))),
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
              // Row(
              //   children: [
              //     CircleAvatar(
              //       radius: 10,
              //       backgroundImage: NetworkImage(
              //         "https://files.elnashra.com/elnashra/pictures/4213882_1422469842.jpg"
              //           // widget.course.publichByImage
              //       ),
              //     ),
              //     SizedBox(
              //       width: ScreenHelper.screenWidth(context, 5),
              //     ),
              //     Text(
              //       // "بواسطة ${widget.course.publichByName}",
              //       "",
              //       textDirection: TextDirection.rtl,
              //       style: Theme.of(context).textTheme.headline1.copyWith(
              //         color: Color(0xffB1B1B1),
              //         fontSize: 12,
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 11),
              ),
              Container(
                width: ScreenHelper.screenWidth(context, 200),
                child: Text(
                   widget.course.name,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.headline3.copyWith(
                      color: DARKBLACKCOLOR,
                      fontSize: ScreenHelper.screenWidth(context, 20)),
                ),
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 11),
              ),
              Row(
                children: [
                  InkWell(
                    // onTap: () {
                    //   Get.to(
                    //       TeacherProfile(
                    //         teacherId: int.parse( widget.course.lecturer_id.toString()),
                    //         lecturerImage: widget.course.lecturer_image,
                    //         lecturerName: widget.course.lecturer_name,
                    //         subject: widget.course.subject,
                    //       ),
                    //       transition: Transition.cupertino);
                    // },
                    child: Container(
                      height: ScreenHelper.screenHeight(context, 27),
                      width: ScreenHelper.screenWidth(context, 113),
                      decoration: BoxDecoration(
                          color: Color(0xffEEEEEE),
                          borderRadius: BorderRadius.all(Radius.circular(
                              ScreenHelper.screenRadius(context, 20)))),
                      child: Center(
                        child: Text(
                          // widget.course.lecturer_name,
                          widget.course.lecturer_name,
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
                    // "${widget.classModel.mintues}m",
                    "",
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
                    "وصف الدرس",
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
                ],
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 14),
              ),
              ViewAll(
                title: "فديوهات الدرس (${widget.course.classVideoModels.length} فديو )",
                // title: "فديوهات الدرس",
                navigateTitle: "",
                isViewAll: false,
                onNavigateTap: () {},
                padding: 0,
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 14),
              ),
              Container(
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => GestureDetector(
                        onTap: (){
                          // Get.back();
                          // Get.to(
                          //     GeneralCourseDetailsScreen(
                          //       course: widget.course,
                          //       videoPlayerIndex: index,
                          //       classVideoModel: widget.course.classVideoModels[index],
                          //     ),
                          //     // ClassScreen(
                          //     //   classModel: widget.classModel,
                          //     //   course: widget.course,
                          //     //   classModels: widget.classModels,
                          //     //   videoPlayerIndex: index,
                          //     //   classVideoModel: widget.classModel.classVideoModels[index],
                          //     // ),
                          //     transition: Transition.cupertino);
                         if(widget.course.classVideoModels[index].allow==1 && widget.videoPlayerIndex!=index){
                            Get.back();
                            Get.to(
                                GeneralCourseDetailsScreen(
                                    course: widget.course,
                                    videoPlayerIndex: index,
                                    classVideoModel: widget.course.classVideoModels[index],
                                ),

                                transition: Transition.cupertino);
                         }
                        },
                        child: ClassVideoItem(isActive: widget.videoPlayerIndex==index,classVideoModel: widget.course.classVideoModels[index],)),
                    separatorBuilder: (context, index) => SizedBox(
                      height: ScreenHelper.screenHeight(context, 7),
                    ),
                    itemCount: widget.course.classVideoModels.length),
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 50),
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
                          onPressed: widget.course.isAllow==1?
                              (){}:
                              () {
                            Get.dialog(Center(
                                child: RequestDialog(
                                  points: widget.course.points,
                                  onTap: () {
                                    Get.back();
                                  },
                                  onSuccess: (){
                                    buyController.buyGeneralCourse(courseId: widget.course.id);
                                  },
                                  title: "تهانينا",
                                  subtitle:
                                  "تم تحويل النقاط بنجاح ,اطلع علي رصيدك الحالي",
                                  buttonTitle: "العودة",
                                )));
                          },
                          color: MAINCOLOR,
                          elevation: 0.0,
                          child: Center(
                            child: Text(
                              widget.course.isAllow==1?"تم شراء الدرس":"أشتري الدرس",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .copyWith(
                                  color: Colors.white,
                                  fontSize:
                                  ScreenHelper.screenFont(context, 15)),
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


}
