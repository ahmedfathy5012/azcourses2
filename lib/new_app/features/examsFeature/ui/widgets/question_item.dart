import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/new_app/features/examsFeature/ui/widgets/answer_item.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';


class QuestionItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: ScreenHelper.screenWidth(context,16)
      ),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: ScreenHelper.screenHeight(context,24),
          ),
          CustomText(
            text: ' السؤال 1 من 10',
            color: LIGHTGREYCOLOR,
            fontSize: 13,
            fontW: FW.regular,
            overflow: true,
          ),
          SizedBox(
            height: ScreenHelper.screenHeight(context,5 ),
          ),
          CustomText(
            text: 'من هو هداف الدوري الإنجليزي الممتاز لموسم2019-2020',
            color: MAINBlack2,
            fontSize: 18,
            fontW: FW.bold,
          ),
          SizedBox(
            height: ScreenHelper.screenHeight(context,24),
          ),
          Container(
            // height: ScreenHelper.screenHeight(context,),
            child: ListView.separated(
              itemBuilder: (context, index) => AnswerItem(
                onTap: (){

                },
                active: false,
              ),
              separatorBuilder: (context, index) =>  SizedBox(
                height: ScreenHelper.screenHeight(context,16),
              ),
              itemCount: 4,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
            ),
          )
        ],
      ),
    );
  }
}
