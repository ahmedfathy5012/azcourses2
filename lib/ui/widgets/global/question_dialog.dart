import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polygon_clipper/polygon_border.dart';
import 'package:polygon_clipper/polygon_clipper.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/custom_text_field.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/utils/constants.dart';

class QuestionDialog extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.transparent,
            height: ScreenHelper.screenHeight(context, 623),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      height :  ScreenHelper.screenHeight(context, 100),
                      width  :  ScreenHelper.screenWidth(context, 319),
                    ),
                    Container(
                      height: ScreenHelper.screenHeight(context, 523),
                      width: ScreenHelper.screenWidth(context, 319),
                      decoration: BoxDecoration(
                        color: Color(0xffFAFAFA),
                        borderRadius: BorderRadius.all(Radius.circular(
                            ScreenHelper.screenRadius(context, 19))),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context,22)),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            SizedBox(
                              height: ScreenHelper.screenHeight(context,65),
                            ),
                            Text(
                              "الرمز السري للنقاط",
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline3.copyWith(
                                color: DARKBLACKCOLOR,
                                fontSize: ScreenHelper.screenFont(context, 18),
                              ),
                            ),
                            SizedBox(
                              height: ScreenHelper.screenHeight(context, 10),
                            ),
                            Text(
                              "من فضلك ادخل الرمز السري للنقاط",
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline2.copyWith(
                                color: DARKBLACKCOLOR,
                                fontSize: ScreenHelper.screenFont(context, 14),
                              ),
                            ),

                            SizedBox(
                              height: ScreenHelper.screenHeight(context,53),
                            ),

                            SizedBox(
                              height: ScreenHelper.screenHeight(context,19),
                            ),
                            Text(
                              "طرق أخري للدخول ؟",
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline2.copyWith(
                                color: MAINCOLOR,
                                fontSize: ScreenHelper.screenFont(context, 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: ScreenHelper.screenWidth(context, 319),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: ClipPolygon(
                          sides: 6,
                          borderRadius: 5.0, // Default 0.0 degrees
                          rotate: 0, // Default 0.0 degrees
                          boxShadows: [
                            PolygonBoxShadow(color: Color(0xff383838).withOpacity(.4), elevation: 4.0),
                          ],
                          child: Container(
                            color: Colors.white,
                            child: SquareImageContainer(
                              image: AssetImage("assets/icons/ques.png"),
                              size: 100.0,
                            ),
                          ),
                        ),
                        height: ScreenHelper.screenHeight(context,135),
                        width:  ScreenHelper.screenHeight(context,135),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: UsedButton(
                    widthFraction: ScreenHelper.screenWidth(context, 20),
                    onTap: (){
                      Get.back();
                    },
                    title: "دخول",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//  Widget questionField({BuildContext context , String hint , TextEditingController controller}){
//    return Column(
//      children: [
//      ],
//    );
//  }
}

