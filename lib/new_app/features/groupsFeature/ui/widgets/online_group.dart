import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/ui/widgets/global/online_group_button.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';

class OnlineGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("done");
      },
      child: Container(
        width: ScreenHelper.screenWidth(context, 343),
        height: ScreenHelper.screenHeight(context, 119),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: TAGCOLOR
          ),
          borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context,10 ))
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: ScreenHelper.screenWidth(context,16)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: ScreenHelper.screenHeight(context,46),
                    width: ScreenHelper.screenHeight(context,46),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context,40)),
                      color: Color(0xff73B6DA),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/live.png',
                        height: ScreenHelper.screenHeight(context, 24),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ScreenHelper.screenWidth(context,16),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: ScreenHelper.screenWidth(context,150),
                        color: Colors.transparent,
                        child: CustomText(
                          text: 'طرق رابعة مدني',
                          color: MAINBlack,
                          fontSize: 16,
                          fontW: FW.semibold,
                          overflow: true,
                        ),
                      ),
                      SizedBox(
                        height: ScreenHelper.screenHeight(context,10),
                      ),
                      Container(
                        width: ScreenHelper.screenWidth(context,160),
                        color: Colors.transparent,
                        child: CustomText(
                          text: 'هذا مثال لوصف  الحصة الخاصة بتلك المجموعة مثل الدرس الأول اساسات',
                          color: LIGHTGREYCOLOR,
                          fontSize: 9,
                          fontW: FW.regular,
                          maxLines: 2,
                          overflow: true,
                        ),
                      ),
                      SizedBox(
                        height: ScreenHelper.screenHeight(context,10),
                      ),
                      CustomText(
                        text:'الان',
                        color: Color(0xff858585),
                        fontSize: 10,
                        fontW: FW.regular,
                        maxLines: 2,
                        overflow: true,
                      ),
                    ],
                  ),
                  Spacer(),
                  OnlineGroupButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
