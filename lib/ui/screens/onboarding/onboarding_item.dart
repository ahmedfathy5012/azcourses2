import 'package:flutter/material.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/utils/constants.dart';

import 'onboarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  int index;

  OnBoardingItem({this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: ScreenHelper.screenHeight(context, 150),
        ),
        SquareImageContainer(
          size: 200.0,
          image: AssetImage(onBoardingLists[index].image),
        ),
        SizedBox(
          height: ScreenHelper.screenHeight(context, 40),
        ),
        Text(
          onBoardingLists[index].title,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: Theme.of(context).textTheme.headline2.copyWith(
                fontSize: ScreenHelper.screenFont(context, 24),
              color: Colors.white,
              fontFamily: "simebold"
              ),
        ),
        SizedBox(
          height: ScreenHelper.screenHeight(context, 5),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenHelper.screenWidth(context, 53)),
          child:
          Text(
            onBoardingLists[index].subtitle,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                  fontSize: ScreenHelper.screenFont(context, 14),
                  color: Colors.white,
                  fontFamily: "light"
                ),
          ),
        ),
      ],
    );
  }
}
