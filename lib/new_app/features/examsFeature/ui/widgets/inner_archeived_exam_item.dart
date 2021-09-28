import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';

class InnerArchievedExamItem extends StatelessWidget {
  final String title;
  final String icons;
  final Function onTap;

  InnerArchievedExamItem({this.title='', this.icons='',this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
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
              horizontal: ScreenHelper.screenWidth(context,19),
              vertical: ScreenHelper.screenHeight(context,16)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/${icons}',
                  color: TAGCOLOR,
                  height: ScreenHelper.screenHeight(context,15),
                ),
                SizedBox(
                  width: ScreenHelper.screenWidth(context,10),
                ),
                Container(
                  width: ScreenHelper.screenWidth(context,200),
                  child:  CustomText(
                    text: title,
                    color: MAINBlack2,
                    fontW: FW.semibold,
                    fontSize: 14,
                  ),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios_outlined,color: MAINBlack2,size: ScreenHelper.screenHeight(context,14),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
