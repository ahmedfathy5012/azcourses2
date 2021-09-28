import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:azcourses/utils/image_network.dart';
import 'package:flutter/material.dart';

class PersonRow extends StatelessWidget {
  final String image;
  final String title;
  final String time;

  PersonRow({this.image='', this.title='', this.time=''});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: ScreenHelper.screenHeight(context, 44),
          width: ScreenHelper.screenHeight(context, 44),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
          ),
          child: ImageNetwork(
            height: ScreenHelper.screenHeight(context, 44),
            width: ScreenHelper.screenHeight(context, 44),
            url: image,
          ),
        ),
        SizedBox(
          width: ScreenHelper.screenWidth(context,8),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: title,
              fontSize: 15,
              color: MAINBlack,
              fontW: FW.bold,
            ),
            SizedBox(
              height: ScreenHelper.screenHeight(context, 2),
            ),
            CustomText(
              text:time,
              fontSize: 11,
              color: DISABLENAVBARCOLOR,
              fontW: FW.light,
            ),
          ],
        ),
        Spacer(),
        GestureDetector(
          onTap: (){
            print('pressed');
          },
          child: Container(
            color: Colors.transparent,
            width: ScreenHelper.screenHeight(context,18),
            height: ScreenHelper.screenHeight(context,18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xffB0B0B0),
                      radius: ScreenHelper.screenHeight(context, 2),
                    ),
                    CircleAvatar(
                      backgroundColor: Color(0xffB0B0B0),
                      radius: ScreenHelper.screenHeight(context, 2),
                    ),
                    CircleAvatar(
                      backgroundColor: Color(0xffB0B0B0),
                      radius: ScreenHelper.screenHeight(context, 2),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
