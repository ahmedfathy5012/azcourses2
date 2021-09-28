import 'package:azcourses/ui/widgets/returned_appbar.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:azcourses/bloc/controller/auth_controller.dart';
import 'package:azcourses/bloc/controller/center_controller.dart';
import 'package:azcourses/bloc/controller/year_controller.dart';
import 'package:azcourses/bloc/model/auth_user.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/services/qr_services.dart';
import 'package:azcourses/ui/screens/global/google_map_screen.dart';
import 'package:azcourses/ui/screens/global/login_screen.dart';
import 'package:azcourses/ui/screens/global/request_center_register_screen.dart';
import 'package:azcourses/ui/screens/global/request_center_screen.dart';
import 'package:azcourses/ui/screens/global/signup_second_screen.dart';
import 'package:azcourses/ui/screens/student/home_screen.dart';
import 'package:azcourses/ui/screens/student/tabs_screen.dart';
import 'package:azcourses/ui/widgets/global/back_ground.dart';
import 'package:azcourses/ui/widgets/global/custom_text_field.dart';
import 'package:azcourses/ui/widgets/global/error_dialog.dart';
import 'package:azcourses/ui/widgets/global/grade_dialog.dart';
import 'package:azcourses/ui/widgets/global/loading_dialog.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/ui/widgets/global/states_dialog.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';

import '../../../utils/constants.dart';

class AddCenterRegister extends StatefulWidget {
  @override
  _AddCenterRegisterState createState() => _AddCenterRegisterState();
}

class _AddCenterRegisterState extends State<AddCenterRegister> {
  AuthController authController = Get.put(AuthController());
  CenterController _centerController = Get.put(CenterController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var node = FocusScope.of(context);
    //
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(
          children: [
            BackGround(),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenHelper.screenWidth(context, 30)),
                child: Column(
                  children: [
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 40),
                    ),
                    ReturnedAppBar(title: "انشاء حساب",),
                    SizedBox(
                      height: ScreenHelper.screenHeight(context, 40),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 40),
                        ),
                        SquareImageContainer(
                          size: 232.0,
                          image: AssetImage("assets/reicons/scanwhite.png"),
                        ),
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 32),
                        ),
                        Text(
                          "إضافة مركز الكورسات",
                          style: Theme.of(context).textTheme.headline3.copyWith(
                              fontSize: ScreenHelper.screenFont(context, 22),
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 10),
                        ),
                        Text(
                          "(QR code) قم بمسح الكود الخاص بالمركز",
                          style: Theme.of(context).textTheme.headline1.copyWith(
                              fontSize: ScreenHelper.screenFont(context, 16),
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: ScreenHelper.screenHeight(context, 32),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: ScreenHelper.screenHeight(context, 20),
                  horizontal: ScreenHelper.screenWidth(context, 75)),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: UsedButton(
                  title: "QR code مسح",
                  onTap: () {
                    // Get.to(RequestCenterRegisterScreen(),
                    //     transition: Transition.cupertino,
                    //     duration: Duration(milliseconds: 100));
                    QrServices.scanBarcodeNormal(
                      onSuccess: (value){
                        _centerController.fetchCenter(centerCode: value,isRegister: true);
                      }
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
