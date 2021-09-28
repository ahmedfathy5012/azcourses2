import 'package:azcourses/bloc/controller/call_us_controller.dart';
import 'package:azcourses/ui/widgets/global/used_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/controller/video_controller.dart';
import 'package:azcourses/helpers/get_services.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/global/request_center_screen.dart';
import 'package:azcourses/ui/screens/student/course_details_screen.dart';
import 'package:azcourses/ui/widgets/global/ViewAllHeader.dart';
import 'package:azcourses/ui/widgets/global/back_bar.dart';
import 'package:azcourses/ui/widgets/global/custom_text_field.dart';
import 'package:azcourses/ui/widgets/global/header_back_ground.dart';
import 'package:azcourses/ui/widgets/global/progress_widget.dart';
import 'package:azcourses/ui/widgets/global/rate_sheet.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/ui/widgets/global/viedoe_show_grid.dart';
import 'package:azcourses/utils/constants.dart';

class CallUs extends StatefulWidget {
  @override
  _CallUsState createState() => _CallUsState();
}

class _CallUsState extends State<CallUs> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  TextEditingController contentController;
  CallUsController _callUsController = Get.put(CallUsController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contentController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    contentController.dispose();
    super.dispose();
  }

  var node;

  @override
  Widget build(BuildContext context) {
     node = FocusScope.of(context);
    return Scaffold(
      backgroundColor: MAINCOLOR,
      body: Stack(
        children: [
          HeaderBackGround(),
          BackBar(
            title: "اتصل بنا",
          ),
          Column(
            children: [
              Container(
                  width: double.infinity,
                  height: ScreenHelper.screenHeight(context, 100)
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
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenHelper.screenWidth(context, 22)),
                    child: ListView(
                      children: [

                        Padding(
                          padding:  EdgeInsets.symmetric(
                            vertical: ScreenHelper.screenHeight(context,45)
                          ),
                          child: Image.asset(
                              "assets/reicons/call.png",
                            height: ScreenHelper.screenHeight(context,188),
                          ),
                        ),
                        Form(
                          key: _globalKey,
                          child: Column(
                            children: [
                              UsedTextField(
                                maxLines: 5,
                                hint: "اكتب رسالتك هنا .... ",
                                controller: contentController,
                              ),
                              SizedBox(
                                height: ScreenHelper.screenHeight(context,100),
                              ),
                              UsedButton(
                                title: "ارسال",
                                onTap: (){
                                  node.unfocus();
                                  submit();
                                },
                              ),
                              SizedBox(
                                height: ScreenHelper.screenHeight(context,15),
                              ),
                            ],
                          ),
                        ),
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
  void submit(){

    if(_globalKey.currentState.validate()){
      _globalKey.currentState.save();
      print("message content is >> ${contentController.text}");
      _callUsController.callUS(content: contentController.text);
    }
  }
}
