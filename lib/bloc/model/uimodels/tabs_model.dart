import 'package:flutter/cupertino.dart';

class TabModel{
  int id;
  String icon;
  Widget screen;

  TabModel({this.id, this.icon, this.screen});

}


List<TabModel> tabs = [
  TabModel(
    id: 0,
    icon: "assets/images/tab0.png",
  ),
  TabModel(
    id: 1,
    icon: "assets/images/tab1.png",
  ),
  TabModel(
    id: 2,
    icon: "assets/images/tab2.png",
  ),
  TabModel(
    id: 3,
    icon: "assets/images/tab3.png",
  ),
];