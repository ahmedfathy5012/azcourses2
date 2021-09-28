import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
// Dart Packages
// Flutter packages
// Screens
// Widgets
// Providers
// Models
// Helpers

import '../../../utils/constants.dart';
import '../../../helpers/screen_helper.dart';

class CustomDropDownField extends StatefulWidget {
  final TextEditingController controller;
  final String errorMessage;
  final String hint;
  final String label;
  final Widget suffixIcon;
  final bool enabled;
  final isSecure;
  final String suffixText;
  final TextInputType keyboardType;
  final Function validator;
  final Function onTap;
  final Function onSuffixTap;
  final Widget suffixWidget;
  final Function onChanged;
  final Function onFocus;
  final Color textColor;
  final double flatBorderHeight;
  final Color flatBorderColor;
  final Function onComplete;
  String selected;
  final List data;
  final Function onSaved;

  CustomDropDownField(
      {this.flatBorderColor = Colors.white,
      this.flatBorderHeight = 2,
      this.textColor = Colors.white,
      this.onFocus,
      this.onChanged,
      this.suffixWidget,
      this.label,
      this.onSuffixTap,
      this.onTap,
      this.validator = null,
      this.keyboardType = TextInputType.text,
      this.suffixText,
      this.isSecure = false,
      this.enabled = true,
      this.controller,
      this.errorMessage,
      this.hint = " ",
      this.suffixIcon = null,
      this.onComplete = null,
      this.data,
        this.onSaved,
        this.selected,
      });

  @override
  _CustomDropDownFieldState createState() => _CustomDropDownFieldState();
}

class _CustomDropDownFieldState extends State<CustomDropDownField> {
  var selected;
  final _focusNode = FocusNode();

  bool hasFocus=false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        hasFocus=_focusNode.hasFocus;
      });
      print("Has focus: ${_focusNode.hasFocus}");
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Listener(
          child: DropdownButtonFormField(
            isExpanded: true,
            focusNode: _focusNode,
            onTap: widget.onTap,
            style: Theme.of(context).textTheme.headline2.copyWith(
                  color: widget.textColor,
                  fontSize: ScreenHelper.screenFont(context, 17),
                ),
            // value: getSelected(),
            value: widget.selected,
            items:
            widget.data==null||widget.data.isEmpty?
                []:
            widget.data
                .map((label) => DropdownMenuItem(
              child:Text(
                label.title,
                style:Theme.of(context).textTheme.headline2.copyWith(
                  color:MAINCOLOR,
                  fontSize: ScreenHelper.screenFont(context, 17),
                ),
              ),
              // CustomText(
              //   text: label.title,
              //   fontSize: 15,
              //   color: ConstantColor.MAIN_BLACK,
              //   fontW: FW.semibold,
              // ),
              // value: label.title,
              value: label.id.toString(),
            ))
                .toList(),
            onChanged: (value) {
              // widget.onChanged(
              //     widget.data[widget.data.indexWhere((element) => value == element.title)].id,
              //     widget.data.indexWhere((element) => value == element.title));
              widget.onChanged(
                int.parse(value), widget.data.indexWhere((element) => value == element.id.toString()));
              setState(() {
                widget.selected = value;
              });
            },
            onSaved: widget.onSaved,
            validator: widget.validator != null
                ? widget.validator
                : (value) {
                    if (value==null) return "يجب ادخال الملعومات بنجاح";
                  },
            decoration: InputDecoration(
              suffix: widget.suffixWidget,
              suffixIconConstraints: BoxConstraints(
                  maxHeight: ScreenHelper.screenWidth(context, 20),
                  maxWidth: ScreenHelper.screenWidth(context, 20)),
              suffixText: widget.suffixText,
              suffixStyle: Theme.of(context).textTheme.caption.copyWith(
                    color:    SECONDERYCOLOR,
                    fontSize: ScreenHelper.screenFont(context, 17.0),
                  ),
              suffixIcon: widget.suffixIcon == null
                  ? null
                  : GestureDetector(
                      onTap: widget.onSuffixTap, child: widget.suffixIcon),

//          IconButton(
//              onPressed: widget.onSuffixTap,
//              icon: Icon(widget.suffixIcon,color: WHITECOLOR,size: ScreenHelper.screenSizeFraction(context,5.0),)),

              //hintText: "${widget.hint}",
              labelText: "${widget.label}",
              hintStyle: Theme.of(context).textTheme.headline2.copyWith(
                    color: Theme.of(context).disabledColor,
                    fontSize: ScreenHelper.screenFont(context, 16),
                  ),
              labelStyle: Theme.of(context).textTheme.headline2.copyWith(
                    color: Theme.of(context).disabledColor,
                    fontSize: ScreenHelper.screenFont(context, 16.0),
                  ),
              errorStyle: Theme.of(context).textTheme.headline2.copyWith(
                    color: Theme.of(context).disabledColor,
                    fontSize: ScreenHelper.screenFont(context, 16.0),
                  ),

              // prefix: Text("اظهار"),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).disabledColor,
                    width: widget.flatBorderHeight),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).disabledColor,
                    width: widget.flatBorderHeight),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: widget.flatBorderColor,
                    width: widget.flatBorderHeight),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.red, width: widget.flatBorderHeight),
              ),
            ),
          ),
        ));
  }

  // String getSelected(){
  //   if(selected==null){
  //     return null;
  //   }else{
  //     for(int i=0; i < widget.data.length ; i++){
  //       if(selected==widget.data[i].id){
  //         return widget.data[i].id.toString();
  //       }
  //     }
  //     return null;
  //   }
  // }
}
