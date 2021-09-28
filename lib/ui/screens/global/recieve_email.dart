import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/controller/auth_controller.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/global/login_screen.dart';
import 'package:azcourses/ui/screens/global/welcome_screen.dart';
import 'package:azcourses/ui/widgets/global/back_ground.dart';
import 'package:azcourses/ui/widgets/global/cong_dialog.dart';
import 'package:azcourses/ui/widgets/global/custom_text_field.dart';
import 'package:azcourses/ui/widgets/global/error_dialog.dart';
import 'package:azcourses/ui/widgets/global/image_container.dart';
import 'package:azcourses/ui/widgets/global/loading_dialog.dart';
import 'package:azcourses/ui/widgets/global/pass_point_dialog.dart';
import 'package:azcourses/ui/widgets/global/question_dialog.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/utils/constants.dart';

class ReceiveEmailScreen extends StatefulWidget {
  String email;

  ReceiveEmailScreen({this.email});

  @override
  _ReceiveEmailScreenState createState() => _ReceiveEmailScreenState();
}

class _ReceiveEmailScreenState extends State<ReceiveEmailScreen> {
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    //
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(
          children: [
            BackGround(),
            Padding(
              padding: EdgeInsets.only(
                  right: ScreenHelper.screenWidth(context, 16),
                  top: ScreenHelper.screenHeight(context, 33)),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: ImageContainer(
                        height: ScreenHelper.screenHeight(context, 14),
                        width: ScreenHelper.screenWidth(context, 31),
                        image: AssetImage("assets/icons/backicon.png"),
                      ),
                    ),
                    SizedBox(
                      width: ScreenHelper.screenWidth(context, 90),
                    ),
                    Text(
                      "استرجاع كلمة السر",
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.headline1.copyWith(
                          color: Colors.white,
                          fontSize: ScreenHelper.screenFont(context, 17)),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenHelper.screenWidth(context, 30)),
              child: ListView(
                children: [
                  SizedBox(
                    height: ScreenHelper.screenHeight(context, 80),
                  ),
                  SquareImageContainer(
                    size: 245.0,
                    image: AssetImage("assets/icons/question.png"),
                  ),
                  SizedBox(
                    height: ScreenHelper.screenHeight(context, 80),
                  ),
                  Text(
                    "تأكد من بريدك الإلكتروني",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1.copyWith(
                        color: Color(0xffDFDFDF),
                        fontSize: ScreenHelper.screenFont(context, 23)),
                  ),
                  SizedBox(
                    height: ScreenHelper.screenHeight(context, 8),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenHelper.screenWidth(context, 30)),
                    child: Text(
                      "لقد أرسالنا تعليمات استرجاع كلمة السر علي البريد ${widget.email},تأكد من بريدك و اعقد التسجيل",
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline2.copyWith(
                          color: Color(0xffC3C2CF),
                          fontSize: ScreenHelper.screenFont(context, 14)),
                    ),
                  ),
                  SizedBox(
                    height: ScreenHelper.screenHeight(context, 35),
                  ),
                  InkWell(
                    onTap: () {
                      submit(widget.email);
                    },
                    child: Text(
                      "لم يصلك رسالة ؟",
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1.copyWith(
                          color: MAINCOLOR,
                          fontSize: ScreenHelper.screenFont(context, 14)),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    left: ScreenHelper.screenWidth(context, 60),
                    right: ScreenHelper.screenWidth(context, 60),
                    bottom: ScreenHelper.screenHeight(context, 20)),
                child: UsedButton(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.rtl,
                      children: [
                        ImageContainer(
                          height: ScreenHelper.screenHeight(context, 11),
                          width: ScreenHelper.screenWidth(context, 16),
                          image: AssetImage("assets/icons/backicon.png"),
                        ),
                        SizedBox(
                          width: ScreenHelper.screenWidth(context, 7),
                        ),
                        Text(
                          "العودة للستجيل",
                          textDirection: TextDirection.rtl,
                          style: Theme.of(context).textTheme.headline3.copyWith(
                                fontSize: ScreenHelper.screenFont(context, 16),
                                color: Colors.white,
                              ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Get.offAll(WelcomeScreen(),
                        transition: Transition.leftToRight);
                    Get.to(LoginScreen(), transition: Transition.cupertino);
//                    Get.dialog(
//                        Center(
//                            child:
//                            QuestionDialog()
//                        )
//                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void submit(String email) async {
    Get.dialog(Center(child: LoadingDialog()));
    //
    // await authController.resetPassword(email).then((value) {
    //   switch (value) {
    //     case 0:
    //       Get.back();
    //       break;
    //     case 1:
    //       Get.back();
    //       Get.dialog(Center(
    //           child: ErrorDialog(
    //         onSave: () {
    //           Get.back();
    //         },
    //         buttonTitle: "المحاولة مرة اخري",
    //         message: authController.errorMessage,
    //       )));
    //
    //       break;
    //     case 2:
    //       Get.back();
    //       Get.dialog(Center(
    //           child: ErrorDialog(
    //               onSave: () {
    //                 Get.back();
    //               },
    //               buttonTitle: "المحاولة مرة اخري",
    //               message: "حدث خطأ ما")));
    //       break;
    //     default:
    //       Get.back();
    //       Get.dialog(Center(
    //           child: ErrorDialog(
    //               onSave: () {
    //                 Get.back();
    //               },
    //               buttonTitle: "المحاولة مرة اخري",
    //               message: "حدث خطأ ما")));
    //
    //       break;
    //   }
    // });
  }
}
