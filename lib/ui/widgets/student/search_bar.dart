import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';


class SearchBar extends StatelessWidget {
  final Function onChanged;


  SearchBar({this.onChanged});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: ScreenHelper.screenWidth(context, 335),
      height: ScreenHelper.screenHeight(context, 70),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xff67676717),
              spreadRadius: .5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(
              ScreenHelper.screenRadius(context, 10)))),
      child: Padding(
        padding: EdgeInsets.only(
          right: ScreenHelper.screenWidth(context, 17),
          left: ScreenHelper.screenWidth(context, 10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: ScreenHelper.screenWidth(context,240),
              child: TextField(
                // enabled: false,
                style:
                Theme.of(context).textTheme.headline2.copyWith(
                    fontSize: ScreenHelper.screenFont(context, 14),
                    color: MAINCOLOR),

                onChanged: (value){
                   onChanged(value);
                },
                autofocus: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "ابحث عن كورس معين او معيد",
                  hintStyle: Theme.of(context).textTheme.headline2.copyWith(
                      fontSize: ScreenHelper.screenFont(context, 14),
                      color: DARKCOLOR),
                ),
              ),
            ),
            Container(
              height: ScreenHelper.screenWidth(context, 42),
              width: ScreenHelper.screenWidth(context, 42),
              child: Center(
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                  color: MAINCOLOR,
                  borderRadius: BorderRadius.all(Radius.circular(
                      ScreenHelper.screenRadius(context, 10)))),
            ),
          ],
        ),
      ),
    );
  }
}
