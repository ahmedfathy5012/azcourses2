import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/cupertino.dart';

class ViewAllHeader extends StatelessWidget {
  bool isSubject;
  int isClosest;
  String subject;
  bool isType;
  bool isSubType;
  String type;
  String subType;

  String title;

  ViewAllHeader(
      {this.isSubject = false,
      this.isClosest = 0,
      this.subject,
      this.isSubType = false,
      this.isType = false,
      this.type,
      this.subType,
      this.title=" "
      });

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
        Padding(
          padding: EdgeInsets.only(
            right: ScreenHelper.screenWidth(context, 150),
            top: ScreenHelper.screenHeight(context, 70),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              Text(
                "استكشف",
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.headline2.copyWith(
                    color: Colors.white,
                    fontSize: ScreenHelper.screenFont(context, 15)),
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 3),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // (isSubject || isType || isSubType)
                    //     ? "مادة ال${subject}"
                    //     : isClosest == 1
                    //         ? "الاقرب اليك"
                    //         : "المضاف حديثا",
                    title,
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.headline3.copyWith(
                        color: Colors.white,
                        fontSize: ScreenHelper.screenFont(context, 23)),
                  ),
                  // SizedBox(
                  //   height: ScreenHelper.screenHeight(context, 3),
                  // ),
                  // Text(
                  //   isType ? type.toString() : " ",
                  //   textDirection: TextDirection.rtl,
                  //   style: Theme.of(context).textTheme.headline2.copyWith(
                  //       color: Colors.white,
                  //       fontSize: ScreenHelper.screenFont(context, 15)),
                  // ),
                  // SizedBox(
                  //   height: ScreenHelper.screenHeight(context, 3),
                  // ),
                  // Text(
                  //   isSubType ? subType : " ",
                  //   textDirection: TextDirection.rtl,
                  //   style: Theme.of(context).textTheme.headline2.copyWith(
                  //       color: Colors.white,
                  //       fontSize: ScreenHelper.screenFont(context, 15)),
                  // ),
                ],
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {
                Get.back();
              }),
        )
      ],
    );
  }
}
