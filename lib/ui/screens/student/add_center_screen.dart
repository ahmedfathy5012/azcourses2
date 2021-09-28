import 'package:azcourses/ui/widgets/must_login_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/controller/center_controller.dart';
import 'package:azcourses/bloc/controller/video_controller.dart';
import 'package:azcourses/helpers/get_services.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/services/qr_services.dart';
import 'package:azcourses/ui/screens/global/request_center_screen.dart';
import 'package:azcourses/ui/screens/student/course_details_screen.dart';
import 'package:azcourses/ui/widgets/global/ViewAllHeader.dart';
import 'package:azcourses/ui/widgets/global/header_back_ground.dart';
import 'package:azcourses/ui/widgets/global/progress_widget.dart';
import 'package:azcourses/ui/widgets/global/rate_sheet.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/ui/widgets/global/viedoe_show_grid.dart';
import 'package:azcourses/utils/constants.dart';


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get_storage/get_storage.dart';


class AddCenterScreen extends StatefulWidget {
  @override
  _AddCenterScreenState createState() => _AddCenterScreenState();
}

class _AddCenterScreenState extends State<AddCenterScreen> {
  String _scanBarcode;

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if (!mounted) return;
    setState(() {
      _scanBarcode = barcodeScanRes;
      _centerController.fetchCenter(centerCode: "100");
    });
  }

  CenterController _centerController = Get.put(CenterController());
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MAINCOLOR,
      body: Stack(
        children: [
          HeaderBackGround(),
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
                  child: Column(
                    children: [
                      SizedBox(
                        height: ScreenHelper.screenHeight(context, 40),
                      ),
                      Image.asset(
                          "assets/icons/scan.png",
                        height: ScreenHelper.screenHeight(context, 150),
                      ),

                      SizedBox(
                        height: ScreenHelper.screenHeight(context, 32),
                      ),
                      Text(
                        "اضافة مركز جديد",
                        style: Theme.of(context).textTheme.headline3.copyWith(
                            fontSize: ScreenHelper.screenFont(context, 22),
                            color: BLACKCOLOR),
                      ),
                      SizedBox(
                        height: ScreenHelper.screenHeight(context, 10),
                      ),
                      Text(
                        "(QR code) قم بمسح الكود الخاص بالمركز",
                        style: Theme.of(context).textTheme.headline1.copyWith(
                            fontSize: ScreenHelper.screenFont(context, 16),
                            color: BLACKCOLOR),
                      ),
                      SizedBox(
                        height: ScreenHelper.screenHeight(context, 32),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenHelper.screenWidth(context, 75)),
                        child: UsedButton(
                          title: "QR code مسح",
                          onTap: () {
                            // Get.to(RequestCenterScreen(),
                            //     duration: Duration(milliseconds: 100),
                            //     transition: Transition.cupertino);
                            // _centerController.fetchCenter(centerCode: "123456");
                            if(box.hasData("login")){
                              QrServices.scanBarcodeNormal(
                                  onSuccess: (value){
                                    _centerController.fetchCenter(centerCode: value);
                                  }
                              );
                            }else{
                              Get.dialog(
                                MustLoginDialog(),
                              );
                            }
                          },
                          textColor: MAINCOLOR,
                          buttonColor: Colors.transparent,
                          borderColor: MAINCOLOR,
                          borderWidthFraction: 1,
                        ),
                      ),
                    ],
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
