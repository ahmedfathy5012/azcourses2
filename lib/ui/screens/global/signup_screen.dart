import 'package:azcourses/ui/widgets/returned_appbar.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/controller/auth_controller.dart';
import 'package:azcourses/bloc/controller/year_controller.dart';
import 'package:azcourses/bloc/model/auth_user.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/global/google_map_screen.dart';
import 'package:azcourses/ui/screens/global/login_screen.dart';
import 'package:azcourses/ui/screens/global/menu_screen.dart';
import 'package:azcourses/ui/screens/global/signup_second_screen.dart';
import 'package:azcourses/ui/screens/student/home_screen.dart';
import 'package:azcourses/ui/screens/student/tabs_screen.dart';
import 'package:azcourses/ui/widgets/global/back_ground.dart';
import 'package:azcourses/ui/widgets/global/custom_text_field.dart';
import 'package:azcourses/ui/widgets/global/error_dialog.dart';
import 'package:azcourses/ui/widgets/global/grade_dialog.dart';
import 'package:azcourses/ui/widgets/global/loading_dialog.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/ui/widgets/global/states_dialog.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';

import '../../../utils/constants.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AuthController authController = Get.put(AuthController());

  bool isSecure = true;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  // KeyboardVisibilityNotification _keyboardVisibility =
  //     new KeyboardVisibilityNotification();
  // int _keyboardVisibilitySubscriberId;
  bool _keyboardState = false;

  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController gradeController;
  TextEditingController phoneController;
  TextEditingController confirmPasswordController;
  TextEditingController passwordController;
  TextEditingController gradeSendController;

  var _selectItem;

  YearController yearController = Get.put(YearController());

  Future<void> fetchYears() async {
    try {
      await yearController.fetchYears();
    } catch (e) {
      print(e);
    }
  }

  bool passSecure = true;
  bool confirmPassSecure = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchYears();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    gradeController = TextEditingController();
    phoneController = TextEditingController();
    confirmPasswordController = TextEditingController();
    gradeSendController = TextEditingController();
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
    emailController.dispose();
    gradeController.dispose();
    phoneController.dispose();
    confirmPasswordController.dispose();
    gradeSendController.dispose();
    // _keyboardVisibility.removeListener(_keyboardVisibilitySubscriberId);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
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
                    ReturnedAppBar(title: "انشاء حساب",),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 40),
                    ),
                    Form(
                      key: _globalKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            onComplete: () {
                              node.nextFocus();
                            },
                            label: "اسم المستخدم",
                            controller: nameController,
                            errorMessage: "يجب ادخال اسم المستخدم",
                            suffixWidget: SquareImageContainer(
                              size: 20.0,
                              image: AssetImage("assets/images/Tick.png"),
                            ),
                          ),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 30),
                          ),
