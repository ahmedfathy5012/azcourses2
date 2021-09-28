import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/cupertino.dart';

class SoonHeader extends StatelessWidget {
  bool isBack;

  SoonHeader({this.isBack = false});

  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: ScreenHelper.screenHeight(context, 170),
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
          child: Padding(
            padding: EdgeInsets.only(
              bottom: ScreenHelper.screenHeight(context, 0),
              right: ScreenHelper.screenWidth(context, 30),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: ScreenHelper.screenWidth(context, 76),
                height: ScreenHelper.screenHeight(context, 210),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                        image: AssetImage("assets/images/student.png"))),
              ),
            ),
          ),
//          Column(
//            children: [
//              Align(
//                  alignment: Alignment.topRight,
//                  child: Image(
//                    image: AssetImage("assets/images/gren1.png"),
//                    height: ScreenHelper.screenWidth(context, 200),
//                    width: ScreenHelper.screenWidth(context, 200),
//                    fit: BoxFit.cover,
//                  )),
//
//            ],
//          ),
        ),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: ScreenHelper.screenWidth(context, 100),
                top: ScreenHelper.screenHeight(context, 70),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    "مرحبا ${box.read("name")} !",
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.headline2.copyWith(
                        color: Colors.white,
                        fontSize: ScreenHelper.screenFont(context, 12)),
                  ),
                  SizedBox(
                    height: ScreenHelper.screenHeight(context, 3),
                  ),
                  Text(
                    "استكشف الخدمات الاخري",
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.headline3.copyWith(
                        color: Colors.white,
                        fontSize: ScreenHelper.screenFont(context, 23)),
                  ),
                ],
              ),
            ),
            isBack
                ? Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: ScreenHelper.screenWidth(context, 25),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ],
                  )
                : SizedBox(
                    height: 0,
                  ),
          ],
        ),
      ],
    );
  }
}
