import 'package:flutter/material.dart';
import 'package:azcourses/bloc/model/class_visdeo_model.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/utils/constants.dart';

class ClassVideoItem extends StatelessWidget {
  final ClassVideoModel classVideoModel;
  final bool isActive;
  ClassVideoItem({this.classVideoModel,this.isActive=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenHelper.screenHeight(context, 80),
      width: ScreenHelper.screenWidth(context, 343),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.circular(ScreenHelper.screenRadius(context, 10))),
        color: Colors.white,
        border: Border.all(color: DISABLENAVBARCOLOR, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenHelper.screenWidth(context, 16)),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor:classVideoModel.allow==1?isActive?Color(0xffF9CA24):Color(0xffDFDFDF):Color(0xffDFDFDF),
              radius: ScreenHelper.screenWidth(context, 20),
              child: Icon(
                classVideoModel.allow==1?isActive?Icons.pause:Icons.play_arrow:Icons.lock,
                color: Colors.white,
                size: ScreenHelper.screenHeight(context, 20),
              ),
            ),
            SizedBox(
              width: ScreenHelper.screenWidth(context, 10),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                classVideoModel.name??" ",
                  style: Theme.of(context).textTheme.headline2.copyWith(
                      fontSize: ScreenHelper.screenFont(context, 14.0),
                      color: DARKBLACKCOLOR),
                ),
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 3),
                ),
                Text(
                  '${(classVideoModel.mintues==null || classVideoModel.mintues==0)?" ":"${classVideoModel.mintues} m"}',
                  style: Theme.of(context).textTheme.caption.copyWith(
                      fontSize: ScreenHelper.screenFont(context, 12.0),
                      color: ULTRAGREYCOLOR),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
