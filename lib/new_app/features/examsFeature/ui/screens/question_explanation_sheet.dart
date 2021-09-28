
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/new_app/features/libraryFeature/ui/widgets/subject_grid.dart';
import 'package:azcourses/new_app/features/libraryFeature/ui/widgets/subject_item.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/ui/widgets/new_widgets/sheet_header.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:azcourses/utils/image_network.dart';
import 'package:flutter/material.dart';

class QuestionExplanationSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: ScreenHelper.screenHeight(context,790),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft:  Radius.circular(ScreenHelper.screenHeight(context,31)),
              topRight: Radius.circular(ScreenHelper.screenHeight(context,31))
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: ScreenHelper.screenHeight(context,16),
            ),
            SheetHeader(title: 'توضيح الإجابة',),
            SizedBox(
              height: ScreenHelper.screenHeight(context,10),
            ),
            Expanded(
              child: Padding(
                  padding:  EdgeInsets.symmetric(
                      horizontal: ScreenHelper.screenWidth(context,16)
                  ),
                  child: ListView(
                    children: [
                      Container(
                        width: ScreenHelper.screenWidth(context,343),
                        child: CustomText(
                          text: 'من هو هداف الدوري الإنجليزي الممتاز  لموسم 2019 - 2020  ',
                          fontW: FW.regular,
                          fontSize: 16,
                          color: MAINBlack2,
                        ),
                      ),
                      SizedBox(
                        height: ScreenHelper.screenHeight(context,8),
                      ),
                      Container(
                        width: ScreenHelper.screenWidth(context,343),
                        child: CustomText(
                          text: 'محمد صلاح',
                          fontW: FW.bold,
                          fontSize: 20,
                          color: MAINBlack2,
                        ),
                      ),
                      SizedBox(
                        height: ScreenHelper.screenHeight(context,24),
                      ),
                      Container(
                        height: ScreenHelper.screenHeight(context, 166),
                        width: ScreenHelper.screenWidth(context, 343),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context, 10)),
                        ),
                        child: ImageNetwork(
                          url: 'https://images.unsplash.com/photo-1632203172046-004f674e9aac?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80',
                          height: ScreenHelper.screenHeight(context, 166),
                          width: ScreenHelper.screenWidth(context, 343),
                        ),
                      ),
                      SizedBox(
                        height: ScreenHelper.screenHeight(context,24),
                      ),
                      Container(
                        width: ScreenHelper.screenWidth(context,343),
                        child: CustomText(
                          text: 'شرح الإجابة',
                          fontW: FW.regular,
                          fontSize: 13,
                          color: LIGHTGREYCOLOR,
                        ),
                      ),
                      SizedBox(
                        height: ScreenHelper.screenHeight(context,8),
                      ),
                      Container(
                        width: ScreenHelper.screenWidth(context,343),
                        child: CustomText(
                          text: 'هذا النص هو مثال لنص الوصف للكورس يمكن أن يستبدل في نفس المساحة هذا النص هو مثال لنص الوصف للكورس يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، ، لقد تم توليد هذا النص من مولد النص العربى،  الرابع : خواص التربة النفاذة',
                          fontW: FW.regular,
                          fontSize: 9,
                          color: MAINBlack2,
                        ),
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
