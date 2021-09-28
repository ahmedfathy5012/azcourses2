import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/controller/home_controller.dart';
import 'package:azcourses/bloc/model/category.dart';
import 'package:azcourses/helpers/screen_helper.dart';


class TabExample {
  int id;
  String title;

  TabExample({this.id, this.title});
}

List<TabExample> tabs = [
  TabExample(
    id: 1,
    title: "عربي",
  ),
  TabExample(
    id: 2,
    title: "فيزياء",
  ),
  TabExample(
    id: 3,
    title: "كيمياء",
  ),
  TabExample(
    id: 4,
    title: "فرنساوي",
  ),
];

class TabRow extends StatefulWidget {
  List<Category> categories;

  TabRow({this.categories});

  @override
  _TabRowState createState() => _TabRowState();
}

class _TabRowState extends State<TabRow> {
  int tabIndex;

  double averageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //homeController.setTabsIndex(widget.categories[0].id);
    tabIndex = 1;
    averageIndex = widget.categories.length / 2;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: ScreenHelper.screenHeight(context, 50),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: GetBuilder<HomeController>(
              builder: (_) => ListView.separated(
                shrinkWrap: true,
                itemCount: widget.categories.length,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => index > averageIndex
                    ? SizedBox(
                        width: 0,
                      )
                    : Padding(
                      padding:  EdgeInsets.only(
                       right: ScreenHelper.screenWidth(context,index==0 ? 16 :0)
                      ),
                      child: UsedButton(
                          onTap: () {
                            _.setTabsIndex(index);
                          },
                          heightFraction: 40,
                          widthFraction: 150,
                          title: widget.categories[index].name,
                        ),
                    ),

                //     GestureDetector(
                //   onTap: () {
                //     _.setTabsIndex(index);
                //   },
                //   child: Chip(
                //     backgroundColor: _.tabIndex == index
                //                   ? MAINCOLOR
                //                   : Colors.transparent,
                //     label: Padding(
                //       padding:  EdgeInsets.symmetric(
                //         horizontal: ScreenHelper.screenWidth(context, _.tabIndex == index?6:0),
                //         vertical: ScreenHelper.screenHeight(context,5)
                //       ),
                //       child: Text(
                //         widget.categories[index].name,
                //         style: Theme.of(context).textTheme.headline3.copyWith(
                //           fontSize: ScreenHelper.screenFont(
                //               context, _.tabIndex == index ? 20 : 16),
                //           color: _.tabIndex == index
                //               ? Colors.white
                //               : GREYCOLOR,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                separatorBuilder: (context, index) => SizedBox(
                  width: ScreenHelper.screenWidth(context, index > averageIndex ? 0 : 10),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: ScreenHelper.screenHeight(context, 10),
        ),
        Container(
          height: ScreenHelper.screenHeight(context, 50),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: GetBuilder<HomeController>(
              builder: (_) => ListView.separated(
                shrinkWrap: true,
                itemCount: widget.categories.length,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => index <= averageIndex
                    ? SizedBox(
                        width: 0,
                      )
                    : Padding(
                      padding:  EdgeInsets.only(
                      right: ScreenHelper.screenWidth(context,index == averageIndex+1 ? 16 :0)
                      ),
                      child: UsedButton(
                          onTap: () {
                            _.setTabsIndex(index);
                          },
                          heightFraction: 50,
                        widthFraction: 150,
                          title: widget.categories[index].name,
                        ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                  width: ScreenHelper.screenWidth(context, index <= averageIndex ? 0 : 10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
