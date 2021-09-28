import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/play_icon.dart';
import 'package:azcourses/utils/constants.dart';

import '../../../bloc/model/video_model.dart';

class VideoShowGrid extends StatelessWidget {
  VideoModel videoModel;
  double height;
  double width;
  Function onTap;

  VideoShowGrid({this.videoModel, this.height, this.width, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.all(
            Radius.circular(ScreenHelper.screenRadius(context, 20))),
      ),
      clipBehavior: Clip.hardEdge,
      shadowColor: SHADOWCOLOR,
      child: Padding(
        padding: EdgeInsets.all(
          width / 20,
        ),
        child: Column(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
//              width: ScreenHelper.screenWidth(context, 148),
//              height: ScreenHelper.screenHeight(context, 118),
              width: width - 20,
              height: height / 1.6,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(ScreenHelper.screenRadius(context, 20))),
                image: DecorationImage(
                    image: NetworkImage("")
//                    NetworkImage(videoModel.image)
                    ,
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: PlayIcon(
                  onTap: onTap,
                ),
              ),
            ),
            SizedBox(
              height: height / 40,
            ),
            Text(
//              videoModel.subject,
              "عربي",
              textDirection: TextDirection.rtl,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(color: MAINCOLOR, fontSize: height / 20),
            ),
            SizedBox(
              height: height / 40,
            ),
            Container(
              width: ScreenHelper.screenWidth(context, 189),
              child: Text(
//                videoModel.description,
                "وصف المدرس",
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.headline3.copyWith(
                    color: DARKBLACKCOLOR,
                    fontSize: ScreenHelper.screenWidth(context, 9)),
              ),
            ),
            SizedBox(
              height: height / 20,
            ),
            Text(
//              "2h 32m",
              "   ",
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.headline1.copyWith(
                  color: MAINCOLOR,
                  fontSize: ScreenHelper.screenWidth(context, 9)),
            ),
          ],
        ),
      ),
    );
  }
}
