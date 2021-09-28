import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/controller/video_controller.dart';
import 'package:azcourses/bloc/model/center_model.dart';
import 'package:azcourses/helpers/get_services.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/global/menu_screen.dart';
import 'package:azcourses/ui/screens/global/welcome_screen.dart';
import 'package:azcourses/ui/screens/student/course_details_screen.dart';
import 'package:azcourses/ui/widgets/global/ViewAllHeader.dart';
import 'package:azcourses/ui/widgets/global/back_ground.dart';
import 'package:azcourses/ui/widgets/global/progress_widget.dart';
import 'package:azcourses/ui/widgets/global/rate_sheet.dart';
import 'package:azcourses/ui/widgets/global/request_center_card.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/ui/widgets/global/viedoe_show_grid.dart';
import 'package:azcourses/utils/constants.dart';

class RequestCenterRegisterScreen extends StatefulWidget {
  CenterModel centerModel;


  RequestCenterRegisterScreen({this.centerModel});

  @override
  _RequestCenterRegisterScreenState createState() =>
      _RequestCenterRegisterScreenState();
}

class _RequestCenterRegisterScreenState
    extends State<RequestCenterRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MAINCOLOR,
      body: Stack(
        children: [
          BackGround(),
          Column(
            children: [
              SizedBox(
                height: ScreenHelper.screenHeight(context, 40),
              ),
              Center(
                child: Text(
                  "إنشاء حساب",
                  style: Theme.of(context).textTheme.headline1.copyWith(
                      fontSize: ScreenHelper.screenFont(context, 17),
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 43),
              ),
              RequestCenterCard(
                centerModel: widget.centerModel,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenHelper.screenWidth(context, 69),
                vertical: ScreenHelper.screenHeight(context, 30)),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: UsedButton(
                title: "تأكيد الأختيار",
                onTap: () {
                  Get.offAll(WelcomeScreen(centerModel: widget.centerModel,),
                      duration: Duration(milliseconds: 100),
                      transition: Transition.leftToRight);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
