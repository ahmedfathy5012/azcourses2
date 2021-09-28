import 'package:azcourses/new_app/features/examsFeature/ui/screens/exam_screen.dart';
import 'package:azcourses/new_app/features/examsFeature/ui/widgets/answer_list.dart';
import 'package:azcourses/new_app/features/examsFeature/ui/widgets/exam_result_header.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/ui/widgets/global/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/back_bar.dart';
import 'package:azcourses/ui/widgets/global/header_back_ground.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class BuildCustomExam extends StatelessWidget {
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MAINCOLOR,
      body: Stack(
        children: [
          HeaderBackGround(),
          BackBar(
            title: "أختبر نفسك",
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
                        horizontal: ScreenHelper.screenWidth(context, 16)
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: ScreenHelper.screenHeight(context,24),),
                          CustomText(
                            text: 'عدد الأسئلة',
                            color: MAINBlack2,
                            fontW: FW.semibold,
                            fontSize: 16,
                          ),
                          SizedBox(height: ScreenHelper.screenHeight(context,16),),
                          Form(
                            child: TextFormField(
                              style: TextStyle(
                                  color: MAINBlack2,
                                  fontSize: ScreenHelper.screenHeight(context,16),
                                  fontFamily: 'simebold'
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'أدخل عدد الأسئلة',
                                hintStyle:  TextStyle(
                                    color: Color(0xffB5B5B5),
                                    fontSize: ScreenHelper.screenHeight(context,16),
                                    fontFamily: 'regular'
                                ),
                                errorBorder: UnderlineInputBorder(borderSide: BorderSide(color:Colors.red,)),
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color:Color(0xffB5B5B5),)),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color:Color(0xffB5B5B5),)),
                              ),
                            ),
                          ),
                          SizedBox(height: ScreenHelper.screenHeight(context,32),),
                          CustomText(
                            text: 'مستوي الأختبار',
                            color: MAINBlack2,
                            fontW: FW.semibold,
                            fontSize: 16,
                          ),
                          SizedBox(height: ScreenHelper.screenHeight(context,16),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              difficultyLevel(context: context,title: 'سهل'),
                              difficultyLevel(context: context,title: 'متوسط',active: true),
                              difficultyLevel(context: context,title: 'صعب'),
                            ],
                          ),
                          SizedBox(height: ScreenHelper.screenHeight(context,32),),
                          CustomText(
                            text: 'مدة الأختبار',
                            color: MAINBlack2,
                            fontW: FW.semibold,
                            fontSize: 16,
                          ),
                          SizedBox(height: ScreenHelper.screenHeight(context,16),),
                          durationGrid(context: context),
                        ],
                      ),
                    ),
                  ),
                ),
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
                  onTap: (){
                    Get.to(()=>ExamScreen());
                  },
                  title: 'ابدأ الأختبار',
                  widthFraction: 343,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget difficultyLevel({@required BuildContext context,String title = '' , Function onTap,bool active  = false}){
    return GestureDetector(
      onTap: onTap??(){},
      child: Container(
        height: ScreenHelper.screenHeight(context,85.5),
        width: ScreenHelper.screenWidth(context,103.67),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ScreenHelper.screenWidth(context,5)),
          color: active ? TAGCOLOR : Colors.transparent,
          border: Border.all(color: active ? Colors.transparent:Color(0xffDBDBDB),width: 1)
        ),
        child: Center(
          child: CustomText(
            text: title,
            fontSize: 14,
            fontW: FW.regular,
            color: active ? Colors.white : Color(0xff707070),
          ),
        ),
      ),
    );
  }

  Widget examDuration({@required BuildContext context,int duration = 5 , Function onTap,bool active  = false}){
    return GestureDetector(
      onTap: onTap??(){},
      child: Container(
        height: ScreenHelper.screenHeight(context,40),
        width: ScreenHelper.screenWidth(context,78.75),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ScreenHelper.screenWidth(context,5)),
            color: active ? TAGCOLOR : Colors.transparent,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: duration.toString(),
                fontSize: 13,
                fontW: FW.regular,
                color: active ? Colors.white : Color(0xff707070),
              ),
              SizedBox(width: ScreenHelper.screenWidth(context, 2),),
              CustomText(
                text: 'دقيقة',
                fontSize: 13,
                fontW: FW.regular,
                color: active ? Colors.white : Color(0xff707070),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget durationGrid({@required BuildContext context , }){
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: ScreenHelper.screenWidth(context, 9),
            mainAxisSpacing: ScreenHelper.screenHeight(context, 9),
            childAspectRatio: 1.5
        ),
        itemBuilder: (context, index) => examDuration(
            context: context,
            duration: index+5 ,
            active: true ,
            onTap: (){}
            ),
        shrinkWrap: true,
        itemCount: 10,
    );
  }
}
