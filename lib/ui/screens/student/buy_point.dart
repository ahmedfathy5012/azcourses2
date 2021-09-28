import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/cong_dialog.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/utils/constants.dart';

class BuyPoint extends StatefulWidget {
  @override
  _BuyPointState createState() => _BuyPointState();
}

class _BuyPointState extends State<BuyPoint> {
  String pointToMoney;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pointToMoney = '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenHelper.screenWidth(context, 32)),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 21),
                ),
                Text(
                  "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2.copyWith(
                      fontSize: ScreenHelper.screenFont(context, 14),
                      color: CUSTONLIGHTGREY),
                ),
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 57),
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Container(
                      height: ScreenHelper.screenHeight(context, 70),
                      width: ScreenHelper.screenWidth(context, 112),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(
                              ScreenHelper.screenRadius(context, 13))),
                          color: Colors.transparent,
                          border: Border.all(color: MAINCOLOR, width: 1)),
                      child: Center(
                        child: TextField(
                          style: Theme.of(context).textTheme.headline2.copyWith(
                              fontSize: ScreenHelper.screenFont(context, 14),
                              color: MAINCOLOR),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              pointToMoney = value;
                            });
                          },
                          cursorColor: MAINCOLOR,
                          showCursor: true,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "النقاط",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .headline2
                                .copyWith(
                                    color: Color(0xffAAFFD8),
                                    fontSize:
                                        ScreenHelper.screenFont(context, 14)),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ScreenHelper.screenWidth(context, 22),
                    ),
                    Container(
                      height: 20,
                      width: ScreenHelper.screenWidth(context, 32),
                      color: MAINCOLOR,
                    ),
                    SizedBox(
                      width: ScreenHelper.screenWidth(context, 22),
                    ),
                    Container(
                      height: ScreenHelper.screenHeight(context, 70),
                      width: ScreenHelper.screenWidth(context, 112),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(
                              ScreenHelper.screenRadius(context, 13))),
                          color: Colors.transparent,
                          border: Border.all(color: MAINCOLOR, width: 1)),
                      child: Center(
                        child: Text(
                          pointToMoney.isEmpty || pointToMoney.length < 1
                              ? "القمية المالية"
                              : pointToMoney.toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline2.copyWith(
                              fontSize: ScreenHelper.screenFont(context, 14),
                              color: MAINCOLOR),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: ScreenHelper.screenHeight(context, 14)),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenHelper.screenWidth(context, 85)),
                  child: UsedButton(
                    title: "شراء",
                    buttonColor:
                        pointToMoney.isEmpty ? Color(0xff73B496) : MAINCOLOR,
                    onTap: pointToMoney.isNotEmpty
                        ? () {
                            Get.dialog(Center(
                                child: CongDialog(
                              onTap: () {
                                Get.back();
                              },
                              title: "تهانينا",
                              subtitle:
                                  "تم تحويل النقاط بنجاح ,اطلع علي رصيدك الحالي",
                              buttonTitle: "العودة",
                            )));
                          }
                        : null,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
