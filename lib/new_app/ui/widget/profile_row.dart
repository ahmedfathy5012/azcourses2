import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';


class ProfileRow extends StatelessWidget {
  final String title;
  final Function onTap;


  ProfileRow({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap??(){},
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding:  EdgeInsets.symmetric(
            vertical: ScreenHelper.screenHeight(context,10),
            horizontal: ScreenHelper.screenWidth(context,16),
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/icons/profile1.png',
                color: MAINCOLOR,
                height: ScreenHelper.screenHeight(context,24),
              ),
              SizedBox(
                width: ScreenHelper.screenWidth(context, 10),
              ),
              CustomText(
                text: title??"",
                fontW: FW.regular,
                fontSize: 16,
                overflow: true,
                color: DARKBLACKCOLOR,
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: DARKBLACKCOLOR,
                size: ScreenHelper.screenHeight(context,23),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
