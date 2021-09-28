import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:flutter/material.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/point_tabs.dart';
import 'package:azcourses/ui/widgets/global/teacher_tabs.dart';

class PointSheet extends StatefulWidget {
  @override
  _PointSheetState createState() => _PointSheetState();
}

class _PointSheetState extends State<PointSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: ScreenHelper.screenHeight(context, 580),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(ScreenHelper.screenWidth(context, 27)),
          topLeft: Radius.circular(ScreenHelper.screenWidth(context, 27)),
        ),
      ),
      child: Center(
        child: SquareImageContainer(
          image: AssetImage("assets/images/soon.png"),
          size: 250.0,
        ),
      ),

      // Column(
      //   children: [
      //     SizedBox(height: ScreenHelper.screenHeight(context, 10),),
      //     Expanded(child: PointTabs()),
      //   ],
      // ),
    );
  }
}
