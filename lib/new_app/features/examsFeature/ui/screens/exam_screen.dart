
import 'package:azcourses/new_app/features/examsFeature/ui/screens/question_screen.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/back_bar.dart';
import 'package:azcourses/ui/widgets/global/header_back_ground.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ExamScreen extends StatelessWidget {
  GetStorage _box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MAINCOLOR,
      body: Stack(
        children: [
          HeaderBackGround(),
          BackBar(
            title: "اختبار",
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
                    child: Padding(
                      padding:  EdgeInsets.symmetric(
                        horizontal: ScreenHelper.screenWidth(context,16)
                      ),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: ScreenHelper.screenHeight(context,32),
                              ),
                              CustomText(
                                text: 'اساسات و تربة رابعة مدني',
                                color: LIGHTGREYCOLOR,
                                fontSize: 13,
                                fontW: FW.regular,
                                overflow: true,
                              ),
                              SizedBox(
                                height: ScreenHelper.screenHeight(context,5 ),
                              ),
                              CustomText(
                                text: 'كويز الباب الرابع : خواص التربة النفاذة',
                                color: MAINBlack2,
                                fontSize: 18,
                                fontW: FW.bold,
                                overflow: true,
                              ),
                              SizedBox(
                                height: ScreenHelper.screenHeight(context,34),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  examInfoItem(
                                    context: context,
                                    color: MAINCOLOR,
                                    title: '${10} اسئلة',
                                    icon: 'quest.png'
                                  ),
                                  verticalDivider( context: context,),
                                  examInfoItem(
                                      context: context,
                                      color: Color(0xffF9CA24),
                                      title: '${5} دقيقة',
                                      icon: 'clock.png'
                                  ),
                                  verticalDivider( context: context,),
                                  examInfoItem(
                                      context: context,
                                      color: Color(0xffFF8FA2),
                                      title: '+${10} درجة',
                                      icon: 'cup.png'
                                  ),

                                ],
                              ),
                              SizedBox(
                                height: ScreenHelper.screenHeight(context,34),
                              ),
                              CustomText(
                                text: 'وصف الاختبار',
                                color: LIGHTGREYCOLOR,
                                fontSize: 13,
                                fontW: FW.regular,
                                overflow: true,
                              ),
                              SizedBox(
                                height: ScreenHelper.screenHeight(context,5 ),
                              ),
                              CustomText(
                                text: 'كويز البابهذا النص هو مثال لنص الوصف للكورس يمكن أن يستبدل في نفس المساحة هذا النص هو مثال لنص الوصف للكورس يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، ، لقد تم توليد هذا النص من مولد النص العربى،  الرابع : خواص التربة النفاذة',
                                color: MAINBlack2,
                                fontSize: 14,
                                fontW: FW.regular,
                              ),
                              SizedBox(
                                height: ScreenHelper.screenHeight(context,34 ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: ScreenHelper.screenHeight(context,41),
                                    width: ScreenHelper.screenHeight(context,41),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          ScreenHelper.screenHeight(context, 30)),
                                      color: MAINCOLOR
                                    ),
                                  ),
                                  SizedBox(
                                    width: ScreenHelper.screenWidth(context, 10),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: 'المحاضر',
                                        color: LIGHTGREYCOLOR,
                                        fontSize: 11,
                                        fontW: FW.light,
                                        overflow: true,
                                      ),
                                      SizedBox(
                                        height: ScreenHelper.screenHeight(context,5 ),
                                      ),
                                      CustomText(
                                        text: 'مهند طارق',
                                        color: MAINBlack2,
                                        fontSize: 12,
                                        fontW: FW.bold,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(
                              vertical: ScreenHelper.screenHeight(context, 16)
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child:false?
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  UsedButton(
                                    title: 'أبدأ الأختبار',
                                    widthFraction: 224,
                                  ),
                                  UsedButton(
                                    title: 'تخطي',
                                    widthFraction: 110,
                                    textColor: MAINCOLOR,
                                    buttonColor: MAINCOLOR.withOpacity(.3),
                                  ),
                                ],
                              ):
                              UsedButton(
                                title: 'أبدأ الأختبار',
                                widthFraction: 343,
                                onTap: (){
                                  Get.to(()=>QuestionScreen());
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget examInfoItem({@required BuildContext context , String title = '' , Color color,String icon}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: ScreenHelper.screenHeight(context, 31),
          height: ScreenHelper.screenHeight(context, 31),
          decoration: BoxDecoration(
            color: MAINCOLOR,
            borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context,30))
          ),
          child: Center(
            child: Image.asset(
              'assets/icons/${icon}',
              color: Colors.white,
              height: ScreenHelper.screenHeight(context,12),
            ),
          ),
        ),
        SizedBox(
          width: ScreenHelper.screenWidth(context,8),
        ),
        CustomText(
          text: title,
          color: MAINBlack2,
          fontW: FW.bold,
          fontSize: 14,
        ),
      ],
    );
  }

  Widget verticalDivider({BuildContext context}){
    return Container(
      height: ScreenHelper.screenHeight(context,32),
      width: ScreenHelper.screenWidth(context,1),
      color: Color(0xffE7E7E7),
    );
  }
}
