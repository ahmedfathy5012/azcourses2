import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/new_app/bloc/model/subject.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';

class SubjectItem extends StatelessWidget {
  final Function onTap;
  final Subject subject;
  SubjectItem({this.onTap , this.subject});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap??(){},
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context,3)),
            color: MAINCOLOR
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: ScreenHelper.screenWidth(context, 75),
              child: CustomText(
                text: subject.title,
                color: Colors.white,
                fontSize: 13,
                fontW: FW.semibold,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: ScreenHelper.screenHeight(context,2),
            ),
            Container(
              width: ScreenHelper.screenWidth(context, 75),
              child: CustomText(
                text: '5 ملزمة',
                color: Colors.white,
                fontSize: 7,
                fontW: FW.light,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
