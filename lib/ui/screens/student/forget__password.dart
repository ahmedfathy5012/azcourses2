import 'package:azcourses/ui/screens/global/start_welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:azcourses/bloc/controller/auth_controller.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/global/recieve_email.dart';
import 'package:azcourses/ui/widgets/global/back_ground.dart';
import 'package:azcourses/ui/widgets/global/custom_text_field.dart';
import 'package:azcourses/ui/widgets/global/error_dialog.dart';
import 'package:azcourses/ui/widgets/global/image_container.dart';
import 'package:azcourses/ui/widgets/global/loading_dialog.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  AuthController authController = Get.put(AuthController());

  // KeyboardVisibilityNotification _keyboardVisibility =
  //     new KeyboardVisibilityNotification();
  // int _keyboardVisibilitySubscriberId;
  bool _keyboardState = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    // _keyboardVisibilitySubscriberId = _keyboardVisibility.addNewListener(
    //   onChange: (bool visible) {
    //     setState(() {
    //       _keyboardState = visible;
    //       print(_keyboardState);
    //     });
    //   },
    // );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    //_keyboardVisibility.removeListener(_keyboardVisibilitySubscriberId);
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
                  Image.asset(
                      "assets/icons/forget1.png",
                    height: ScreenHelper.screenHeight(context,230),
                  ),
                  SizedBox(
                    height: ScreenHelper.screenHeight(context, 80),
                  ),
                  Text(
                    "نسيت كلمة السر",
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
                      "ادخل رقم الهاتف الخاص بحسابك و سوف نرسل عليه كود استرجاع كلمة السر",
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline2.copyWith(
                          color: Color(0xffC3C2CF),
                          fontSize: ScreenHelper.screenFont(context, 14)),
                    ),
                  ),
                  SizedBox(
                    height: ScreenHelper.screenHeight(context, 40),
                  ),
                  Form(
                    key: _globalKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          label: "رقم الهاتف",
                          controller: emailController,
                          keyboardType: TextInputType.phone,
                          errorMessage: "يجب ادخال رقم الهاتف",
                          validator: (value) {
                            if (value.isEmpty) {
                              return "يجب ادخال رقم الهاتف";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 90),
                        ),
                        UsedButton(
                          title: "إرسال",
                          onTap: () {
                            submit(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
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
      authController.checkPhone(context: context,phone: emailController.text);
    }
  }
}
