import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/controller/rate_controller.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/ui/widgets/global/used_text_field.dart';
import 'package:azcourses/utils/constants.dart';

import 'custom_text_field.dart';

class RateSheet extends StatefulWidget {
  int courseId;


  RateSheet({this.courseId});

  @override
  _RateSheetState createState() => _RateSheetState();
}

class _RateSheetState extends State<RateSheet> {

  TextEditingController controller;

  RateController rateController = Get.put(RateController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  int rateValue = 0;

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    return Container(
      height: ScreenHelper.screenHeight(context, 381),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(ScreenHelper.screenRadius(context, 31)),
              topLeft:
                  Radius.circular(ScreenHelper.screenRadius(context, 31)))),
      child: Stack(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 14),
                ),
                Container(
                  height: ScreenHelper.screenHeight(context, 6),
                  width: ScreenHelper.screenWidth(context, 44),
                  decoration: BoxDecoration(
                      color: Color(0xffDFDFDF),
                      borderRadius: BorderRadius.all(Radius.circular(
                          ScreenHelper.screenRadius(context, 200)))),
                ),
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 14),
                ),
                Text(
                  "قيم الان",
                  style: Theme.of(context).textTheme.headline3.copyWith(
                      fontSize: ScreenHelper.screenFont(context, 15),
                      color: BLACKCOLOR),
                ),
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 14),
                ),
                rateCourse(),
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 14),
                ),
                UsedTextField(
                  maxLines: 4,
                  hint: "اكتب رسالتك هنا .... ",
                  controller: controller,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: ScreenHelper.screenHeight(context, 14),
                horizontal: ScreenHelper.screenWidth(context, 69)),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: UsedButton(
                onTap: submit,
                title: "حفظ",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget rateCourse(){
    return Stack(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for(int i =0 ; i<5 ; i++)
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context,2.5)),
                child: Icon(
                  Icons.star,
                  color: rateValue-1>=i ?Colors.amberAccent:GREYCOLOR,
                  // color: Colors.amberAccent,
                  size: ScreenHelper.screenWidth(context,22),
                ),
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for(int i =0 ; i<5 ; i++)
              GestureDetector(
                onTap: (){
                  setState(() {
                    rateValue = i+1;
                    print(rateValue);
                  });
                },
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context,2.5)),
                  child: Icon(
                    Icons.star,
                    color: Colors.transparent,
                    size: ScreenHelper.screenWidth(context,22),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  void submit(){
    rateController.rateCourse(courseId: widget.courseId,comment: controller.text??"",rateCount: rateValue);
  }
}
