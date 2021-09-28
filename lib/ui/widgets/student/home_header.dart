import 'package:azcourses/bloc/model/course.dart';
import 'package:azcourses/ui/screens/student/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:azcourses/bloc/controller/menu_controller.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/image_container.dart';
import 'package:azcourses/utils/constants.dart';

class HomeHeader extends StatelessWidget {
  GetStorage box = GetStorage();
  List<Course> courses;
  MenuController menuController = Get.put(MenuController());


  HomeHeader({this.courses});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: ScreenHelper.screenHeight(context, 275),
          width: MediaQuery.of(context).size.width,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: MAINCOLOR,
              borderRadius: BorderRadius.only(
                bottomLeft:
                    Radius.circular(ScreenHelper.screenRadius(context, 50)),
                bottomRight:
                    Radius.circular(ScreenHelper.screenRadius(context, 50)),
              )),
        ),
        Container(
          height: ScreenHelper.screenHeight(context, 275),
          width: MediaQuery.of(context).size.width,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: MAINCOLOR,
              borderRadius: BorderRadius.only(
                bottomLeft:
                Radius.circular(ScreenHelper.screenRadius(context, 50)),
                bottomRight:
                Radius.circular(ScreenHelper.screenRadius(context, 50)),
              )),
          child: Image.asset("assets/reicons/headerback.png",fit: BoxFit.cover,)
        ),
        Column(
          children: [
            SizedBox(
              height: ScreenHelper.screenHeight(context, 110),
            ),
            GetBuilder<MenuController>(
              builder: (_) => Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: ScreenHelper.screenWidth(context, 16)
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _.isCollapsed ? "مرحبا ${box.read("name")??" "} !" : " ",
                          textDirection: TextDirection.rtl,
                          style: Theme.of(context).textTheme.headline2.copyWith(
                              color: Colors.white,
                              fontSize: ScreenHelper.screenFont(context, 12)),
                        ),
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 3),
                        ),
                        Text(
                          _.isCollapsed ? "ماذا تود ان تدرس" : " ",
                          textDirection: TextDirection.rtl,
                          style: Theme.of(context).textTheme.headline3.copyWith(
                              color: Colors.white,
                              fontSize: ScreenHelper.screenFont(context, 23)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: ScreenHelper.screenHeight(context, 20),
            ),
            Center(
              child: GestureDetector(
                onTap: (){
                  Get.to(SearchScreenScreen(courses: courses),duration: Duration(milliseconds: 150),transition: Transition.downToUp);
                },
                child: Container(
                  width: ScreenHelper.screenWidth(context, 335),
                  height: ScreenHelper.screenHeight(context, 70),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff67676717),
                          spreadRadius: .5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(
                          ScreenHelper.screenRadius(context, 10)))),
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: ScreenHelper.screenWidth(context, 17),
                      left: ScreenHelper.screenWidth(context, 10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ابحث عن كورس معين او مدرس",
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline2.copyWith(
                              fontSize: ScreenHelper.screenFont(context, 14),
                              color: DARKCOLOR),
                        ),
                        Container(
                          height: ScreenHelper.screenWidth(context, 42),
                          width: ScreenHelper.screenWidth(context, 42),
                          child: Center(
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: MAINCOLOR,
                              borderRadius: BorderRadius.all(Radius.circular(
                                  ScreenHelper.screenRadius(context, 10)))),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
