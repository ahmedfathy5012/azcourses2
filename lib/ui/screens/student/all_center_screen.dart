import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/controller/center_controller.dart';
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
import 'package:azcourses/ui/widgets/global/request_center_card.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/ui/widgets/global/viedoe_show_grid.dart';
import 'package:azcourses/utils/constants.dart';

class AllCentersScreen extends StatefulWidget {
  @override
  _AllCentersScreenState createState() => _AllCentersScreenState();
}

class _AllCentersScreenState extends State<AllCentersScreen> {
  CenterController centerController = Get.put(CenterController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    centerController.fetchCenters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MAINCOLOR,
      body: Stack(
        children: [
          HeaderBackGround(),
          BackBar(
            title: "المراكز",
          ),
          Column(
            children: [
              Container(
                width: double.infinity,
                height: ScreenHelper.screenHeight(context, 100),
              ),
              Expanded(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              ScreenHelper.screenRadius(context, 30)),
                          topRight: Radius.circular(
                              ScreenHelper.screenRadius(context, 30)))),
                  child: GetBuilder<CenterController>(
                    builder:(_) =>
                    _.isLoading?
                    Center(
                      child: ProgressWidget(),
                    ):
                    _.centers.isEmpty?
                    Center(
                      child: Text(
                        "لا توجد كورسات لعرضها",
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context).textTheme.headline3.copyWith(
                            color: MAINCOLOR,
                            fontSize: ScreenHelper.screenFont(context, 20)),
                      ),
                    ):
                    ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => RequestCenterCard(centerModel: _.centers[index],),
                      separatorBuilder: (context, index) => Divider(
                        color: ULTRAGREYCOLOR,
                      ),
                      itemCount: _.centers.length,
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
}
