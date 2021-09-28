import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';

class MainArchievedExamItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icons;
  final Function onTap;

  MainArchievedExamItem({this.title='', this.subtitle='', this.icons='',this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap??(){

      },
      child: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: ScreenHelper.screenWidth(context,16)
        ),
        child: Container(
          width: ScreenHelper.screenWidth(context,323),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Color(0xffE6E6E6)
            ),
            borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context,13)),
            color: Colors.transparent
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenHelper.screenWidth(context,16),
              vertical: ScreenHelper.screenHeight(context,16)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: ScreenHelper.screenHeight(context,27),
                  backgroundColor: TAGCOLOR,
                  child: Image.asset(
                    'assets/icons/${icons}',
                    color: Colors.white,
                    height: ScreenHelper.screenHeight(context,24),
                  ),
                ),
                SizedBox(
                  width: ScreenHelper.screenWidth(context,10),
                ),
                Container(
                  width: ScreenHelper.screenWidth(context,200),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                          text: title,
                          color: MAINBlack2,
                          fontW: FW.semibold,
                          fontSize: 18,
                      ),
                      SizedBox(
                        height: ScreenHelper.screenHeight(context,1),
                      ),
                      CustomText(
                        text: subtitle,
                        color: TITLEGREYCOLOR,
                        fontW: FW.light,
                        fontSize: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
