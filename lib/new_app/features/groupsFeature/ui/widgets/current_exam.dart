import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/new_app/bloc/model/exam.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrentExam extends StatelessWidget {
  final double width;
   final Function onTap;
   final Exam exam;
  CurrentExam({this.width=232,this.onTap,this.exam});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap?? (){
        print("done");
      },
      child: Container(
        width: ScreenHelper.screenWidth(context, width),
        height: ScreenHelper.screenHeight(context, 100),
        decoration: BoxDecoration(
            color: Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context,15 ))
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(
             horizontal: ScreenHelper.screenWidth(context,16)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: ScreenHelper.screenHeight(context,57),
                    width: ScreenHelper.screenWidth(context,2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context, 5)),
                      color: TAGCOLOR,
                    ),
                  ),
                  SizedBox(width: ScreenHelper.screenWidth(context,12),),
                  Container(
                    width: ScreenHelper.screenHeight(context,width-50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: ScreenHelper.screenHeight(context,width-50),
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: ScreenHelper.screenHeight(context,width/1.8),
                                color: Colors.transparent,
                                child: CustomText(
                                  text: exam.title??'',
                                  overflow: true,
                                  fontSize: 16,
                                  color: MAINBlack,
                                  fontW: FW.regular,
                                ),
                              ),
                              Container(
                                height: ScreenHelper.screenHeight(context,23),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context,25)),
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context,16)),
                                  child: Center(
                                    child: CustomText(
                                      text: '0:59',
                                      color: MAINBlack,
                                      fontW: FW.regular,
                                      fontSize: 9,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: ScreenHelper.screenHeight(context,3),),
                        Container(
                          width: ScreenHelper.screenHeight(context,width-10),
                          color: Colors.transparent,
                          child: CustomText(
                            text: exam.description??'',
                            overflow: true,
                            fontSize: 11,
                            color: LIGHTGREYCOLOR,
                            fontW: FW.light,
                            maxLines: 2,
                          ),
                        ),
                        SizedBox(height: ScreenHelper.screenHeight(context,4),),
                        Container(
                          width: ScreenHelper.screenHeight(context,width-10),
                          color: Colors.transparent,
                          child: CustomText(
                            text: '${exam.from??''} - ${exam.to??''}',
                            overflow: true,
                            fontSize: 14,
                            color: Color(0xff858585),
                            fontW: FW.regular,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
