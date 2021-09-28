import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:azcourses/bloc/model/course.dart';
import 'package:azcourses/bloc/model/video_model.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/play_icon.dart';
import 'package:azcourses/utils/constants.dart';
// import 'package:video_player/video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
class VideoGeneralCart extends StatefulWidget {
  Course course;
  double height;
  Function onTap;
  double width;
  VideoGeneralCart(
      {this.width = 219, this.course, this.height, this.onTap});

  @override
  _VideoGeneralCartState createState() => _VideoGeneralCartState();
}

class _VideoGeneralCartState extends State<VideoGeneralCart> {
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: ScreenHelper.screenWidth(context, widget.width),
//              height: ScreenHelper.screenHeight(context, 174),
              height: widget.height * .5,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(ScreenHelper.screenRadius(context, 15))),
//                 image: DecorationImage(
// //                    image: NetworkImage(widget.videoModel.image),
//                     image: NetworkImage(
//                         // "https://files.elnashra.com/elnashra/pictures/4213882_1422469842.jpg"
//                       widget.course.image
//                     ),
//                     fit: BoxFit.cover),
              ),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    width: ScreenHelper.screenWidth(context, widget.width),
                    fit: BoxFit.cover,
                    imageUrl: widget.course.image,
                    placeholder: (context, url) => Center(child:
                    Image.asset(
                      "assets/reicons/videoplace.png",
                      height: widget.height * .3,
                    )
                    ),
                    errorWidget: (context, url, error) => Center(child:
                    Image.asset(
                      "assets/reicons/videoplace.png",
                      height: widget.height * .3,
                    )
                    ),
                  ),
                  Center(
                    child: PlayIcon(
                      onTap: widget.onTap,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenHelper.screenHeight(context, widget.height / 22),
            ),
            Text(
             widget.course.subject,
//               "الخرسانه",
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.headline1.copyWith(
                    color: MAINCOLOR,
//                  fontSize: ScreenHelper.screenWidth(context, 10)
                    fontSize: widget.height / 22,
                  ),
            ),
            SizedBox(
              height: widget.height / 35,
            ),
            Container(
              width: ScreenHelper.screenWidth(context, 189),
              child: Text(
               widget.course.description,
                // "وصف للكورس وصف للكورس وصف للكورس ",
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.headline3.copyWith(
                      color: DARKBLACKCOLOR,
//                    fontSize: ScreenHelper.screenWidth(context, 14)
                      fontSize: widget.course.description.length > 14
                          ? widget.height / 22
                          : widget.height / 19,
                    ),
              ),
            ),
            SizedBox(
              height: widget.height / 25,
            ),
            Container(
              width: widget.width - 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    // "2h 32m",
                 " ",
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          color: MAINCOLOR,
                          fontSize: widget.height / 24,
                        ),
                  ),
                  Row(
                    children: [
                      Text(
                        // "200",
                        widget.course.points.toString(),
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context).textTheme.headline3.copyWith(
                              color: DARKBLACKCOLOR,
                              fontSize: widget.height / 19,
                            ),
                      ),
                      SizedBox(
                        width: ScreenHelper.screenWidth(context, 5),
                      ),
                      Text(
                        "نقطة",
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context).textTheme.headline1.copyWith(
                              color: DARKBLACKCOLOR,
                              fontSize: widget.height / 30,
                            ),
                      ),
                    ],
                  )
//                  Text(
//                    "مجانا",
//                    textDirection: TextDirection.rtl,
//                    style: Theme.of(context).textTheme.headline3.copyWith(
//                          color: DARKBLACKCOLOR,
//                          fontSize: widget.height / 19,
//                        ),
//                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
