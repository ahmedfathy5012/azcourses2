import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/tag_widget.dart';
import 'package:flutter/material.dart';


class TagList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenHelper.screenHeight(context,28),
      child: ListView.separated(
          itemBuilder: (context, index) => TagWidget(
            title: 'طرق',
          ),
          separatorBuilder: (context, index) => SizedBox(width: ScreenHelper.screenWidth(context,8),),
          itemCount: 100,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
      ),
    );
  }
}
