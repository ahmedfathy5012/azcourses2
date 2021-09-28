import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:azcourses/bloc/controller/menu_controller.dart';
import 'package:azcourses/ui/screens/student/tabs_screen.dart';
import 'package:azcourses/ui/widgets/global/back_ground.dart';
// Dart Packages
import 'dart:async';
// Flutter packages
// Screens
// Widgets

// Providers
// Models
// Helpers
import '../../../utils/constants.dart';
import '../../../helpers/screen_helper.dart';
import '../../../helpers/get_services.dart';
import 'draw_drawer.dart';

final Color backgroundColor = MAINCOLOR;

class MenuDashboardPage extends StatefulWidget {
  final bool isSignUp;
  final homeIndex;
  MenuDashboardPage({this.isSignUp = false, this.homeIndex = 0});

  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with SingleTickerProviderStateMixin {
  GetStorage box = GetStorage();
  MenuController menuController = Get.put(MenuController());

//  bool isCollapsed = true;
//  bool isNotify = false;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  // NOTIFICATION CONFIGRATION

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.7).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      body: GetBuilder<MenuController>(
        builder: (_) => Stack(
          children: <Widget>[
            BackGround(),
            menu(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 160),
                    ),
                    Container(
                      height: ScreenHelper.screenHeight(context, 481),
                      width: ScreenHelper.screenWidth(context, 180),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(
                              ScreenHelper.screenRadius(context, 10))),
                          color: Color(0xff676C97)),
                    ),
                  ],
                ),
              ],
            ),
            dashboard(context),
//            if (_.isNotify) notification(context)
          ],
        ),
      ),
    );
  }

//  Widget notification(context) {
//    return GetBuilder<MenuController>(
//      builder: (_) => AnimatedPositioned(
//        duration: duration,
//        top: 0,
//        bottom: 0,
//        left: 0,
//        right: 0,
//        child: NotificationScreen(
//          onCloseTap: () {
////          setState(() {
////            isNotify = false;
////          });
//            menuController.changeIsNotify();
//          },
//        ),
//      ),
//    );
//  }

  Widget menu(context) {
    return GetBuilder<MenuController>(
      builder: (_) => SlideTransition(
        position: _slideAnimation,
        child: ScaleTransition(
          scale: _menuScaleAnimation,
          child: DrawDrawer(
            onCloseTap: () {
//            setState(() {
              if (_.isCollapsed)
                _controller.forward();
              else
                _controller.reverse();
//              isCollapsed = !isCollapsed;
              menuController.changeIsCollapsed();
//            });
            },
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return GetBuilder<MenuController>(
      builder: (_) => AnimatedPositioned(
        duration: duration,
        top: 0,
        bottom: 0,
        left: _.isCollapsed ? 0 : -0.2 * screenWidth,
        right: _.isCollapsed ? 0 : 0.5 * screenWidth,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Material(
              clipBehavior: Clip.hardEdge,
              color: Colors.transparent,
              elevation: 4.0,
              animationDuration: duration,
              child: GestureDetector(
//                onHorizontalDragEnd: (_) {
//                  // setState(() {
//                  if (menuController.isCollapsed)
//                    _controller.forward();
//                  else
//                    _controller.reverse();
//                  menuController.changeIsCollapsed();
////                    isCollapsed = !isCollapsed;
//                  //  });
//                },
                child: TabsScreen(
                    homeIndex: widget.homeIndex,
//                    onNotifyTap: () {
////                    setState(() {
////                      isNotify = true;
////                    });
//                      homeController.clearNotification();
//                      menuController.changeIsNotify();
//                    },
                    onMenuTap: () {
                      if (_.isCollapsed)
                        _controller.forward();
                      else
                        _controller.reverse();
                      menuController.changeIsCollapsed();
                    }),
              )),
        ),
      ),
    );
  }
}
