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

class PassPointDialog extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Container(
          color: Colors.transparent,
          height: ScreenHelper.screenHeight(context, 469),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.transparent,
                    height: ScreenHelper.screenHeight(context, 100),
                    width: ScreenHelper.screenWidth(context, 319),

                  ),
                  Container(
                    height: ScreenHelper.screenHeight(context, 369),
                    width: ScreenHelper.screenWidth(context, 319),
                    decoration: BoxDecoration(
                      color: Color(0xffFAFAFA),
                      borderRadius: BorderRadius.all(Radius.circular(
                          ScreenHelper.screenRadius(context, 19))),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context,22)),
                      child: Column(
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
                          CustomTextField(
                            label: "كلمة السر",
                            errorMessage: "كلمة فضلك ادخل كلمة السر",
                            textColor: Color(0xff707070),
                            isSecure: true,
                            suffixIcon:  SquareImageContainer(
                              size: 20.0,
                              image: AssetImage("assets/images/eye.png"),
                              imageColor: Colors.white10,
                            ),

                          ),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context,53),
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context,45)),
                            child: UsedButton(
                              onTap: (){
                                Get.back();
                              },
                              title: "دخول",
                            ),
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
                            image: AssetImage("assets/icons/500.png"),
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
            ],
          ),
        ),
      ),
    );
  }
}

class _MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.8);
    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(0, size.height * 0.8);
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
