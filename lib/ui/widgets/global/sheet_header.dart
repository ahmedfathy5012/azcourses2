import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/customText.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SheetHeader extends StatelessWidget {
  final String title;


  SheetHeader({this.title=' '});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: ScreenHelper.screenWidth(context,16),
              vertical: ScreenHelper.screenHeight(context,25),
            ),
            child: Container(
              height: ScreenHelper.screenHeight(context,28),
              width: ScreenHelper.screenHeight(context,28),
              decoration: BoxDecoration(
                color: Color(0xffF7F7F9),
                borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context,28))
              ),
              child: Center(
                child: Icon(Icons.close,color: MAINBlack,size: ScreenHelper.screenHeight(context,20),),
              )
            ),
          ),
        ),
        CustomText(
          text: title,
          color: MAINBlack,
          fontSize: 18,
          fontW: FW.semibold,
        ),
        SizedBox(
          width: ScreenHelper.screenWidth(context,28),
        ),
      ],
    );
  }
}
