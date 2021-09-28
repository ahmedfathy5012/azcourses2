import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final double height;


  EmptyWidget({this.image, this.title='', this.subtitle='',this.height=190});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/icons/$image',
          height: ScreenHelper.screenHeight(context,190),
          width: ScreenHelper.screenWidth(context,300),
        ),
        SizedBox(
          height: ScreenHelper.screenHeight(context,32.5),
        ),
        Container(
          width: ScreenHelper.screenWidth(context,250),
          child: Center(
            child: CustomText(
              textAlign: TextAlign.center,
              text: title??"",
              color: BLACKCOLOR,
              fontSize: 18,
              fontW: FW.bold,
            ),
          ),
        ),
        SizedBox(
          height: ScreenHelper.screenHeight(context,8),
        ),
        Container(
          width: ScreenHelper.screenWidth(context,250),
          child: Center(
            child: CustomText(
              textAlign: TextAlign.center,
              text: subtitle??'',
              color: Color(0xff858585),
              fontSize: 13,
              fontW: FW.regular,
            ),
          ),
        ),
      ],
    );
  }
}
