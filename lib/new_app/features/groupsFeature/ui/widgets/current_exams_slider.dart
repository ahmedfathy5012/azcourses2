import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/new_app/bloc/model/exam.dart';
import 'package:azcourses/new_app/features/examsFeature/bloc/controller/my_current_exams_controller.dart';
import 'package:azcourses/new_app/features/examsFeature/ui/screens/exam_screen.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'current_exam.dart';
import 'online_group.dart';


class CurrentExamsSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyCurrentExamsController _MycurrentExamController = Get.put(MyCurrentExamsController());
    return  GetBuilder<MyCurrentExamsController>(
      builder: (_) =>
          _.isLoading?
              SizedBox(height: 0,):
              _.exams.isEmpty?
              SizedBox(height: 0,):
          Padding(
        padding:  EdgeInsets.symmetric(
          vertical: ScreenHelper.screenHeight(context,16)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(
                  horizontal: ScreenHelper.screenWidth(context,16)
              ),
              child: CustomText(
                text: 'امتحانات قائمة الان',
                color: MAINBlack,
                fontW: FW.semibold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: ScreenHelper.screenHeight(context,16),
            ),
            Container(
              height: ScreenHelper.screenHeight(context, 100),
              child: ListView.separated(
                itemBuilder: (context, index) => Padding(
                  padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context,16)),
                  child: CurrentExam(
                    exam: Exam(),
                    onTap: (){
                      Get.to(()=>ExamScreen());
                    },
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(width: ScreenHelper.screenWidth(context,16),),
                itemCount: 20,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
