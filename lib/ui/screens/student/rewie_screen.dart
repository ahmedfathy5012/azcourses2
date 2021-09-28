import 'package:azcourses/ui/widgets/global/back_bar.dart';
import 'package:azcourses/ui/widgets/global/header_back_ground.dart';
import 'package:azcourses/ui/widgets/must_login_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/controller/rate_controller.dart';
import 'package:azcourses/bloc/controller/video_controller.dart';
import 'package:azcourses/helpers/get_services.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/student/course_details_screen.dart';
import 'package:azcourses/ui/widgets/global/ViewAllHeader.dart';
import 'package:azcourses/ui/widgets/global/progress_widget.dart';
import 'package:azcourses/ui/widgets/global/rate_sheet.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/ui/widgets/global/viedoe_show_grid.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:get_storage/get_storage.dart';

class ReviewScreen extends StatefulWidget {

  int courseId;
  ReviewScreen({this.courseId});

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  RateController rateController = Get.put(RateController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rateController.fetchCourseRates(courseId: widget.courseId);
  }
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MAINCOLOR,
      body: Stack(
        children: [
          HeaderBackGround(),
          BackBar(
            title: "التقييم العام",
          ),
          Column(
            children: [
              Container(
                width: double.infinity,
                height: ScreenHelper.screenHeight(context, 150),
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
                  child: GetBuilder<RateController>(
                    builder: (_) =>
                        _.isLoading?
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(child: ProgressWidget()),
                          ],
                        )
                            :
                        Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: ScreenHelper.screenHeight(context, 37),
                            ),
                            Text(
                              "التقيم العام",
                              style: Theme.of(context).textTheme.headline2.copyWith(
                                  fontSize: ScreenHelper.screenRadius(context, 13),
                                  color: Color(0xffDFDFDF)),
                            ),
                            SizedBox(
                              height: ScreenHelper.screenHeight(context, 10),
                            ),
                            drawLargeStar(activeStar: _.rateCollection),
                            SizedBox(
                              height: ScreenHelper.screenHeight(context, 53),
                            ),
                            Expanded(
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: ScreenHelper.screenWidth(
                                                context, 16)),
                                        child: Column(
                                          textDirection: TextDirection.rtl,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              textDirection: TextDirection.rtl,
                                              children: [
                                                CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      "assets/images/profileavater.png"),
                                                ),
                                                SizedBox(
                                                  width: ScreenHelper.screenWidth(
                                                      context, 8.7),
                                                ),
                                                Column(
                                                  textDirection: TextDirection.rtl,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      _.rates[index].studentName,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline3
                                                          .copyWith(
                                                              color: BLACKCOLOR,
                                                              fontSize: ScreenHelper
                                                                  .screenFont(
                                                                      context, 12)),
                                                    ),
                                                    Text(
                                                      _.rates[index].date,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline1
                                                          .copyWith(
                                                              color:
                                                                  Color(0xffB6B6B6),
                                                              fontSize: ScreenHelper
                                                                  .screenFont(
                                                                      context, 8)),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: ScreenHelper.screenHeight(
                                                  context, 10),
                                            ),
                                            Row(
                                              textDirection: TextDirection.rtl,
                                              children: [
                                                drawLargeStar(
                                                    activeStar: _.rates[index].rate, isLarge: false),
                                              ],
                                            ),
                                            SizedBox(
                                              height: ScreenHelper.screenHeight(
                                                  context, 5),
                                            ),
                                            Text(
                                              _.rates[index].comment,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  .copyWith(
                                                      color: BLACKCOLOR,
                                                      fontSize:
                                                          ScreenHelper.screenFont(
                                                              context, 12)),
                                            ),
                                          ],
                                        ),
                                      ),
                                  separatorBuilder: (context, index) => Divider(),
                                  itemCount: _.rates.length),
                            ),
                            SizedBox(
                              height: ScreenHelper.screenHeight(context, 100),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenHelper.screenWidth(context, 39),
                              vertical: ScreenHelper.screenHeight(context, 20)),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: UsedButton(
                              onTap: () {
                                if(box.hasData("login"))
                                GetServices.bottomSheet(child: RateSheet(courseId: widget.courseId,));
                                else
                                Get.dialog(MustLoginDialog());
                              },
                              title: "قيم الان",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  drawLargeStar({int activeStar, bool isLarge = true}) {
    return Row(
      textDirection: isLarge ? TextDirection.rtl : TextDirection.ltr,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < activeStar; i++)
          Padding(
            padding:
                EdgeInsets.only(left: ScreenHelper.screenWidth(context, 2)),
            child: Icon(
              Icons.star,
              color: Color(0xffF9CA24),
              size: ScreenHelper.screenHeight(context, isLarge ? 20 : 13),
            ),
          ),
        for (int i = 5; i > activeStar; i--)
          Padding(
            padding:
                EdgeInsets.only(left: ScreenHelper.screenWidth(context, 2)),
            child: Icon(
              Icons.star,
              color: Color(0xffD1D1D3),
              size: ScreenHelper.screenHeight(context, isLarge ? 20 : 13),
            ),
          ),
        SizedBox(width: ScreenHelper.screenWidth(context, 5)),
        Text(
          "$activeStar/5",
          style: Theme.of(context).textTheme.headline3.copyWith(
              fontSize: ScreenHelper.screenFont(context, isLarge ? 20 : 13),
              color: BLACKCOLOR),
        ),
      ],
    );
  }
}
