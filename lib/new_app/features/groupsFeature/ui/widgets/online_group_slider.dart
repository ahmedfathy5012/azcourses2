import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';

import 'online_group.dart';


class OnlineGroupSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(
              horizontal: ScreenHelper.screenWidth(context,16)
          ),
          child: CustomText(
            text: 'مجموعات اونلين الان',
            color: MAINBlack,
            fontW: FW.semibold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: ScreenHelper.screenHeight(context,16),
        ),
        Container(
          height: ScreenHelper.screenHeight(context, 119),
          child: ListView.separated(
            itemBuilder: (context, index) => Padding(
              padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context,16)),
              child: OnlineGroup(),
            ),
            separatorBuilder: (context, index) => SizedBox(width: ScreenHelper.screenWidth(context,16),),
            itemCount: 20,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
