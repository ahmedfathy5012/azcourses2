import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';

class AnswerItem extends StatelessWidget {
  final Function onTap;
  final bool active;

  AnswerItem({this.onTap,this.active=true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap??(){},
      child: Container(
        height: ScreenHelper.screenHeight(context, 61),
        width: ScreenHelper.screenWidth(context,343),
        decoration: BoxDecoration(
            color: active ? Color(0xff18C763) : Colors.transparent,
            borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context,9)),
            border: Border.all(width: 1.5,color: Color(0xffD4D4D4))
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenHelper.screenWidth(context, 16)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'أ - هاري كين',
                color: active ? Colors.white : MAINBlack2,
                fontSize: 16,
                fontW: FW.bold,
              ),
              Image.asset(
                'assets/icons/truecircle.png',
                color: Colors.white,
                height: ScreenHelper.screenHeight(context,24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
