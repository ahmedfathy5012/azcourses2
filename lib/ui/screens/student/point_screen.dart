import 'package:azcourses/ui/screens/global/soon_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/header_back_ground.dart';
import 'package:azcourses/ui/widgets/global/point_sheet.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/utils/constants.dart';

class PointScreen extends StatefulWidget {
  @override
  _PointScreenState createState() => _PointScreenState();
}

class _PointScreenState extends State<PointScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: MAINCOLOR,
        body: Stack(
          children: [
            HeaderBackGround(),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: ScreenHelper.screenHeight(context, 100),
                ),
                Expanded(
                  child: PointSheet(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
