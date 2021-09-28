import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/new_app/bloc/model/live_lesson.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/ui/widgets/global/day_card.dart';
import 'package:azcourses/ui/widgets/global/online_group_button.dart';
import 'package:azcourses/ui/widgets/global/share_button.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';

class LiveSession extends StatelessWidget {
  LiveLesson liveLesson;
  final Function onTap;

  LiveSession({this.liveLesson,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap??(){
        print("done");
      },
      child: Container(
        width: ScreenHelper.screenWidth(context, 343),
          // height: ScreenHelper.screenHeight(context, 132),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          // color: Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context,15 )),
          border: Border.all(
            width: 1,
          color: TAGCOLOR
        ),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: ScreenHelper.screenWidth(context,16),
            vertical: ScreenHelper.screenHeight(context,16)
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
                  SizedBox(width: ScreenHelper.screenWidth(context,12),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: ScreenHelper.screenHeight(context,245),
                        color:  Colors.transparent,
                        child: Row(

                          children: [
                            Container(
                              width: ScreenHelper.screenHeight(context,130),
                              color: Colors.transparent,
                              child: CustomText(
                                text: liveLesson.title,
                                overflow: true,
                                fontSize: 16,
                                color: MAINBlack,
                                fontW: FW.regular,
                              ),
                            ),
                            Spacer(),
                            OnlineGroupButton(),
                            SizedBox(width: ScreenHelper.screenWidth(context,4),),
                            ShareButton(),
                          ],
                        ),
                      ),
                      SizedBox(height: ScreenHelper.screenHeight(context,10),),
                      DayCard(
                        showDate: '${liveLesson.day??''}-${liveLesson.hour??""}',
                      ),
                      SizedBox(
                        height: ScreenHelper.screenHeight(context, 16),
                      ),
                      Row(
                        children: [
                          groupInfo(context: context,title: liveLesson.lecturerName,icon: 'grouplec.png'),
                          SizedBox(width: ScreenHelper.screenWidth(context,26),),
                          // groupInfo(context: context,title: '${liveLesson.} عضو مشترك',icon: 'groupperson.png'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }

   Widget groupInfo({BuildContext context,String icon='', String title=''}){
    return Row(
      children: [
        Image.asset(
          'assets/icons/$icon',
          height: ScreenHelper.screenHeight(context,16),
          color: TITLEGREYCOLOR,
        ),
        SizedBox(width: ScreenHelper.screenWidth(context,4),),
        CustomText(
          text: title,
          color: TITLEGREYCOLOR,
        ),
      ],
    );
   }

}
