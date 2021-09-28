import 'package:flutter/material.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/utils/constants.dart';

class AskMe extends StatefulWidget {
  @override
  _AskMeState createState() => _AskMeState();
}

class _AskMeState extends State<AskMe> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SquareImageContainer(
        image: AssetImage("assets/images/soon.png"),
        size: 250.0,
      ),
    );
  }

  Widget sendRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      textDirection: TextDirection.rtl,
      children: [
        SizedBox(
          width: ScreenHelper.screenWidth(context, 286),
          child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                style: Theme.of(context).textTheme.headline2.copyWith(
                      color: MAINCOLOR,
                      fontSize: ScreenHelper.screenFont(context, 15),
                    ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                cursorColor: MAINCOLOR,
                keyboardType: TextInputType.multiline,
                minLines: 1, //Normal textInputField will be displayed
                maxLines: 5, // when user presses enter it will adapt to it
                decoration: InputDecoration(
                  // suffix: widget.suffixWidget,
                  suffixIconConstraints: BoxConstraints(
                      maxHeight: ScreenHelper.screenWidth(context, 20),
                      maxWidth: ScreenHelper.screenWidth(context, 20)),
                  enabled: true,
                  fillColor: Color(0xffEEEEEE),
                  filled: true,
                  hintText: "اضف سؤال ..",
                  hintStyle: Theme.of(context).textTheme.headline2.copyWith(
                        color: Theme.of(context).disabledColor,
                        fontSize: ScreenHelper.screenFont(context, 15),
                      ),
                  labelStyle: Theme.of(context).textTheme.headline2.copyWith(
                        color: Theme.of(context).disabledColor,
                        fontSize: ScreenHelper.screenFont(context, 15),
                      ),
                  errorStyle: Theme.of(context).textTheme.headline2.copyWith(
                        color: Theme.of(context).disabledColor,
                        fontSize: ScreenHelper.screenFont(context, 15),
                      ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        ScreenHelper.screenRadius(context, 5.0)),
                    borderSide: BorderSide(
                        color: Colors.transparent,
                        width: ScreenHelper.screenWidth(context, 0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        ScreenHelper.screenRadius(context, 5.0)),
                    borderSide: BorderSide(
                        color: Colors.transparent,
                        width: ScreenHelper.screenWidth(context, 0)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        ScreenHelper.screenRadius(context, 5.0)),
                    borderSide: BorderSide(
                        color: Colors.transparent,
                        width: ScreenHelper.screenWidth(context, 0)),
                  ),
                ),
              )),
        ),
        Container(
          height: ScreenHelper.screenWidth(context, 50),
          width: ScreenHelper.screenWidth(context, 50),
          child: Icon(
            Icons.mic,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
            color: MAINCOLOR,
            borderRadius: BorderRadius.all(
                Radius.circular(ScreenHelper.screenRadius(context, 25))),
          ),
        ),
      ],
    );
  }
}
