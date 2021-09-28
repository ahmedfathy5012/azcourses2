import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/services/geolocation.dart';
import 'package:azcourses/ui/screens/student/home_screen.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/utils/constants.dart';

class LocationDialog extends StatelessWidget {
  Function onSave;

  LocationDialog({this.onSave});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenHelper.screenHeight(context, 561),
      width: ScreenHelper.screenWidth(context, 343),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
            Radius.circular(ScreenHelper.screenRadius(context, 9))),
      ),
      child: Stack(
        children: [
          Image(
              image: AssetImage("assets/images/map.png"),
              width: ScreenHelper.screenWidth(context, 343)),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding:
                  EdgeInsets.only(top: ScreenHelper.screenWidth(context, 300)),
              child: Container(
                height: ScreenHelper.screenHeight(context, 100),
                child: Column(
                  children: [
                    Text(
                      "فعل موقع هاتفك ؟",
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.headline3.copyWith(
                          color: DARKBLACKCOLOR,
                          fontSize: ScreenHelper.screenFont(context, 21)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenHelper.screenWidth(context, 70)),
                      child: Text(
                        "من فضلك فعل موقع جهازك حتي يسهل عليك التواصل مع المعلمين و المحتويات الدراسية التي بقرب منك",
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context).textTheme.headline2.copyWith(
                            color: GREYCOLOR,
                            fontSize: ScreenHelper.screenFont(context, 13)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                left: ScreenHelper.screenWidth(context, 70),
                right: ScreenHelper.screenWidth(context, 70),
                bottom: ScreenHelper.screenHeight(context, 16),
              ),
              child: UsedButton(
                onTap: () async {
                  try {
                    Position position = await GeolocationServices.getPosition();
                    onSave(position);
                  } catch (e) {}
                },
                title: "فعل الموقع",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
