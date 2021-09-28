import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/ui/widgets/global/circular_icon.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';


class IconWithTitle extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;


  IconWithTitle({this.icon='', this.title='', this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap??(){},
      child: Container(
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularIcon(icon:icon),
            SizedBox(
              width: ScreenHelper.screenWidth(context,8),
            ),
            CustomText(
              text: title,
              fontW: FW.regular,
              color: TAGCOLOR,
              fontSize: 14,
            )
          ],
        ),
      ),
    );
  }
}
