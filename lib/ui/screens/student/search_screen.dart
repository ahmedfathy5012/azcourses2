import 'package:azcourses/bloc/controller/search_controller.dart';
import 'package:azcourses/bloc/model/course.dart';
import 'package:azcourses/ui/widgets/global/course_show_card.dart';
import 'package:azcourses/ui/widgets/student/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/controller/video_controller.dart';
import 'package:azcourses/helpers/get_services.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/global/request_center_screen.dart';
import 'package:azcourses/ui/screens/student/course_details_screen.dart';
import 'package:azcourses/ui/widgets/global/ViewAllHeader.dart';
import 'package:azcourses/ui/widgets/global/back_bar.dart';
import 'package:azcourses/ui/widgets/global/header_back_ground.dart';
import 'package:azcourses/ui/widgets/global/progress_widget.dart';
import 'package:azcourses/ui/widgets/global/rate_sheet.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/ui/widgets/global/viedoe_show_grid.dart';
import 'package:azcourses/utils/constants.dart';

class SearchScreenScreen extends StatefulWidget {
  List<Course> courses=[];


  SearchScreenScreen({this.courses});

  @override
  _SearchScreenScreenState createState() => _SearchScreenScreenState();
}

class _SearchScreenScreenState extends State<SearchScreenScreen> {
  @override
  Widget build(BuildContext context) {
    SearchController _searchController = Get.put(SearchController());
    return Scaffold(
      backgroundColor: MAINCOLOR,
      body: Stack(
        children: [
          HeaderBackGround(),
          BackBar(
            title: "البحث عن مدرس او كورس",
          ),
          Column(
            children: [
              Container(
                  width: double.infinity,
                  height: ScreenHelper.screenHeight(context, 150)
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              ScreenHelper.screenRadius(context, 30)),
                          topRight: Radius.circular(
                              ScreenHelper.screenRadius(context, 30)))),
                  child: Padding(
                    padding: EdgeInsets.only(
                        right:  ScreenHelper.screenWidth(context, 22),
                        left:   ScreenHelper.screenWidth(context, 22),
                        top:   ScreenHelper.screenHeight(context, 60),
                    ),
                    child: GetBuilder<SearchController>(
                      builder: (_) =>
                      _.isLoading?
                      Center(
                        child: ProgressWidget(),
                      ):
                      _.courses.isEmpty?
                      Center(
                        child: Text(
                          "لا توجد كورسات لعرضها",
                          textDirection: TextDirection.rtl,
                          style: Theme.of(context).textTheme.headline3.copyWith(
                              color: MAINCOLOR,
                              fontSize: ScreenHelper.screenFont(context, 20)),
                        ),
                      ):
                          GridView.builder(
                        itemCount: _.courses.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: .89,
                            mainAxisSpacing:
                            ScreenHelper.screenWidth(context, 21),
                            crossAxisSpacing:
                            ScreenHelper.screenHeight(
                                context, 21)),
                        itemBuilder: (context, index) => LayoutBuilder(
                            builder: (context, constraints) {
                              print(constraints.maxWidth);
                              return CourseShowCart(
                                course: _.courses[index],
                                onTap: () {
                                  Get.to(
                                      CourseDetailsScreen(
                                        course: _.courses[index],
                                      ),
                                      transition: Transition.cupertino);
                                },
                                height: constraints.maxHeight - 25,
                                width: constraints.maxWidth - 5,
                                //videoModel: videoController.videos[index],
                              );
                            }),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: ScreenHelper.screenHeight(context, 120),
              ),
              Center(
                child: SearchBar(
                  onChanged: (value){
                    // if(value.isNotEmpty && value !=null){
                      _searchController.searchCourses(searchWord: value);
                    // }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
