import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/new_app/bloc/model/group.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';

class DayCard extends StatelessWidget {
  final GroupDate date;
  final String showDate;

  DayCard({this.date,this.showDate=' '});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenHelper.screenHeight(context,26),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context,5)),
        color: TAGCOLOR.withOpacity(.2)
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: ScreenHelper.screenWidth(context, 11)
        ),
        child: Center(
          child: CustomText(
            // text: '${date.day??''}-${date.fromTime??""}',
            text: showDate,
            color: TAGCOLOR,
            fontW: FW.regular,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
