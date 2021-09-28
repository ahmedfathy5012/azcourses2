import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:azcourses/bloc/controller/auth_controller.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/global/call_us.dart';
import 'package:azcourses/ui/screens/global/soon_screen.dart';
import 'package:azcourses/ui/screens/student/all_center_screen.dart';
import 'package:azcourses/ui/screens/student/my_courses.dart';
import 'package:azcourses/ui/widgets/global/logo.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:azcourses/ui/widgets/global/back_ground.dart';
import 'profile_screen.dart';
import 'about_us.dart';
import 'privacy_screen.dart';
// Dart Packages
// Flutter packages
// Screens
// Widgets
// Providers
// Models
// Helpers

List<String> userTypes = ["مدرس", "طالب"];

class DrawDrawer extends StatelessWidget {
  Function onCloseTap;

  DrawDrawer({this.onCloseTap});
  GetStorage box = GetStorage();

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    //
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
//            Container(
//              height: double.infinity,
//              width:  double.infinity,
//              child: Image(
//                image: AssetImage("assets/images/splash.png"),
//                fit: BoxFit.cover,
//              ),
//            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenHelper.screenWidth(context, 15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: <Widget>[
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 25),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 15),
                        ),
                       Image.asset(
                         "assets/reicons/wideicon.png",
                         height: ScreenHelper.screenHeight(context, 60),
                       )
                      ],
                    ),
                    GestureDetector(
                      onTap: onCloseTap,
                      child: Container(
                        width: ScreenHelper.screenHeight(context, 40),
                        height: ScreenHelper.screenHeight(context, 40),
                        child: Icon(
                          Icons.close,
                          size: ScreenHelper.screenWidth(context, 20),
                          color: Color(0xff200E32),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(
                                ScreenHelper.screenRadius(context, 10)))),
                      ),
                    ),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 78),
                    ),
                    !box.hasData("login")?
                        Container():
                    tapTitle(
                        context: context,
                        title: "الملف الشخصي",
                        icon: "profile",
                        onTap: () {
                          print("Personal screen clicked");
                          Get.to(ProfileScreen(),
                              transition: Transition.cupertino,
                              duration: Duration(milliseconds: 150));
                        }),
                    !box.hasData("login")?
                    Container():
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 32),
                    ),
                    !box.hasData("login")?
                    Container():
                    tapTitle(
                        context: context,
                        title: "المراكز",
                        icon: "folder",
                        onTap: () {
                          print("Personal screen clicked");
                          Get.to(AllCentersScreen(),
                              transition: Transition.cupertino,
                              duration: Duration(milliseconds: 150));
                        }),
                    // SizedBox(
                    //   height: ScreenHelper.screenHeight(context, 32),
                    // ),
                    // tapTitle(
                    //     context: context,
                    //     title: "نقاطي",
                    //     icon: "drawerwork",
                    //     onTap: () {
                    //       print("Personal screen clicked");
                    //       Get.to(
                    //           SoonScreen(
                    //             isBack: true,
                    //           ),
                    //           transition: Transition.cupertino);
                    //     }),
                    !box.hasData("login")?
                    Container():
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 32),
                    ),
                    !box.hasData("login")?
                    Container():
                    tapTitle(
                        context: context,
                        title: "كورساتي",
                        icon: "drawerwork",
                        onTap: () {
                          print("Personal screen clicked");
                          Get.to(MyCoursesScreen(title: "مكتبة كورساتك",),
                              transition: Transition.cupertino);
                        }),
                    !box.hasData("login")?
                    Container():
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 32),
                    ),
                    tapTitle(
                        context: context,
                        icon: "dtaagob",
                        title: "نبذة عن التطبيق",
                        onTap: () {
                          print("Personal screen clicked");
                          // Get.to(ProfileScreen());
                          Get.to(AboutUs(), transition: Transition.cupertino);
                        }),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 32),
                    ),
                    !box.hasData("login")?
                    Container():
                    tapTitle(
                        context: context,
                        title: "اتصل بنا",
                        icon: "calling",
                        onTap: () {
                          print("Personal screen clicked");
                          Get.to(CallUs(), transition: Transition.cupertino);
                        }),
                    !box.hasData("login")?
                    Container():
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 32),
                    ),
                    tapTitle(
                        context: context,
                        title: "سياسة الخصوصية",
                        icon: "done",
                        onTap: () {
                          print("Personal screen clicked");
                          Get.to(PrivacyScreen(),
                              transition: Transition.cupertino);
                        }),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 50),
                    ),
                    GestureDetector(
                      onTap: () {
                        authController.logout(logOut: box.hasData("login"));
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 2,
                            ),
                            Row(
                              textDirection: TextDirection.rtl,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/reicons/logout.png",
                                  height: ScreenHelper.screenWidth(context,20),
                                ),
                                SizedBox(
                                  width: ScreenHelper.screenWidth(context, 6),
                                ),
                                Text(
                                  box.hasData("login")?"تسجيل الخروج":"تسجيل الدخول",
                                  textDirection: TextDirection.rtl,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      .copyWith(
                                    fontSize:
                                    ScreenHelper.screenFont(context, 12),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 2,
                            ),
                          ],
                        ),
                        width: ScreenHelper.screenWidth(context, 187),
                        height: ScreenHelper.screenWidth(context, 52),
                        decoration: BoxDecoration(
                            color: Color(0xff3E3A62).withOpacity(.6),
                            borderRadius: BorderRadius.all(Radius.circular(
                                ScreenHelper.screenRadius(context, 12)))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(
                vertical: ScreenHelper.screenHeight(context, 20)
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child:  Text(
                  "Made With ❤ By Crazy Idea",
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: Colors.white,
                      fontSize: ScreenHelper.screenFont(context, 15)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget userInfo(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Image.asset(
          "assets/images/profileavater.png",
          height: ScreenHelper.screenWidth(context, 60.0),
          width: ScreenHelper.screenWidth(context, 60.0),
        ),
        SizedBox(
          width: ScreenHelper.screenWidth(context, 16),
        ),
        Column(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
//              box.read("name"),
              "فتحي",
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.headline2.copyWith(
                    fontSize: ScreenHelper.screenFont(context, 17),
                    color: WHITECOLOR,
                  ),
            ),
            SizedBox(
              height: ScreenHelper.screenHeight(context, 5),
            ),
            Text(
              // box.read("code"),
//              userTypes[box.read("is_student")],
              "",
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.caption.copyWith(
                    fontSize: ScreenHelper.screenFont(context, 17),
                    color: SECONDERYCOLOR,
                  ),
            )
          ],
        ),
      ],
    );
  }

  Widget tapTitle({BuildContext context, String title, Function onTap,String icon}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: ScreenHelper.screenHeight(context, 40),
        width: double.infinity,
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              height: ScreenHelper.screenHeight(context, 40),
              width: ScreenHelper.screenHeight(context, 40),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                      Radius.circular(ScreenHelper.screenRadius(context, 6))),
                  border: Border.all(color: Colors.white, width: 1)),
              child: Center(
                child: Image.asset(
                  "assets/reicons/${icon}.png",
                  height: ScreenHelper.screenHeight(context,19),
                ),
              )
            ),
            SizedBox(
              width: ScreenHelper.screenWidth(context, 8),
            ),
            Text(
              title,
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.headline2.copyWith(
                  fontSize: ScreenHelper.screenFont(context, 14),
                  color: WHITECOLOR),
            ),
          ],
        ),
      ),
    );
  }
}
