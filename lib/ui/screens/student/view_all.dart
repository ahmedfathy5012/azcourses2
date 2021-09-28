import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/controller/video_controller.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/student/course_details_screen.dart';
import 'package:azcourses/ui/widgets/global/ViewAllHeader.dart';
import 'package:azcourses/ui/widgets/global/progress_widget.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/ui/widgets/global/course_show_card.dart';
import 'package:azcourses/ui/widgets/global/viedoe_show_grid.dart';
import 'package:azcourses/utils/constants.dart';

class ViewAllScreen extends StatefulWidget {
  int categoryId;
  int isClosest;
  bool isSubject;
  String subject;
  bool isType;
  bool isSubType;
  String type;
  String subType;
  int typeId;
  int subTypeId;

  ViewAllScreen(
      {this.categoryId,
      this.isClosest,
      this.isSubject = false,
      this.subject,
      this.isSubType = false,
      this.isType = false,
      this.type,
      this.subType,
      this.typeId,
      this.subTypeId});

  @override
  _ViewAllScreenState createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  VideoController videoController = Get.put(VideoController());

  Future<int> fetchHome() async {
//    if (widget.isSubject) {
//      return await videoController.fetchVideosByCategoryId(
//          categoryID: widget.categoryId);
//    } else if (widget.isType) {
//      return await videoController.fetchVideosByTypeId(
//          categoryID: widget.categoryId, typeId: widget.typeId);
//    } else if (widget.isSubType) {
//      return await videoController.fetchVideosBySubTypeId(
//          categoryID: widget.categoryId,
//          subTypeId: widget.subTypeId,
//          typeId: widget.typeId);
//    } else {
//      return await videoController.fetchRecentlyVideosByCategoryId(
//          categoryID: widget.categoryId, isClosest: widget.isClosest);
//    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ViewAllHeader(
            subject: widget.subject,
            isClosest: widget.isClosest,
            isSubject: widget.isSubject,
            type: widget.type,
            subType: widget.subType,
            isType: widget.isType,
            isSubType: widget.isSubType,
          ),
          SizedBox(
            height: ScreenHelper.screenHeight(context, 10),
          ),
          FutureBuilder(
            future: fetchHome(),
            // ignore: missing_return
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(child: ProgressWidget());
                  break;
                case ConnectionState.waiting:
                case ConnectionState.active:
                return Center(child: ProgressWidget());
                  break;
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    if (snapshot.data == 0) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: ScreenHelper.screenWidth(context, 16),
                          right: ScreenHelper.screenWidth(context, 16),
                          top: ScreenHelper.screenHeight(context, 27),
                        ),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Container(
                            height: ScreenHelper.screenHeight(context, 580),
                            child: GridView.builder(
//                            itemCount: videoController.videos.length,
                              itemCount: 6,
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
                              itemBuilder: (context, index) => GestureDetector(
                                  onTap: () {
                                Get.to(
                                    CourseDetailsScreen(
                                        //videoModel: videoController.videos[index],
                                    ),
                                    transition: Transition.cupertino);
                              }, child: LayoutBuilder(
                                      builder: (context, constraints) {
                                print(constraints.maxWidth);
                                return CourseShowCart(
                                  onTap: () {
                                    Get.to(
                                        CourseDetailsScreen(
//                                        videoModel:
//                                            videoController.videos[index],
                                            ),
                                        transition: Transition.cupertino);
                                  },
                                  height: constraints.maxHeight - 25,
                                  width: constraints.maxWidth - 5,
                                  //videoModel: videoController.videos[index],
                                );
                              })),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Expanded(
                          child: Center(
                        child: Container(
                          height: ScreenHelper.screenHeight(context, 500),
                          child: Column(
                            children: [
                              SquareImageContainer(
                                image: AssetImage("assets/images/internet.png"),
                                size: 230.0,
                              ),
                              SizedBox(
                                height: ScreenHelper.screenHeight(context, 100),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        ScreenHelper.screenWidth(context, 100)),
                                child: UsedButton(
                                  title: "إعادة الاتصال",
                                  onTap: () {
                                    setState(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                    }
                  }
                  break;
              }
            },
          ),
        ],
      ),
    );
  }
}
