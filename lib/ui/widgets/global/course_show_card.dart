import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:azcourses/bloc/model/course.dart';
import 'package:azcourses/bloc/model/video_model.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/play_icon.dart';
import 'package:azcourses/utils/constants.dart';
// import 'package:video_player/video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
class CourseShowCart extends StatefulWidget {
  Course course;
  double height;
  Function onTap;
  double width;
  final bool isHome;
  CourseShowCart({this.width = 219, this.course, this.height, this.onTap,this.isHome=false});

  @override
  _CourseShowCartState createState() => _CourseShowCartState();
}

class _CourseShowCartState extends State<CourseShowCart> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
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
                 width: widget.isHome? ScreenHelper.screenWidth(context,widget.width):widget.width,
//              height: ScreenHelper.screenHeight(context, 174),
                height: widget.height * .535,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(ScreenHelper.screenRadius(context, 15))),
//                   image: DecorationImage(
// //                    image: NetworkImage(widget.videoModel.image),
//                       image: NetworkImage(
//                           // "https://files.elnashra.com/elnashra/pictures/4213882_1422469842.jpg",
//                           widget.course.image
//                       ),
//                       fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      fit: BoxFit.cover,
                       height: widget.height * .535,
                      width: widget.isHome? ScreenHelper.screenWidth(context,widget.width):widget.width,
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
                height: ScreenHelper.screenHeight(context, 10),
              ),
              Container(
                //width: widget.width-10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: widget.height * .02,
                              backgroundImage: NetworkImage(
                                  "https://files.elnashra.com/elnashra/pictures/4213882_1422469842.jpg",

                              ),
                            ),
                            SizedBox(
                              width: ScreenHelper.screenWidth(context, 5),
                            ),
                            Text(
//                          widget.videoModel.subject,
                              "بواسطة ${widget.course.publichByName}",
                              textDirection: TextDirection.rtl,
                              style:
                              Theme.of(context).textTheme.headline1.copyWith(
                                color: Color(0xffB1B1B1),
                                fontSize: widget.height / 30,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 10),
                        ),
                        Text(
               widget.course.subject,
//                         "الخرسانه",
                          textDirection: TextDirection.rtl,
                          style: Theme.of(context).textTheme.headline1.copyWith(
                            color: MAINCOLOR,
//                  fontSize: ScreenHelper.screenWidth(context, 10)
                            fontSize: widget.height / 22,
                          ),
                        ),
                      ],
                    ),
                    // GestureDetector(
                    //   onTap: () {},
                    //   child: Container(
                    //     width: widget.height * .10363,
                    //     height: widget.height * .10363,
                    //     decoration: BoxDecoration(
                    //         color: Color(0xffD4D4D4),
                    //         borderRadius: BorderRadius.all(Radius.circular(
                    //             ScreenHelper.screenRadius(context, 50)))),
                    //   ),
                    // )
                  ],
                ),
              ),
              SizedBox(
                height: widget.height / 35,
              ),
              Container(
                width: widget.width/2,
                child: Text(
                 widget.course.description??" ",
//                 "وصف للكورس  ",
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.headline3.copyWith(
                    color: DARKBLACKCOLOR,
//                    fontSize: ScreenHelper.screenWidth(context, 14)
                    fontSize: "وصف للكورس وصف للكورس وصف للكورس ".length > 14
                        ? widget.height / 22
                        : widget.height / 19,
                  ),
                ),
              ),
              SizedBox(
                height: widget.height / 25,
              ),
              Container(
                width: widget.isHome? ScreenHelper.screenWidth(context,widget.width-10):widget.width-10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                         widget.course.lecturer_name??" ",
//                         "احمد فتحي",
                          textDirection: TextDirection.rtl,
                          style: Theme.of(context).textTheme.headline1.copyWith(
                              color: DARKBLUECOLR,
                              fontSize: ScreenHelper.screenWidth(context, 10)),
                        ),
                        SizedBox(
                          width: ScreenHelper.screenWidth(context, 8),
                        ),
                        Text(
                          ".",
                          textDirection: TextDirection.rtl,
                          style: Theme.of(context).textTheme.headline3.copyWith(
                            color: GREYCOLOR,
                            fontSize: widget.height / 30,
                          ),
                        ),
                        SizedBox(
                          width: widget.height / 35,
                        ),
                        Text(
                            '${(widget.course.mintues==null || widget.course.mintues==0)?" ":"${widget.course.mintues} m"}',
//                  " ",
                          textDirection: TextDirection.rtl,
                          style: Theme.of(context).textTheme.headline1.copyWith(
                            color: MAINCOLOR,
                            fontSize: widget.height / 24,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          // "200",
                          widget.course.points.toString()??"0",
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
      ),
    );
  }
}
