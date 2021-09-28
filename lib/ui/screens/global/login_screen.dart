import 'package:azcourses/ui/widgets/global/image_container.dart';
import 'package:azcourses/ui/widgets/returned_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:azcourses/bloc/controller/auth_controller.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/global/signup_screen.dart';
import 'package:azcourses/ui/screens/global/signup_second_screen.dart';
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

// import 'package:keyboard_visibility/keyboard_visibility.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController authController = Get.put(AuthController());

  bool isSecure = true;

  bool isVisible = false;

  TextEditingController nameController;
  TextEditingController passwordController;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  // KeyboardVisibilityNotification _keyboardVisibility =
  //     new KeyboardVisibilityNotification();
  // int _keyboardVisibilitySubscriberId;
  bool _keyboardState = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    passwordController = TextEditingController();

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
    nameController.dispose();
    passwordController.dispose();
    // _keyboardVisibility.removeListener(_keyboardVisibilitySubscriberId);
    super.dispose();
  }

  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    // //
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
                    ReturnedAppBar(title: "تسجيل الدخول",),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 70),
                    ),
                    Logo(
                      size: 100,
                    ),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 40),
                    ),
                    Text(
                      "! مرحبا بك من جديد",
                      style: Theme.of(context).textTheme.headline1.copyWith(
                          fontSize: ScreenHelper.screenFont(context, 18),
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 5),
                    ),
                    Text(
                      "اطلع علي الدروس الجديدة",
                      style: Theme.of(context).textTheme.headline1.copyWith(
                          fontSize: ScreenHelper.screenFont(context, 21),
                          color: Colors.white),
                    ),
                    Form(
                      key: _globalKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            onComplete: () {
                              node.nextFocus();
                            },
                            label: "رقم الهاتف",
                            controller: nameController,
                            errorMessage: "يجب ادخال رقم الهاتف",
                            keyboardType: TextInputType.phone,
                          ),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 30),
                          ),
                          CustomTextField(
                            onComplete: () {
                              node.unfocus();
                            },
                            onSuffixTap: () {
                              setState(() {
                                isSecure = !isSecure;
                              });
                            },
                            isSecure: isSecure,
                            label: "كلمة السر",
                            controller: passwordController,
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 40),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(ForgetPasswordScreen(),
                            transition: Transition.cupertino);
                      },
                      child: Text(
                        "نسيت كلمة السر ؟",
                        style: Theme.of(context).textTheme.headline1.copyWith(
                               fontSize: ScreenHelper.screenFont(context, 14),
                               color: SECONDERYCOLOR
                            ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 80),
                    ),
                    // _keyboardState
                    //     ? SizedBox(
                    //         height: 0,
                    //       )
                    //     :
                    Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    ScreenHelper.screenWidth(context, 39),
                                vertical:
                                    ScreenHelper.screenHeight(context, 10)),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: ScreenHelper.screenHeight(context, 105),
                                child: Column(
                                  children: [
                                    Builder(
                                      builder: (context) => UsedButton(
                                        onTap: () {
                                          //  Get.offAll(TabsScreen(),transition: Transition.leftToRight);

                                          submit(context);
                                        },
                                        title: "تسجيل الدخول",
                                      ),
                                    ),
                                    SizedBox(
                                      height: ScreenHelper.screenHeight(
                                          context, 18),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Get.to(SignUpScreen(),
                                              transition: Transition.cupertino);
                                        },
                                        child: RichText(
                                          text: TextSpan(
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2
                                                .copyWith(
                                                    color: Theme.of(context)
                                                        .disabledColor,
                                                    fontSize:
                                                        ScreenHelper.screenFont(
                                                            context, 14)),
//                              text: 'جديد ؟  ',
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'جديد ؟',
                                              ),
                                              TextSpan(
                                                  text: '  إنشاء حساب',
                                                  style: TextStyle(
                                                      color: SECONDERYCOLOR))
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
//             !_keyboardState
//                 ? SizedBox(
//                     height: 0,
//                   )
//                 : Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: ScreenHelper.screenWidth(context, 39),
//                         vertical: ScreenHelper.screenHeight(context, 10)),
//                     child: Align(
//                       alignment: Alignment.bottomCenter,
//                       child: Container(
//                         height: ScreenHelper.screenHeight(context, 105),
//                         child: Column(
//                           children: [
//                             Builder(
//                               builder: (context) => UsedButton(
//                                 onTap: () {
//                                   //  Get.offAll(TabsScreen(),transition: Transition.leftToRight);
//                                   submit(context);
//                                 },
//                                 title: "تسجيل الدخول",
//                               ),
//                             ),
//                             SizedBox(
//                               height: ScreenHelper.screenHeight(context, 18),
//                             ),
//                             InkWell(
//                                 onTap: () {
//                                   Get.to(SignUpScreen(),
//                                       transition: Transition.cupertino);
//                                 },
//                                 child: RichText(
//                                   text: TextSpan(
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .headline2
//                                         .copyWith(
//                                             color:
//                                                 Theme.of(context).disabledColor,
//                                             fontSize: ScreenHelper.screenFont(
//                                                 context, 14)),
// //                              text: 'جديد ؟  ',
//                                     children: <TextSpan>[
//                                       TextSpan(
//                                         text: 'جديد ؟',
//                                       ),
//                                       TextSpan(
//                                           text: '  إنشاء حساب',
//                                           style:
//                                               TextStyle(color: SECONDERYCOLOR))
//                                     ],
//                                   ),
//                                 ))
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
          ],
        ),
      ),
    );
  }

  void submit(BuildContext context) async {
    if (_globalKey.currentState.validate()) {
      _globalKey.currentState.save();
    //  Get.offAll(MenuDashboardPage(), transition: Transition.leftToRight);
     Get.dialog(Center(child: LoadingDialog()));
      await authController
          .login(nameController.text, passwordController.text)
          .then((value)async {
            print("status is >>>> $value");
        switch (value) {
          case 0:
            String phone = box.read("phone");
            print("phooooooooooooooooooooooooone ${phone}");
            if(box.read("phone_verify")!=1){
              await authController.verifyPhone(
                  context: context,
                  register: true,
                  phone:phone.startsWith("0")?"+2${nameController.text}" : "+20${nameController.text}",
                  onSucsses: () {
                Get.back();
                Get.offAll(SignUpSecondScreen(),
               transition: Transition.leftToRight);
              });
            }
            else if(box.read("info_complete")!=1){
              Get.back();
              Get.offAll(SignUpSecondScreen(), transition: Transition.leftToRight);
            }else{
              Get.back();
              Get.offAll(MenuDashboardPage(), transition: Transition.leftToRight);
            }

            break;
          case 1:
            Get.back();
            Get.dialog(Center(
                child: ErrorDialog(
                  onSave: () {
                    Get.back();
                  },
                  buttonTitle: "المحاولة مرة اخري",
                  message: authController.errorMessage??"حدث خطأ ما",
                )));

            break;
          case 2:
            Get.back();
            Get.dialog(Center(
                child: ErrorDialog(
                    onSave: () {
                      Get.back();
                    },
                    buttonTitle: "المحاولة مرة اخري",
                    message: "حدث خطأ ما")));
            break;
          case 500:
            Get.back();
            SnackBar(
              backgroundColor: MAINCOLOR,
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
            Get.dialog(Center(
                child: ErrorDialog(
                    onSave: () {
                      Get.back();
                    },
                    buttonTitle: "المحاولة مرة اخري",
                    message: "حدث خطأ ما")));
            break;
        }
      });
    }
  }
}
