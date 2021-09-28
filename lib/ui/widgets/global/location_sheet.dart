import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// Dart Packages
// Flutter packages
import 'package:get/get.dart';
import 'package:azcourses/bloc/controller/auth_controller.dart';
import 'package:azcourses/bloc/model/auth_user.dart';
import 'package:azcourses/bloc/model/state_location.dart';
import 'package:azcourses/ui/screens/global/menu_screen.dart';
import 'package:azcourses/ui/screens/student/tabs_screen.dart';
import 'package:azcourses/ui/widgets/global/custom_text_field.dart';
import 'package:azcourses/ui/widgets/global/states_dialog.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
// Screens
// Widgets
// Providers
// Models
// Helpers
import '../../../utils/constants.dart';
import '../../../helpers/screen_helper.dart';
import '../../../helpers/get_services.dart';
import 'loading_dialog.dart';
import 'location_dialog.dart';

class LocationSheet extends StatefulWidget {
  LatLng position = null;
  List<StateLocation> stateLocations;

  @override
  _LocationSheetState createState() => _LocationSheetState();

  LocationSheet({this.position, this.stateLocations});
}

class _LocationSheetState extends State<LocationSheet> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  TextEditingController _stateController;
  TextEditingController _cityController;
  TextEditingController _addressController;
  TextEditingController _stateSendController;

  AuthController authController = Get.put(AuthController());

  int stateIndex;
  int cityIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _stateController = TextEditingController();
    _cityController = TextEditingController();
    _addressController = TextEditingController();
    _stateSendController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _stateController.dispose();
    _cityController.dispose();
    _addressController.dispose();
    _stateSendController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenHelper.screenHeight(context, 503),
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
            Radius.circular(ScreenHelper.screenRadius(context, 15))),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: ScreenHelper.screenHeight(context, 22),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenHelper.screenWidth(context, 167)),
                child: Container(
                  width: ScreenHelper.screenWidth(context, 38),
                  height: ScreenHelper.screenHeight(context, 4),
                  decoration: BoxDecoration(
                      color: GREYCOLOR,
                      borderRadius: BorderRadius.all(Radius.circular(
                          ScreenHelper.screenRadius(context, 5)))),
                ),
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 22),
              ),
              Text(
                "أضف موقعك",
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.headline1.copyWith(
                    color: DARKBLACKCOLOR,
                    fontSize: ScreenHelper.screenFont(context, 14)),
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 22),
              ),
              Divider(
                height: 1,
              ),
              SizedBox(
                height: ScreenHelper.screenHeight(context, 22),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenHelper.screenWidth(context, 29.5)),
                child: Form(
                  key: _globalKey,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.dialog(
                            Center(
                                child: StatesDialog(
                              isState: true,
                              stateLocations: widget.stateLocations,
                              onSave: (val) {
                                print(val);
                                setState(() {
                                  _stateController.text = widget
                                      .stateLocations[widget.stateLocations
                                          .indexWhere(
                                              (element) => element.id == val)]
                                      .title;
                                  stateIndex = val;
                                });
                                Get.back();
                              },
                            )),
                          );
                        },
                        child: CustomTextField(
                          label: "المحافظة",
                          flatBorderHeight:
                              ScreenHelper.screenHeight(context, 1.5),
                          errorMessage: "من فضلك ادخل المحافظة",
                          controller: _stateController,
                          textColor: DARKBLACKCOLOR,
                          enabled: false,
                          onTap: () {},
                        ),
                      ),
                      SizedBox(
                        height: ScreenHelper.screenHeight(context, 22),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.dialog(
                            Center(
                                child: StatesDialog(
                              isState: false,
                              stateLocations: widget
                                  .stateLocations[widget.stateLocations
                                      .indexWhere((element) =>
                                          element.id == stateIndex)]
                                  .cityLocation,
                              onSave: (val) {
                                print(val);
                                setState(() {
                                  _cityController.text = widget
                                      .stateLocations[widget.stateLocations
                                          .indexWhere((element) =>
                                              element.id == stateIndex)]
                                      .cityLocation[widget
                                          .stateLocations[widget.stateLocations
                                              .indexWhere((element) =>
                                                  element.id == stateIndex)]
                                          .cityLocation
                                          .indexWhere(
                                              (element) => element.id == val)]
                                      .title;
                                  cityIndex = val;
                                });
                                Get.back();
                              },
                            )),
                          );
                        },
                        child: CustomTextField(
                          enabled: false,
                          label: "المدينة",
                          flatBorderHeight:
                              ScreenHelper.screenHeight(context, 1.5),
                          errorMessage: "من فضلك ادخل المحافظة",
                          controller: _cityController,
                          textColor: DARKBLACKCOLOR,
                        ),
                      ),
                      SizedBox(
                        height: ScreenHelper.screenHeight(context, 22),
                      ),
                      CustomTextField(
                        label: "العنوان",
                        flatBorderHeight:
                            ScreenHelper.screenHeight(context, 1.5),
                        errorMessage: "من فضلك ادخل المحافظة",
                        controller: _addressController,
                        textColor: DARKBLACKCOLOR,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: ScreenHelper.screenHeight(context, 20),
                  right: ScreenHelper.screenWidth(context, 68.5),
                  left: ScreenHelper.screenWidth(context, 68.5)),
              child: UsedButton(
                onTap: () {
                  if (widget.position != null) {
                    submit();
                  } else {
                    Get.dialog(Center(child: LocationDialog(
                      onSave: (Position position) {
                        setState(() {
                          widget.position =
                              LatLng(position.latitude, position.longitude);
                          print(position.latitude);
                        });
                        Get.back();
                        submit();
                      },
                    )));
                  }
                },
                title: "حفظ",
              ),
            ),
          ),
        ],
      ),
    );
  }

  void submit() async {
    if (_globalKey.currentState.validate()) {
      _globalKey.currentState.save();
      AuthUser authUser = AuthUser();
      // authUser.stateId = stateIndex;
      // authUser.cityId = cityIndex;
      authUser.address = _addressController.text;
      authUser.latitude = widget.position.latitude;
      authUser.longitude = widget.position.longitude;

      // print(authUser.stateId);
      // print(authUser.cityId);
      print(authUser.address);
      print(authUser.latitude);
      print(authUser.longitude);
      Get.dialog(LoadingDialog());
      try {
        int response = await authController.secondRegister(authUser: authUser);
        switch (response) {
          case 0:
            Get.back();
            Get.offAll(MenuDashboardPage(), transition: Transition.leftToRight);
            break;
          case 1:
            Get.back();
            break;
          default:
            Get.back();
            break;
        }
      } catch (e) {
        print(e);
        Get.back();
      }
    }
  }
}
