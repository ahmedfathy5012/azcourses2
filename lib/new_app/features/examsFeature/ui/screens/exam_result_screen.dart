import 'package:azcourses/new_app/features/examsFeature/ui/widgets/answer_list.dart';
import 'package:azcourses/new_app/features/examsFeature/ui/widgets/exam_result_header.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:flutter/material.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/back_bar.dart';
import 'package:azcourses/ui/widgets/global/header_back_ground.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:get_storage/get_storage.dart';


class ExamResultScreen extends StatelessWidget {
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MAINCOLOR,
      body: Stack(
        children: [
          HeaderBackGround(),
          BackBar(
            title: "نتائج الأختبار",
          ),
          Column(
            children: [
              Container(
                  width: double.infinity,
                  height: ScreenHelper.screenHeight(context, 100)
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              ScreenHelper.screenRadius(context, 30)),
                          topRight: Radius.circular(
                              ScreenHelper.screenRadius(context, 30)))),
                  child: Stack(
                    children: [
                      ListView(
                        children: [
                          SizedBox(
                            height: ScreenHelper.screenHeight(context,16),
                          ),
                          ExamResultHeader(),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context,32),
                          ),
                          resultRow(context: context),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context,24),
                          ),
                          AnswerResultsList(),
                          SizedBox(
                            height: ScreenHelper.screenHeight(context,110),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: ScreenHelper.screenHeight(context,100),
                          width: double.infinity,
                          color: Colors.white,
                          child: Center(
                            child: UsedButton(
                              title: 'تم',
                              widthFraction: 343,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget resultRow({BuildContext context}){
   return Padding(
      padding:  EdgeInsets.symmetric(
          horizontal: ScreenHelper.screenWidth(context,16)
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'الإجابات الصحيحة',
                color: LIGHTGREYCOLOR,
                fontSize: 13,
                fontW: FW.regular,
                overflow: true,
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context,5 ),
              ),
              CustomText(
                text: 'اجابات 8',
                color: MAINBlack2,
                fontSize: 18,
                fontW: FW.bold,
                overflow: true,
              ),
            ],
          ),
          SizedBox(
            width: ScreenHelper.screenWidth(context,90),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'الإجابات الخاطئة',
                color: LIGHTGREYCOLOR,
                fontSize: 13,
                fontW: FW.regular,
                overflow: true,
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context,5 ),
              ),
              CustomText(
                text: 'اجابات 8',
                color: MAINBlack2,
                fontSize: 18,
                fontW: FW.bold,
                overflow: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
