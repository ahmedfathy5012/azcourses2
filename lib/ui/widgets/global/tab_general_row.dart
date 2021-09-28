import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/controller/home_controller.dart';
import 'package:azcourses/bloc/controller/inner_general_controller.dart';
import 'package:azcourses/bloc/model/category.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/box_container.dart';
import 'package:azcourses/utils/constants.dart';


class TabGeneralRow extends StatefulWidget {
  List<Category> categories;

  TabGeneralRow({this.categories});

  @override
  _TabRowState createState() => _TabRowState();
}

class _TabRowState extends State<TabGeneralRow> {

  InnerGeneralController _innerGeneralController = Get.put(InnerGeneralController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.separated(
        shrinkWrap: true,
//        itemCount: widget.categories.length,
        itemCount: widget.categories.length,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GetBuilder<InnerGeneralController>(
          builder: (_) => GestureDetector(
            onTap: () {
              _.setTabsIndex(index);
            },
            child: Column(
              children: [
                Text(
//                  widget.categories[index].name,
                  widget.categories[index].name,
                  style: Theme.of(context).textTheme.headline3.copyWith(
                        fontSize: ScreenHelper.screenFont(
                            context, _.tabIndex == index ? 20 : 15),
                        color: _.tabIndex == index
                            ? DARKBLACKCOLOR
                            : GREYCOLOR,
                      ),
                ),
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 5),
                ),
                _.tabIndex == index
                    ? Container(
                        height: ScreenHelper.screenHeight(context, 5),
                        width: ScreenHelper.screenHeight(context, 5),
                        decoration: BoxDecoration(
                            color: DARKBLACKCOLOR,
                            borderRadius: BorderRadius.all(Radius.circular(
                                ScreenHelper.screenWidth(context, 5)))),
                      )
                    : SizedBox(
                        height: 0.0,
                      ),
              ],
            ),
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: ScreenHelper.screenWidth(context, 10),
        ),
      ),
    );
  }
}
