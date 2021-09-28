import 'package:azcourses/ui/widgets/global/back_bar.dart';
import 'package:azcourses/ui/widgets/global/header_back_ground.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/controller/center_controller.dart';
import 'package:azcourses/bloc/controller/video_controller.dart';
import 'package:azcourses/bloc/model/center_model.dart';
import 'package:azcourses/helpers/get_services.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/global/request_center_register_screen.dart';
import 'package:azcourses/ui/screens/student/course_details_screen.dart';
import 'package:azcourses/ui/widgets/global/ViewAllHeader.dart';
import 'package:azcourses/ui/widgets/global/progress_widget.dart';
import 'package:azcourses/ui/widgets/global/rate_sheet.dart';
import 'package:azcourses/ui/widgets/global/request_center_card.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/ui/widgets/global/viedoe_show_grid.dart';
import 'package:azcourses/utils/constants.dart';

class RequestCenterScreen extends StatefulWidget {
  CenterModel centerModel;

  RequestCenterScreen({this.centerModel});

  @override
  _RequestCenterScreenState createState() => _RequestCenterScreenState();
}

class _RequestCenterScreenState extends State<RequestCenterScreen> {
  CenterController _centerController = Get.put(CenterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MAINCOLOR,
      body: Stack(
        children: [
          HeaderBackGround(),
          BackBar(
            title: "اضافة مركز",
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
                    child: Padding(
                      padding:
                          EdgeInsets.all(ScreenHelper.screenWidth(context, 20)),
                      child: RequestCenterCard(centerModel: widget.centerModel,),
                    )),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenHelper.screenWidth(context, 69),
                vertical: ScreenHelper.screenHeight(context, 30)),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: UsedButton(
                title: "تأكيد الأختيار",
                onTap: () {
                  _centerController.AddCenter(centerCode:widget.centerModel.code);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
