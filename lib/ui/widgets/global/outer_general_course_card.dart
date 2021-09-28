import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/model/general_course.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/student/inner_general_course_screen.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
class OuterGeneralCourseCard extends StatelessWidget {
  GeneralCourse course;


  OuterGeneralCourseCard({this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          InnerGeneralCourseScreen(generalId: course.id,title: course.title,),
          transition: Transition.cupertino,
        );
      },
      child: Card(
        elevation: 0.0,
        color: Colors.white,
//      shape: BeveledRectangleBorder(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: ULTRAGREYCOLOR, width: .5),
          borderRadius: BorderRadius.all(
              Radius.circular(ScreenHelper.screenRadius(context, 9))),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SquareImageContainer(
              //     size: 65.0,
              //     image:NetworkImage(
              //       course.icon,
              //     )
              // ),
              Container(
                height: ScreenHelper.screenHeight(context, 65.5),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: course.icon,
                  placeholder: (context, url) => Center(child:
                  Image.asset(
                    "assets/reicons/videoplace.png",
                    height: ScreenHelper.screenHeight(context, 20),
                  )
                  ),
                  errorWidget: (context, url, error) => Center(child:
                  Image.asset(
                    "assets/reicons/videoplace.png",
                    height: ScreenHelper.screenHeight(context, 20),
                  )
                  ),
                ),
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 16),
              ),
              Text(
                // "البرمجة",
                course.title,
                style: Theme.of(context).textTheme.headline3.copyWith(
                    color: BLACKCOLOR,
                    fontSize: ScreenHelper.screenFont(context, 14)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
