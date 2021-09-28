import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/global/login_screen.dart';
import 'package:azcourses/ui/screens/global/signup_screen.dart';
import 'package:azcourses/ui/screens/global/start_welcome_screen.dart';
import 'package:azcourses/ui/widgets/global/back_ground.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/utils/constants.dart';

import 'onboarding_dot.dart';
import 'onboarding_item.dart';
import 'onboarding_model.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 0;
  int _currentScreen = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
//    Timer.periodic(Duration(seconds: 3), (Timer timer) {
//      if (_currentPage < 2) {
//        _currentPage++;
//      } else {
//        _currentPage=0;
//      }
//
//      _pageController.animateToPage(
//        _currentPage,
//        duration: Duration(milliseconds: 300),
//        curve: Curves.easeIn,
//      );
//    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  GetStorage onBoardingBox = GetStorage("onBoarding");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          BackGround(),
          PageView.builder(
            allowImplicitScrolling: false,
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            onPageChanged: _onchanged,
            itemCount: onBoardingLists.length,
            itemBuilder: (ctx, i) => OnBoardingItem(
              index: i,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: ScreenHelper.screenHeight(context, 200),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 4; i++)
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenHelper.screenWidth(context, 2.5)),
                      child: OnBoardingDot(
                        isActive: i == _currentPage,
                      ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: ScreenHelper.screenHeight(context, 0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenHelper.screenWidth(context, 16)),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: ScreenHelper.screenHeight(context, 100),
                  child: Column(
                    children: [
                      UsedButton(
                        widthFraction: 343,
                        onTap: () {
                          if (_currentPage < 3) {
                            setState(() {
                              _currentPage++;
                            });
                          } else {
                            // Get.offAll(WelcomeScreen());
                            onBoardingBox.write("onBoarding",1);
                            Get.offAll(StartWelcomeScreen(),duration: Duration(milliseconds: 150),transition: Transition.leftToRight);
                          }
                          _pageController.animateToPage(
                            _currentPage,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        title: _currentPage < 3 ? "التالي" : "أبدأ الان",
                      ),
                      SizedBox(
                        height: ScreenHelper.screenHeight(context, 16),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     if (_currentPage < 3) {
                      //       _pageController.animateToPage(
                      //         3,
                      //         duration: Duration(milliseconds: 500),
                      //         curve: Curves.easeIn,
                      //       );
                      //     } else {
                      //       Get.offAll(SignUpScreen());
                      //     }
                      //   },
                      //   child: Text(
                      //     _currentPage < 3
                      //         ? "Skip for now"
                      //         : "register new account",
                      //     style: Theme.of(context).textTheme.caption.copyWith(
                      //         color: MAINCOLOR,
                      //         fontSize: ScreenHelper.screenFont(context, 14)),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(
          //       vertical: ScreenHelper.screenHeight(context, 50),
          //       horizontal: ScreenHelper.screenWidth(context, 20)),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Logo(),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
