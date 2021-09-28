import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:azcourses/bloc/model/point.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/point_box.dart';
import 'package:azcourses/utils/constants.dart';




class PointState {
  String icon;
  Color color;

  PointState({this.icon, this.color});
}


List<PointState> pointState = [
  PointState(
   color: MAINCOLOR,
    icon: "assets/icons/mhfza.png"
  ),
  PointState(
      color: SECONDERYCOLOR,
      icon: "assets/icons/Send.png"
  ),
  PointState(
      color: LIGHTGREYCOLR,
      icon: "assets/icons/554.png"
  ),
];



List<Point> points = [
  Point(
    id: 0,
    title: "شراء 100 نقطة",
    date: "2/10/2020",
    state: 0
  ),
  Point(
      id: 0,
      title: "دفع 100 نقطة",
      date: "2/10/2020",
      state: 1
  ),
  Point(
      id: 0,
      title: "تحويل 100 نقطة",
      date: "2/10/2020",
      state: 2
  ),
  Point(
      id: 0,
      title: "شراء 100 نقطة",
      date: "2/10/2020",
      state: 0
  ),
  Point(
      id: 0,
      title: "دفع 100 نقطة",
      date: "2/10/2020",
      state: 1
  ),
];

class PointHistory extends StatefulWidget {
  @override
  _PointHistoryState createState() => _PointHistoryState();
}

class _PointHistoryState extends State<PointHistory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
        top: ScreenHelper.screenHeight(context,16)
      ),
      child: ListView.separated(
          itemBuilder: (context, index) => Padding(
            padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context,16)),
            child: pointHistoryItem(point: points[index]),
          ),
          separatorBuilder: (context, index) => Divider(color: GREYCOLOR,),
          itemCount: points.length
      ),
    );
  }


  Widget pointHistoryItem({Point point}){
    return Container(
      color: Colors.transparent,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                PointBox(color: pointState[point.state].color,icon: pointState[point.state].icon,),
                SizedBox(
                  width: ScreenHelper.screenWidth(context, 15),
                ),
                Column(
                  textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      point.date,
                      style: Theme.of(context).textTheme.headline2.copyWith(
                          fontSize: ScreenHelper.screenFont(context,8),
                          color: GREYCOLOR
                      ),
                    ),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 6),
                    ),
                    Text(
                      point.title,
                      style: Theme.of(context).textTheme.headline3.copyWith(
                          fontSize: ScreenHelper.screenFont(context,16),
                          color: DARKBLUECOLR
                      ),
                    ),

                  ],
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: DARKBLUECOLR,
              size: ScreenHelper.screenWidth(context,15),
            ),
          ],
       ),
    );
  }



}
