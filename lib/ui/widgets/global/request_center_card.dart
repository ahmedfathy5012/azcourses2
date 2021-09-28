import 'package:flutter/material.dart';
import 'package:azcourses/bloc/model/center_model.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/utils/constants.dart';

class RequestCenterCard extends StatelessWidget {
  final CenterModel centerModel;


  RequestCenterCard({this.centerModel});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenHelper.screenHeight(context, 180),
      width: ScreenHelper.screenWidth(context, 335),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.circular(ScreenHelper.screenRadius(context, 15))),
      //  border: Border.all(color: ULTRAGREYCOLOR, width: 1),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: ScreenHelper.screenWidth(context, 16),
            right: ScreenHelper.screenWidth(context, 16),
            top: ScreenHelper.screenHeight(context, 16)),
        child: Column(
          children: [
            Row(
              textDirection: TextDirection.rtl,
              children: [
                CircleAvatar(
                  radius: ScreenHelper.screenHeight(context, 35),
                  backgroundImage: NetworkImage(
                      // "https://desertskiesumc.org/wp-content/uploads/2019/10/DF66082D-2455-449C-A60A-0527D84DC1F1.jpeg"
                      centerModel.image
                  ),

                  backgroundColor: MAINCOLOR,
                ),
                SizedBox(
                  width: ScreenHelper.screenWidth(context, 16),
                ),
                Column(
                  textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      // "سنتر ون",
                      centerModel.name,
                      style: Theme.of(context).textTheme.headline3.copyWith(
                          color: BLACKCOLOR,
                          fontSize: ScreenHelper.screenFont(context, 15)),
                    ),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 5),
                    ),
                    Text(
                      // "مركز دريم لكورسات الهندسية",
                        centerModel.description,
                      style: Theme.of(context).textTheme.headline2.copyWith(
                          color: BLACKCOLOR,
                          fontSize: ScreenHelper.screenFont(context, 13)),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: ScreenHelper.screenHeight(context, 18),
            ),
            TitleWithIcon(
                context: context,
                // title: "المنصورة,حي الجامعة ش البدراوي",
                title: centerModel.address,
                icon: "assets/reicons/location.png"),
            SizedBox(
              height: ScreenHelper.screenHeight(context, 8),
            ),
            TitleWithIcon(
                context: context,
                title: "المنصورة,حي الجامعة ش البدراوي",
                icon: "assets/reicons/paper.png"),
            SizedBox(
              height: ScreenHelper.screenHeight(context, 8),
            ),
            // TitleWithIcon(
            //     context: context,
            //     // title: "المنصورة,حي الجامعة ش البدراوي",
            //     title: "${centerModel.visitors} مشترك",
            //     icon: "assets/reicons/group.png"),
          ],
        ),
      ),
    );
  }

  Widget TitleWithIcon({BuildContext context, String title, String icon}) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        SquareImageContainer(size: 15.0, image: AssetImage(icon)),
        SizedBox(
          width: ScreenHelper.screenWidth(context, 8),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headline1.copyWith(
              fontSize: ScreenHelper.screenFont(context, 11),
              color: BLACKCOLOR),
        ),
      ],
    );
  }
}
