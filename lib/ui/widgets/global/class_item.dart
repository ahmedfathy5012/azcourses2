import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:azcourses/bloc/model/class_model.dart';
import 'package:azcourses/bloc/model/video_model.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/play_icon.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/utils/constants.dart';
// import 'package:video_player/video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
class ClassItem extends StatefulWidget {
  ClassModel classModel;
  double height;
  Function onTap;
  double width;
  ClassItem({this.width = 140, this.classModel, this.height, this.onTap});

  @override
  _ClassItemState createState() => _ClassItemState();
}

class _ClassItemState extends State<ClassItem> {
  @override

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
                width: ScreenHelper.screenWidth(context, widget.width),
                height: widget.height * .5028,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(ScreenHelper.screenRadius(context, 20))),
//                   image: DecorationImage(
// //                    image: NetworkImage(widget.videoModel.image),
//                       image: NetworkImage(
//                           // "https://files.elnashra.com/elnashra/pictures/4213882_1422469842.jpg",
//                           widget.classModel.image
//                       ),
//                       fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      fit: BoxFit.cover,
                      // imageUrl:  widget.classModel.image,
                      imageUrl:  widget.classModel.image,
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
                height: ScreenHelper.screenHeight(context, 15),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "",
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          color: MAINCOLOR,
                          fontSize: widget.height / 20,
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: widget.height / 35,
              ),
              Text(
                 widget.classModel.title,
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.headline3.copyWith(
                      color: DARKBLACKCOLOR,
                      fontSize: widget.height / 15,
                    ),
              ),
              SizedBox(
                height: widget.height / 10,
              ),
              Container(
                width: widget.width - 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "${widget.classModel.videoCount} فيديو",
                          textDirection: TextDirection.rtl,
                          style: Theme.of(context).textTheme.headline1.copyWith(
                                color: Color(0xff130F40),
                                fontSize: widget.height / 20,
                              ),
                        ),
                        SizedBox(
                          width: ScreenHelper.screenWidth(context, 6),
                        ),
                        Text(
                          ".",
                          textDirection: TextDirection.rtl,
                          style: Theme.of(context).textTheme.headline1.copyWith(
                                color: Color(0xffC3C2CF),
                                fontSize: widget.height / 20,
                              ),
                        ),
                        SizedBox(
                          width: ScreenHelper.screenWidth(context, 6),
                        ),
                        Text(
                          '${(widget.classModel.mintues==null || widget.classModel.mintues==0)?" ":"${widget.classModel.mintues} m"}',
                          textDirection: TextDirection.rtl,
                          style: Theme.of(context).textTheme.headline1.copyWith(
                                color: Color(0xff01C56A),
                                fontSize: widget.height / 20,
                              ),
                        ),
                      ],
                    ),
                    true
                        ? Text(
                            widget.classModel.points!=0?widget.classModel.points.toString():"مجانا",
                            textDirection: TextDirection.rtl,
                            style: Theme.of(context).textTheme.headline3.copyWith(
                                  color: DARKBLACKCOLOR,
                                  fontSize: widget.height / 15,
                                ),
                          )
                        : Row(
                            children: [
                              Text(
                                "100",
                                textDirection: TextDirection.rtl,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(
                                      color: DARKBLACKCOLOR,
//                    fontSize: ScreenHelper.screenWidth(context, 14)
                                      fontSize: widget.height / 15,
                                    ),
                              ),
                              SizedBox(
                                width: ScreenHelper.screenWidth(context, 2),
                              ),
                              Text(
                                "جنية",
                                textDirection: TextDirection.rtl,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(
                                      color: DARKBLACKCOLOR,
//                    fontSize: ScreenHelper.screenWidth(context, 14)
                                      fontSize: widget.height / 25,
                                    ),
                              ),
                            ],
                          )
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
