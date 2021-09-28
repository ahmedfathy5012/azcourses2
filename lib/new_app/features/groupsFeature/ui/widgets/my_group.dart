import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/new_app/bloc/model/group.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/ui/widgets/global/day_card.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';

class MyGroup extends StatelessWidget {


  final Group group;

  MyGroup({this.group});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("done");
      },
      child: Container(
        width: ScreenHelper.screenWidth(context, 343),
          // height: ScreenHelper.screenHeight(context, 132),
        decoration: BoxDecoration(
          // color: Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context,15 )),
          border: Border.all(
            width: 1,
          color: Color(0xffEBEBEB)
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: ScreenHelper.screenHeight(context,55),
                    width: ScreenHelper.screenWidth(context,2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context, 5)),
                      color: TAGCOLOR,
                    ),
                  ),
                  SizedBox(width: ScreenHelper.screenWidth(context,12),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: ScreenHelper.screenHeight(context,170),
                        color: Colors.transparent,
                        child: CustomText(
                          text: group.title??'',
                          overflow: true,
                          fontSize: 16,
                          color: MAINBlack,
                          fontW: FW.regular,
                        ),
                      ),
                      SizedBox(height: ScreenHelper.screenHeight(context,10),),
                      Container(
                        height: ScreenHelper.screenHeight(context,26),
                        child: ListView.separated(
                            itemBuilder: (context, index) => DayCard(
                              date: group.dates[index],
                            ),
                            separatorBuilder: (context, index) => SizedBox(width: ScreenHelper.screenWidth(context,16),),
                            itemCount: group.dates.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                        ),
                      )

                    ],
                  ),
                ],
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 16),
              ),
              Row(
                children: [
                  groupInfo(context: context,title: group.lecturerName??'',icon: 'grouplec.png'),
                  SizedBox(width: ScreenHelper.screenWidth(context,26),),
                  groupInfo(context: context,title: '${group.subscribers??0} عضو مشترك',icon: 'groupperson.png'),
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
