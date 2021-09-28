import 'package:azcourses/ui/screens/global/change_password.dart';
import 'package:azcourses/ui/screens/global/signup_second_screen.dart';
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

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MAINCOLOR,
      body: Stack(
        children: [
          HeaderBackGround(),
          BackBar(
            title: "الملف الشخصي",
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenHelper.screenWidth(context, 22)),
                    child: ListView(
                      children: [
                        _drawUserInfo(context: context),
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 46),
                        ),
                        infoRow(title: "المعلومات الشخصية", onTap: () {
                          Get.to(SignUpSecondScreen(isEdit: true,),transition: Transition.cupertino,duration: Duration(milliseconds: 150));
                        }),
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 42),
                        ),
                        infoRow(title: "كلمة السر", onTap: () {
                          Get.to(ChangePassword(),transition: Transition.cupertino,duration: Duration(milliseconds: 150));
                        }),
                      ],
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

  Widget _drawUserInfo({BuildContext context}) {
    return Column(
      children: [
        SizedBox(
          height: ScreenHelper.screenHeight(context, 75),
        ),
        Image.asset(
          "assets/images/profileavater.png",
          height: ScreenHelper.screenWidth(context, 84.0),
          width: ScreenHelper.screenWidth(context, 84.0),
        ),
        SizedBox(
          height: ScreenHelper.screenHeight(context, 12.0),
        ),
        Text(
          box.read("name")??"",
          style: Theme.of(context).textTheme.headline3.copyWith(
              fontSize: ScreenHelper.screenFont(context, 17.0),
              color: DARKBLUECOLR),
        ),
//         SizedBox(
//           height: ScreenHelper.screenHeight(context, 7.0),
//         ),
//         Text(
// //          box.read("name"),
//           "mohanedtory97",
//           style: Theme.of(context).textTheme.headline1.copyWith(
//               fontSize: ScreenHelper.screenFont(context, 12.0),
//               color: Color(0xff858585)),
//         ),
        SizedBox(
          height: ScreenHelper.screenHeight(context, 7.0),
        ),
        Text(
//          box.read("name"),
           box.read("is_primary")==0?
          "${box.read("college")??""} - ${box.read("department")??""}":
          "${box.read("level")??""} - ${box.read("primary_year")??""}",
          style: Theme.of(context).textTheme.headline1.copyWith(
              fontSize: ScreenHelper.screenFont(context, 12.0),
              color: Color(0xff858585)),
        ),
      ],
    );
  }

  Widget infoRow({Function onTap, String title, String icon}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: ScreenHelper.screenHeight(context, 65),
        width: ScreenHelper.screenWidth(context, 343),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenHelper.screenWidth(context, 16)),
          child: Row(
            children: [
              SquareImageContainer(
                  size: ScreenHelper.screenWidth(context, 15),
                  image: AssetImage("assets/images/mail.png")),
              SizedBox(
                width: ScreenHelper.screenWidth(context, 14),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headline3.copyWith(
                    color: Color(0xff21004F),
                    fontSize: ScreenHelper.screenFont(context, 18)),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: BLACKCOLOR,
                size: ScreenHelper.screenWidth(context, 16),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Color(0xffD4D4D4A8)),
            borderRadius: BorderRadius.all(
                Radius.circular(ScreenHelper.screenRadius(context, 10)))),
      ),
    );
  }
}
