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

class CustomTextField extends StatefulWidget {
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
  final int maxLines;
  final bool enable;

  CustomTextField(
      {this.flatBorderColor = Colors.white,
      this.flatBorderHeight = 2,
      this.textColor = Colors.white,
      this.onFocus,
      this.onChanged,
      this.suffixWidget,
        this.enable=true,
      this.label='',
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
      this.maxLines
      });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode focusNode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          onEditingComplete: widget.onComplete,
          // onChanged: (value) {
          //   widget.onChanged(value);
          // },
          maxLines: widget.maxLines??1,
          onTap: widget.onTap,
          keyboardType: widget.keyboardType,
          focusNode: focusNode,
          style: Theme.of(context).textTheme.headline2.copyWith(
                color: widget.textColor,
                fontSize: ScreenHelper.screenFont(context, 17),
              ),
          controller: widget.controller,
          obscureText: widget.isSecure,
          enabled: widget.enabled,
          validator: widget.validator != null
              ? widget.validator
              : (value) {
                  if (value.isEmpty) return widget.errorMessage;
                  //if (value.length<widget.shortCondition) return widget.shortMessage;
                  return null;
                },
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          cursorColor: MAINCOLOR,
          decoration: InputDecoration(
            enabled: widget.enable,
            suffix: widget.suffixWidget,
            suffixIconConstraints: BoxConstraints(
                maxHeight: ScreenHelper.screenWidth(context, 20),
                maxWidth: ScreenHelper.screenWidth(context, 20)),
            suffixText: widget.suffixText,
            suffixStyle: Theme.of(context).textTheme.caption.copyWith(
                  color: SECONDERYCOLOR,
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
        ));
  }
}
