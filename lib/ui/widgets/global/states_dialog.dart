import 'package:flutter/material.dart';
import 'package:azcourses/bloc/model/state_location.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/utils/constants.dart';


class StatesDialog extends StatefulWidget {
  List stateLocations;
  Function onSave;
  bool isState;
  StatesDialog({this.stateLocations,this.onSave,this.isState=false});

  @override
  _StatesDialogState createState() => _StatesDialogState();
}

class _StatesDialogState extends State<StatesDialog> {
  bool state = false;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenHelper.screenWidth(context, 300),
      height: ScreenHelper.screenHeight(context, 500),
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: ScreenHelper.screenHeight(context, 30),
          ),
          GestureDetector(
           onTap: (){
             print(widget.stateLocations[0].title);
           },
            child: Text(
             widget.isState ?  "اختر المحافظة" : "اختر المدينة",
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.headline1.copyWith(
                  color: DARKBLACKCOLOR,
                  fontSize: ScreenHelper.screenFont(context, 14)
              ),
            ),
          ),
          SizedBox(
            height: ScreenHelper.screenHeight(context, 30),
          ),
          Expanded(
              child: Directionality(
            textDirection: TextDirection.rtl,
            child: Material(
              child: ListView(
                shrinkWrap: true,
               // children: widget.statesCities
                children: widget.stateLocations
                    .map((state) => RadioListTile(
                          activeColor: SECONDERYCOLOR,
                          groupValue: _currentIndex,
                          title: Text(
                            state.title,
                            textDirection: TextDirection.rtl,
                            style: Theme.of(context).textTheme.headline1.copyWith(
                                color: DARKBLACKCOLOR,
                                fontSize: ScreenHelper.screenFont(context, 14)
                            ),
                          ),
                          value: state.id,
                          onChanged: (val) {
                            print(val);
                            setState(() {
                              _currentIndex = val;
                            });
                          },
                        ))
                    .toList(),
              ),
            ),
          )),
          Padding(
            padding:  EdgeInsets.only(
                bottom: ScreenHelper.screenHeight(context, 15),
                top: ScreenHelper.screenHeight(context,10),
                right: ScreenHelper.screenWidth(context,50),
                left:  ScreenHelper.screenWidth(context,50),
            ),
            child: UsedButton(
              onTap: (){
                widget.onSave(_currentIndex);
              },
              buttonColor: MAINCOLOR,
              title: "حفظ",
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
