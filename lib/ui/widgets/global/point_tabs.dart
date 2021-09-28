

import 'package:flutter/material.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/student/buy_point.dart';
import 'package:azcourses/ui/screens/student/point_transefer_screen.dart';
import 'package:azcourses/ui/widgets/global/point_history.dart';
import 'package:azcourses/ui/widgets/global/teacher_videos.dart';
import 'package:azcourses/utils/constants.dart';

class PointTabs extends StatefulWidget {
  @override
  _PointTabsState createState() => _PointTabsState();
}

class _PointTabsState extends State<PointTabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: TabBar(
            indicatorColor: MAINCOLOR,
            labelColor: MAINCOLOR,
            unselectedLabelColor: GREYCOLOR,
            labelStyle: Theme.of(context).textTheme.headline2.copyWith(
              fontSize: ScreenHelper.screenFont(context, 14),
            ),
            tabs: [
              Tab(
                text: "تاريخ النقاط",
              ),
              Tab(
                text: "شراء النقاط",
              ),
              Tab(
                text: "تحويل النقاط",
              ),
            ],
          ),
          body: TabBarView(
            children: [
              PointHistory(),
              BuyPoint(),
              PointTransferScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
