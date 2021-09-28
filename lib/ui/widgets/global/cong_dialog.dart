import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polygon_clipper/polygon_border.dart';
import 'package:polygon_clipper/polygon_clipper.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/utils/constants.dart';

class CongDialog extends StatelessWidget {
  String title;
  String subtitle;
  Function onTap;
  String buttonTitle;


  CongDialog({this.title, this.subtitle, this.onTap,this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        color: Colors.transparent,
        height: ScreenHelper.screenHeight(context, 410),
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
                  height: ScreenHelper.screenHeight(context, 310),
                  width: ScreenHelper.screenWidth(context, 319),
                  decoration: BoxDecoration(
                    color: Color(0xffFAFAFA),
                    borderRadius: BorderRadius.all(Radius.circular(
                        ScreenHelper.screenRadius(context, 19))),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context,70)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: ScreenHelper.screenHeight(context,90),
                        ),
                        Text(
                        title,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline3.copyWith(
                                color: DARKBLACKCOLOR,
                                fontSize: ScreenHelper.screenFont(context, 35),
                              ),
                        ),
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 10),
                        ),
                        Text(
                         subtitle,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline2.copyWith(
                                color: DARKBLACKCOLOR,
                                fontSize: ScreenHelper.screenFont(context, 14),
                              ),
                        ),
                        SizedBox(
                          height: ScreenHelper.screenHeight(context,27),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context,40)),
                          child: UsedButton(
                            onTap: onTap,
                            title: buttonTitle,
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
