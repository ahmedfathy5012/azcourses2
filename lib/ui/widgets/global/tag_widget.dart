import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/new_app/bloc/model/tag.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';

import '../customText.dart';

class TagWidget extends StatelessWidget {
  final String title;
  final Tag tag;

  TagWidget({this.title='',this.tag});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: ScreenHelper.screenWidth(context,91),
        height: ScreenHelper.screenHeight(context,28),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ScreenHelper.screenRadius(context, 66)),
            color: TAGCOLOR.withOpacity(.2)
        ),
        child: Center(
          child: CustomText(
            text: tag!=null ? tag.title : ' ',
            fontSize: 12,
            fontW: FW.regular,
            color: TAGCOLOR,
          ),
        ),
      ),
    );
  }
}
