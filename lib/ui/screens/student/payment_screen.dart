import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/student/payment_sheet.dart';
import 'package:azcourses/ui/widgets/global/circle_icon.dart';
import 'package:azcourses/ui/widgets/global/point_sheet.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/services.dart';


class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays ([]);
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: MAINCOLOR,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child:Image(
                image: AssetImage("assets/images/gren1.png"),
                height: ScreenHelper.screenWidth(context, 200),
                width:  ScreenHelper.screenWidth(context, 200),
                fit: BoxFit.cover,
              )
            ),
            Positioned(
                left: 0,
                top: 50,
                child:Image(
                  image: AssetImage("assets/images/green2.png"),
                  height: ScreenHelper.screenWidth(context, 200),
                  width:  ScreenHelper.screenWidth(context, 200),
                  fit: BoxFit.cover,
                )
            ),
            Align(
              alignment: Alignment.bottomCenter,
                child: PaymentSheet()),
            Padding(
              padding:  EdgeInsets.only(
                right: ScreenHelper.screenWidth(context, 16),
                top: ScreenHelper.screenHeight(context, 33)
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    CirlceIcon(
                      onTap: (){
                        Get.back();
                      },
                      size: 41,
                      icon: Icons.arrow_forward,
                    ),
                    SizedBox(
                       width: ScreenHelper.screenWidth(context,75),
                    ),
                    Text(
                      "الدفع الإلكتروني",
                      style: Theme.of(context).textTheme.headline3.copyWith(
                          fontSize: ScreenHelper.screenFont(context,23),
                          color: Colors.white
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
}
