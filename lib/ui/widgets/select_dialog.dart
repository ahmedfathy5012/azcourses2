import 'package:azcourses/bloc/model/select_model.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';

import 'global/used_button.dart';


class SelectDialog<T extends SelectModel> extends StatefulWidget {
  final List<T> listData;
  final Function onSave;
  final String headerTitle;
  T data;
  SelectDialog({this.listData,this.onSave,this.headerTitle});

  @override
  _SelectDialogState createState() => _SelectDialogState();
}

class _SelectDialogState extends State<SelectDialog> {
  String _currentId;
  int currentIndex;

  List<int> _states = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
  ];

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
          Text(
            widget.headerTitle??"",
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.caption.copyWith(
              fontSize: ScreenHelper.screenFont(context, 20),
              color: MAINCOLOR
            ),
          ),
          SizedBox(
            height: ScreenHelper.screenHeight(context, 30),
          ),
          Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Material(
                  color: Colors.white,
                  child: ListView(
                    shrinkWrap: true,
                    // children: widget.statesCities
                    children:
                    [
                      for(int i = 0 ; i<widget.listData.length;i++)
                     GestureDetector(
                       onTap: (){
                         print(widget.listData[i].id);
                       },
                       child: RadioListTile(
                            activeColor: MAINCOLOR,
                            groupValue: _currentId,
                            title: Text(
                            widget.listData[i].title,
                              textDirection: TextDirection.rtl,
                              style: Theme.of(context).textTheme.headline2.copyWith(
                                  fontSize:
                                  ScreenHelper.screenFont(context, 15),
                                  color: MAINCOLOR
                              ),
                            ),
                            value: widget.listData[i].id.toString(),
                            onChanged: (val) {
                              // print(val);
                              setState(() {
                                widget.data = widget.listData[i];
                                currentIndex = i;
                                _currentId = widget.listData[i].id.toString();
                              });
                            },
                          ),
                     )
                    ]
                  ),
                ),
              )),
          Padding(
            padding:  EdgeInsets.only(
              left: ScreenHelper.screenWidth(context,30),
                right: ScreenHelper.screenWidth(context, 30),
                bottom: ScreenHelper.screenHeight(context, 15),top: ScreenHelper.screenHeight(context,10)),
            child: UsedButton(
              onTap: (){
                widget.onSave(widget.data,currentIndex);
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