//                          Directionality(
//                            textDirection: TextDirection.rtl,
//                            child: DropdownButtonFormField(
//                              // value: _selectItem,
//                              hint: Text(
//                                "الصف الدراسي",
//                                style: Theme.of(context)
//                                    .textTheme
//                                    .headline2
//                                    .copyWith(
//                                      color: Theme.of(context).disabledColor,
//                                      fontSize:
//                                          ScreenHelper.screenFont(context, 16),
//                                    ),
//                              ),
////                              validator: (value) {
////                                if (value.isEmpty) {
////                                  //return "يجب ادخال السنة الدراسية";
////                                  return null;
////                                } else {
////                                  return null;
////                                }
////                              },
//                              items: [
//                                for (int i = 0; i < years.length; i++)
//                                  DropdownMenuItem(
//                                    child: Text(
//                                      years[i].title,
//                                      style: Theme.of(context)
//                                          .textTheme
//                                          .headline2
//                                          .copyWith(
//                                            color: MAINCOLOR,
//                                            fontSize: ScreenHelper.screenFont(
//                                                context, 16),
//                                          ),
//                                    ),
////                                    onTap: () {
////                                      setState(() {
////                                        gradeController.text = years[i].title;
////                                        gradeSendController.text =
////                                            years[i].id.toString();
////                                      });
////                                    },
//                                  ),
//                              ],
//                              onChanged: (value) {
//                                setState(() {
//                                  _selectItem = value;
//                                });
//                              },
//                              decoration: InputDecoration(
//                                hintStyle: Theme.of(context)
//                                    .textTheme
//                                    .headline2
//                                    .copyWith(
//                                      color: Theme.of(context).disabledColor,
//                                      fontSize:
//                                          ScreenHelper.screenFont(context, 16),
//                                    ),
//                                labelStyle: Theme.of(context)
//                                    .textTheme
//                                    .headline2
//                                    .copyWith(
//                                      color: Theme.of(context).disabledColor,
//                                      fontSize: ScreenHelper.screenFont(
//                                          context, 16.0),
//                                    ),
//                                errorStyle: Theme.of(context)
//                                    .textTheme
//                                    .headline2
//                                    .copyWith(
//                                      color: Theme.of(context).disabledColor,
//                                      fontSize: ScreenHelper.screenFont(
//                                          context, 16.0),
//                                    ),
//
//                                // prefix: Text("اظهار"),
//                                enabledBorder: UnderlineInputBorder(
//                                  borderSide: BorderSide(
//                                      color: Theme.of(context).disabledColor,
//                                      width: 2),
//                                ),
//                                focusedBorder: UnderlineInputBorder(
//                                  borderSide:
//                                      BorderSide(color: MAINCOLOR, width: 2),
//                                ),
//                                errorBorder: UnderlineInputBorder(
//                                  borderSide:
//                                      BorderSide(color: Colors.red, width: 2),
//                                ),
//                              ),
//                            ),
//                          ),

