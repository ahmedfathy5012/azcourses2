import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/model/lecturer.dart';
import 'package:azcourses/bloc/model/video_model.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/student/teacher_profile.dart';
import 'package:azcourses/ui/widgets/global/play_icon.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/utils/constants.dart';
// import 'package:video_player/video_player.dart';

class LecturerItem extends StatefulWidget {
  Lecturer lecturer;
  double height;
  Function onTap;
  double width;
  LecturerItem({this.width = 140, this.lecturer, this.height, this.onTap});

  @override
  _LecturerItemState createState() => _LecturerItemState();
}

class _LecturerItemState extends State<LecturerItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap??(){
        Get.to(
            TeacherProfile(
              subject: widget.lecturer.subjects,
              lecturerName: widget.lecturer.name,
              lecturerImage:  widget.lecturer.image,
              teacherId:  widget.lecturer.id,
            ),
            transition: Transition.cupertino);
      },
      child: Card(
        elevation: 2.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.all(
              Radius.circular(ScreenHelper.screenRadius(context, 20))),
        ),
        clipBehavior: Clip.hardEdge,
        shadowColor: SHADOWCOLOR,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: ScreenHelper.screenWidth(context, widget.width),
//              height: ScreenHelper.screenHeight(context, 174),
                height: widget.height * .535,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(ScreenHelper.screenRadius(context, 20))),
                ),
                child:  CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: widget.lecturer.image,
                  placeholder: (context, url) => Center(child:
                  Image.asset(
                    "assets/reicons/personplace.png",
                    height: ScreenHelper.screenHeight(context,50),
                  )
                  ),
                  errorWidget: (context, url, error) => Center(child:
                  Image.asset(
                    "assets/reicons/personplace.png",
                    height: ScreenHelper.screenHeight(context,50),
                  )
                  ),
                )
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 10),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       radius: widget.height * .02,
//                       backgroundImage: NetworkImage(
//                           "https://files.elnashra.com/elnashra/pictures/4213882_1422469842.jpg"),
//                     ),
//                     SizedBox(
//                       width: ScreenHelper.screenWidth(context, 5),
//                     ),
//                     Text(
// //                          widget.videoModel.subject,
//                       "بواسطة دريم سنتر",
//                       textDirection: TextDirection.rtl,
//                       style: Theme.of(context).textTheme.headline1.copyWith(
//                             color: Color(0xffB1B1B1),
//                             fontSize: widget.height / 30,
//                           ),
//                     ),
//                   ],
//                 ),
                  SizedBox(
                    height: ScreenHelper.screenHeight(context, 10),
                  ),
                  Text(
                   widget.lecturer.subject,
//                   "الخرسانه",
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          color: MAINCOLOR,
//                  fontSize: ScreenHelper.screenWidth(context, 10)
                          fontSize: widget.height / 22,
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: widget.height / 35,
              ),
              Text(
                 widget.lecturer.name,
//               "احمد فتحي",
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.headline3.copyWith(
                      color: DARKBLACKCOLOR,
//                    fontSize: ScreenHelper.screenWidth(context, 14)
                      fontSize: widget.height / 15,
                    ),
              ),
              SizedBox(
                height: widget.height / 35,
              ),
//               Row(
//                 children: [
//                   SquareImageContainer(
//                     image: AssetImage("assets/icons/Wallet100.png"),
//                     size: 10.0,
//                   ),
//                   SizedBox(
//                     width: ScreenHelper.screenWidth(context, 10),
//                   ),
//                   Text(
// //                 widget.videoModel.subject,
//                     "100 زائر",
//                     textDirection: TextDirection.rtl,
//                     style: Theme.of(context).textTheme.headline1.copyWith(
//                           color: Color(0xffB1B1B1),
//                           fontSize: widget.height / 30,
//                         ),
//                   ),
//                 ],
//               ),
            ],
          ),
        ),
      ),
    );
  }
}
