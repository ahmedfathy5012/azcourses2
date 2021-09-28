import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';

class AnswerResultsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => Center(
          child: Container(
            width: ScreenHelper.screenWidth(context, 343),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(ScreenHelper.screenHeight(context,index==0?14:0)),
                  topRight: Radius.circular(ScreenHelper.screenHeight(context,index==0?14:0)),

                  bottomLeft:  Radius.circular(ScreenHelper.screenHeight(context,index==5?14:0)),
                  bottomRight: Radius.circular(ScreenHelper.screenHeight(context,index==5?14:0)),

                ),
                color: Color(0xffF5F5F5)
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(
                  vertical: ScreenHelper.screenHeight(context,16),
                  horizontal: ScreenHelper.screenWidth(context, 16)
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Center(
                      child: CustomText(
                        text: '${index + 1}',
                        fontW: FW.bold,
                        fontSize: 15,
                        color: MAINBlack2,
                      ),
                    ),
                  ),
                  SizedBox(width: ScreenHelper.screenWidth(context,10),),
                  Column(
                    children: [
                      Container(
                        width: ScreenHelper.screenWidth(context,258),
                        child: CustomText(
                          text: 'من هو هداف الدوري الإنجليزي الممتاز لموسم2019-2020',
                          fontSize: 14,
                          color: Color(0xff707070),
                          fontW: FW.regular,
                        ),
                      ),
                      SizedBox(height: ScreenHelper.screenHeight(context, 4),),
                      Container(
                        width: ScreenHelper.screenWidth(context,257),
                        child: CustomText(
                          text: 'محمد صلاح',
                          fontSize: 14,
                          color: MAINBlack2,
                          fontW: FW.semibold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(height: 0.0,),
        itemCount: 6,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true
    );
  }
}
