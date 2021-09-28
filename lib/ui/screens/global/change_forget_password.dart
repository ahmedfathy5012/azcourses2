import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/controller/auth_controller.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/global/signup_screen.dart';
import 'package:azcourses/ui/screens/global/welcome_screen.dart';
import 'package:azcourses/ui/screens/student/forget__password.dart';
import 'package:azcourses/ui/screens/student/home_screen.dart';
import 'package:azcourses/ui/screens/student/tabs_screen.dart';
import 'package:azcourses/ui/widgets/global/back_ground.dart';
import 'package:azcourses/ui/widgets/global/custom_text_field.dart';
import 'package:azcourses/ui/widgets/global/error_dialog.dart';
import 'package:azcourses/ui/widgets/global/loading_dialog.dart';
import 'package:azcourses/ui/widgets/global/logo.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/utils/constants.dart';

import 'menu_screen.dart';

class ChangeForgetPassword extends StatefulWidget {
  final String phone;


  ChangeForgetPassword({this.phone});

  @override
  _ChangeForgetPasswordState createState() => _ChangeForgetPasswordState();
}

class _ChangeForgetPasswordState extends State<ChangeForgetPassword> {
  AuthController authController = Get.put(AuthController());

  bool newIsSecure = true;
  bool oldIsSecure = true;
  bool confirmIsSecure = true;

  TextEditingController newPasswordController;
  TextEditingController confirmPasswordController;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    confirmPasswordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(
          children: [
            BackGround(),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenHelper.screenWidth(context, 30)),
                child: Column(
                  children: [
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 40),
                    ),
                    Text(
                      "تغيير كلمة المرور",
                      style: Theme.of(context).textTheme.headline1.copyWith(
                          fontSize: ScreenHelper.screenFont(context, 17),
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 70),
                    ),
                    Logo(
                      size: 100,
                    ),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 40),
                    ),
                    Form(
                      key: _globalKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 30),
                          ),
                          CustomTextField(
                            onSuffixTap: () {
                              setState(() {
                                newIsSecure = !newIsSecure;
                              });
                            },
                            isSecure: newIsSecure,
                            label: "كلمة السر الجديدة",
                            controller: newPasswordController,
                            errorMessage: "يجب ادخال كلمة السر",
                            suffixIcon: SquareImageContainer(
                              size: 20.0,
                              image: AssetImage("assets/images/eye.png"),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "يجب ادخال كلمة السر";
                              } else if (value.length < 6) {
                                return "كلمة سر قصيرة";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 30),
                          ),
                          CustomTextField(
                            onSuffixTap: () {
                              setState(() {
                                confirmIsSecure = !confirmIsSecure;
                              });
                            },
                            isSecure: confirmIsSecure,
                            label: "تأكيد كلمة السر",
                            controller: confirmPasswordController,
                            errorMessage: "يجب ادخال كلمة السر",
                            suffixIcon: SquareImageContainer(
                              size: 20.0,
                              image: AssetImage("assets/images/eye.png"),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "يجب ادخال كلمة السر";
                              } else if (value.length < 6) {
                                return "كلمة سر قصيرة";
                              } else if (value != newPasswordController.text) {
                                return "كلمتان سر غير متطابقتان";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 80),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenHelper.screenWidth(context, 39),
                  vertical: ScreenHelper.screenHeight(context, 20)),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: UsedButton(
                  onTap: () {
                    //  Get.offAll(TabsScreen(),transition: Transition.leftToRight);
                    submit(context);
                  },
                  title: "تسجيل الدخول",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void submit(BuildContext context) async {
    if (_globalKey.currentState.validate()) {
      _globalKey.currentState.save();


      await authController.resetPassword(password: newPasswordController.text,phone:widget.phone);

    }
  }
}
