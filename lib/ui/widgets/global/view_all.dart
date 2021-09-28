import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import '../../../helpers/screen_helper.dart';
class ViewAll extends StatelessWidget {
  String title;
  String navigateTitle;
  double padding;
  Function onNavigateTap;
  bool isViewAll;
  ViewAll({this.isViewAll=true,this.title, this.navigateTitle="عرض الكل",this.padding=16.0,this.onNavigateTap});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenHelper.screenWidth(context,padding)),
        child: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: Theme.of(context).textTheme.headline2.copyWith(
              fontSize: ScreenHelper.screenFont(context, 16.0),
              color: DARKBLACKCOLOR
            ),),
            isViewAll?
            GestureDetector(
              onTap: onNavigateTap,
              child: Row(
                children: [
                  Text(navigateTitle,
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.headline1.copyWith(
                    fontSize: ScreenHelper.screenFont(context, 13),
                    color: MAINCOLOR
                  ),),
                  SizedBox(width: ScreenHelper.screenWidth(context, 5.0),),
                  Icon(Icons.arrow_forward,color: MAINCOLOR,size: ScreenHelper.screenWidth(context, 11.0),)
                ],
              ),
            ):
                SizedBox(
                  width: 0,
                ),
          ],
        ),
      ),
    );
  }
}
