import 'dart:async';

import 'package:azcourses/bloc/controller/auth_controller.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/services/pin_code_services.dart';
import 'package:azcourses/ui/widgets/global/back_ground.dart';
import 'package:azcourses/ui/widgets/global/loading_dialog.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class VerficationScreen extends StatefulWidget {
  final String phone;
  final Function onSuccess;
  final String validationCode;

  VerficationScreen({this.phone, this.onSuccess, this.validationCode});



  @override
  _VerficationScreenState createState() => _VerficationScreenState();
}

class _VerficationScreenState extends State<VerficationScreen> {
  AuthController authController = Get.put(AuthController());
  TextEditingController textEditingController;

  StreamController<ErrorAnimationType> errorController;


  final interval = const Duration(seconds: 1);
  final int timerMaxSeconds = 60;
  int currentSeconds = 0;
  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController();
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    errorController.close();
    textEditingController.dispose();
    super.dispose();
  }

  String currentText="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGround(),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 55),
                ),
                Image.asset(
                    "assets/reicons/verify.png",
                  height: ScreenHelper.screenHeight(context,150),
                ),

                SizedBox(
                  height: ScreenHelper.screenHeight(context, 35),
                ),
                Text(
                  "أرسل رمز التأكيد في رسالة نصية",
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.caption.copyWith(
                      color: Colors.white,
                      fontSize: ScreenHelper.screenFont(context, 17)),
                ),
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 5),
                ),
                RichText(
                  textDirection: TextDirection.rtl,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.caption.copyWith(
                        color: Colors.white,
                        fontSize: ScreenHelper.screenFont(context, 14)),
//                              text: 'جديد ؟  ',
                    children: <TextSpan>[
                      TextSpan(
                        text: 'للجوال رقم    ',
                      ),
                      TextSpan(
                          text: '${widget.phone??""}',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                            color: Colors.white,)),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 50),
                ),
                PinCodeServices.pinCodeWidget(
                    textEditingController: textEditingController,
                    context: context,
                    errorController: errorController,
                    onChanged: (value){
                      setState(() {
                        currentText = value;
                      });
                      print(currentText);
                    }
                ),
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 50),
                ),
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 24),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenHelper.screenWidth(context, 24)),
                  child: UsedButton(
                    onTap: () {
                      print("Ge To Second Register");
                      submit(context);
                    },
                    title: "تأكيد الرمز",
                  ),
                ),
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 24),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  void submit(BuildContext context) async {
    if(currentText.length==6){
      Get.dialog(Center(child: LoadingDialog()));
      try {
        await widget.onSuccess(widget.validationCode, currentText);
      } catch (e) {
        Get.back();
        print(e);
      }
    }
  }
}


/**

    await authController.verifyPhone().then((value) {
    switch (value) {
    case 0:
    Get.back();
    Get.offAll(GoogleMapScreen(), transition: Transition.leftToRight);
    break;
    case 1:
    Get.back();
    Get.dialog(
    Center(
    child: MessageDialog(
    isOneAction: true,
    title: "حدث خطأ ما",
    subtitle: "اول مره اخري",
    oneActionTitle: "المحاولة مرة اخري",
    onOneActionTap: () {
    Get.back();
    },
    ),
    ),
    );
    break;
    case 2:
    Get.back();
    Get.dialog(
    Center(
    child: MessageDialog(
    isOneAction: true,
    title: "حدث خطأ ما",
    subtitle: "اول مره اخري",
    oneActionTitle: "المحاولة مرة اخري",
    onOneActionTap: () {
    Get.back();
    },
    ),
    ),
    );
    break;
    case 500:
    Get.back();
    SnackBar(
    backgroundColor: SECONDRY_COLOR,
    content: Text(
    "لايوجد انترنت",
    textDirection: TextDirection.rtl,
    style: Theme.of(context).textTheme.headline1.copyWith(
    fontSize: ScreenHelper.screenFont(context, 15),
    color: Colors.white),
    ),
    );
    break;
    default:
    Get.back();
    Get.dialog(
    Center(
    child: MessageDialog(
    isOneAction: true,
    title: "حدث خطأ ما",
    subtitle: "اول مره اخري",
    oneActionTitle: "المحاولة مرة اخري",
    onOneActionTap: () {
    Get.back();
    },
    ),
    ),
    );
    break;
    }
    });
 */