//                          GestureDetector(
//                            onTap: () {
//                              Get.dialog(
//                                Center(
//                                  child: GradeDialog(
//                                    isState: true,
//                                    onSave: (int value) {
//                                      gradeSendController.text =
//                                          value.toString();
//                                      gradeController.text = yearController
//                                          .years[yearController.years
//                                              .indexWhere((element) =>
//                                                  element.id == value)]
//                                          .title;
//                                      Get.back();
//                                    },
//                                    stateLocations: yearController.years,
//                                  ),
//                                ),
//                              );
//                            },
//                            child: CustomTextField(
//                              label: "الصف الدراسي",
//                              controller: gradeController,
//                              errorMessage: "يجب ادخال كلمة السر",
//                              onTap: () {},
//                              enabled: false,
//                            ),
//                          ),
//                          SizedBox(
//                            height: ScreenHelper.screenHeight(context, 40),
//                          ),
                          CustomTextField(
                            onComplete: () {
                              node.nextFocus();
                            },
                            label: "رقم الموبايل",
                            controller: phoneController,
                            errorMessage: "يجب ادخال رقم الهاتف",
                            keyboardType: TextInputType.phone,
                            suffixWidget: Text(
                              "20+",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(
                                    color: Theme.of(context).accentColor,
                                    fontSize: ScreenHelper.screenSizeFraction(
                                        context, 4),
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 40),
                          ),
                          // CustomTextField(
                          //   onComplete: () {
                          //     node.nextFocus();
                          //   },
                          //   label: "البريد الالكتروني",
                          //   controller: emailController,
                          //   errorMessage: "يجب ادخال كلمة السر",
                          //   validator: (value) {
                          //     if (value.isEmpty) {
                          //       return "يجب ادخال البريد الالكتروني";
                          //     } else if (!value.contains("@")) {
                          //       return "بريد الكتروني غير صالح";
                          //     } else {
                          //       return null;
                          //     }
                          //   },
                          // ),
                          // SizedBox(
                          //   height: ScreenHelper.screenHeight(context, 40),
                          // ),
                          CustomTextField(
                            onComplete: () {
                              node.nextFocus();
                            },
                            onSuffixTap: () {
                              setState(() {
                                passSecure = !passSecure;
                              });
                            },
                            label: "كلمة السر",
                            controller: passwordController,
                            errorMessage: "يجب ادخال كلمة السر",
                            suffixIcon: SquareImageContainer(
                              size: 20.0,
                              image: AssetImage("assets/images/eye.png"),
                            ),
                            isSecure: passSecure,
                            onTap: () {
                              print("ahmed");
                            },
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
                            height: ScreenHelper.screenHeight(context, 40),
                          ),
                          CustomTextField(
                            onComplete: () {
                              node.unfocus();
                            },
                            onSuffixTap: () {
                              setState(() {
                                confirmPassSecure = !confirmPassSecure;
                              });
                            },
                            isSecure: confirmPassSecure,
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
                                return "كلمة السر قصيرة";
                              } else if (confirmPasswordController.text !=
                                  passwordController.text) {
                                return "كلمتان السر غير متطابقتان";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context, 40),
                          ),
                          !_keyboardState
                              ? SizedBox(
                                  height: 0,
                                )
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ScreenHelper.screenWidth(
                                          context, 39)),
                                  child: Column(
                                    children: [
                                      UsedButton(
                                        onTap: () {
//                                          Get.offAll(TabsScreen(),
//                                              transition:
//                                                  Transition.leftToRight);
                                          submit(context);
                                        },
                                        title: "إنشاء حساب",
                                      ),
                                      SizedBox(
                                        height: ScreenHelper.screenHeight(
                                            context, 18),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            Get.back();
                                            Get.to(LoginScreen(),
                                                transition:
                                                    Transition.cupertino);
                                          },
                                          child: RichText(
                                            text: TextSpan(
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2
                                                  .copyWith(
                                                      color: Theme.of(context)
                                                          .disabledColor,
                                                      fontSize: ScreenHelper
                                                          .screenFont(
                                                              context, 14)),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: 'لديك حساب ؟  ',
                                                ),
                                                TextSpan(
                                                    text: 'تسجيل الدخول',
                                                    style: TextStyle(
                                                        color: SECONDERYCOLOR))
                                              ],
                                            ),
                                          )),
                                      SizedBox(
                                        height: ScreenHelper.screenHeight(
                                            context, 10),
                                      ),
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ),
                    _keyboardState
                        ? SizedBox(
                            height: 0,
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    ScreenHelper.screenWidth(context, 39)),
                            child: Column(
                              children: [
                                UsedButton(
                                  onTap: () {
//                                    Get.offAll(TabsScreen(),
//                                        transition: Transition.leftToRight);
                                    submit(context);
                                  },
                                  title: "إنشاء حساب",
                                ),
                                SizedBox(
                                  height:
                                      ScreenHelper.screenHeight(context, 18),
                                ),
                                InkWell(
                                    onTap: () {
                                      Get.back();
                                      Get.to(LoginScreen(),
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
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'لديك حساب ؟  ',
                                          ),
                                          TextSpan(
                                              text: 'تسجيل الدخول',
                                              style: TextStyle(
                                                  color: SECONDERYCOLOR))
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  height:
                                      ScreenHelper.screenHeight(context, 10),
                                ),
                              ],
                            ),
                          ),
                  ],
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

  //    Get.offAll(SignUpSecondScreen(), transition: Transition.leftToRight);

     AuthUser authUser = AuthUser(
       userName: nameController.text,
       password: passwordController.text,
       phone:    phoneController.text,
       // email:    emailController.text,
       // isStudent: 1,
       // yearId: int.parse(gradeSendController.text),
     );

     Get.dialog(Center(child: LoadingDialog()));
     await authController.firstRegister(authUser).then((value) async{
       switch (value) {
         case 0:
           await authController.verifyPhone(
               context: context,
               register: true,
               phone: phoneController.text.startsWith("0")?"+2${phoneController.text}" : "+20${phoneController.text}",
               onSucsses: () {
               Get.back();
               Get.offAll(SignUpSecondScreen(),
               transition: Transition.leftToRight);
              });
           // Get.offAll(SignUpSecondScreen(), transition: Transition.leftToRight);
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
