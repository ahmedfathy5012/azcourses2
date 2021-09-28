
import 'package:flutter/material.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/utils/constants.dart';

enum FieldType {
  WithBorder,
  WithOutBorder,
}

enum SecureType {
  Never,
  Toggle,
  Always,
}

class CustomDropDownFormField extends StatefulWidget {
  final String hint;
  final String label;
  final FieldType fieldType;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final IconData icon;
  final String prefixIconUrl;
  final String suffixIconUrl;
  final bool isPrefixIcon;
  final bool isSuffixIcon;
  final Function validation;
  final Function onChanged;
  final Function onComplete;
  final Function onSaved;
  final Color hintColor;
  final Color labelColor;
  final Color errorColor;
  final Color fieldColor;
  final Color filledColor;
  final Color enableBorder;
  final Color disableBorder;
  final Color focusBorder;
  final Color errorBorder;
  final Color cursorColor;
  final Color prefixColor;
  final Color suffixColor;
  final Color iconColor;

  final String errorText;
  final String errorLargeText;
  final String errorMinimumText;
  final int largeCondition;
  final int minimumCondition;

  final TextEditingController controller;

  final double horizentalPadding;
  final double verticalPadding;
  final Function onSuffixTap;

  final double borderRadius;
  final double borderWidth;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final SecureType secureType;

  final double outerHorizentalPadding;
  final List<dynamic> data;

  CustomDropDownFormField(
      {@required this.hint,
        this.controller,
        this.label,
        this.fieldType = FieldType.WithBorder,
        this.prefixIconData,
        this.suffixIconData = Icons.keyboard_arrow_down,
        this.prefixIconUrl,
        this.suffixIconUrl,
        this.isPrefixIcon = true,
        this.isSuffixIcon = false,
        this.validation,
        this.onChanged,
        this.onComplete,
        this.onSaved,
        this.hintColor = ConstantColor.FIELD_HINT,
        this.labelColor = ConstantColor.FIELD_LABEL,
        this.errorColor = ConstantColor.FIELD_ERROR,
        this.fieldColor = ConstantColor.FIELD_BACKGROUND_COLOR,
        this.filledColor = ConstantColor.FIELD_BACKGROUND_COLOR,
        this.enableBorder = ConstantColor.FIELD_ENABLE_BORDER,
        this.disableBorder = ConstantColor.FIELD_DISABLE_BORDER,
        this.focusBorder = ConstantColor.FIELD_FOCUS_BORDER,
        this.errorBorder = ConstantColor.FIELD_ERROR_BORDER,
        this.cursorColor = ConstantColor.FIELD_CURSOR,
        this.errorText,
        this.errorLargeText,
        this.largeCondition = 0,
        this.minimumCondition = 0,
        this.errorMinimumText,
        this.horizentalPadding = 19.0,
        this.verticalPadding = 19.0,
        this.icon,
        this.onSuffixTap,
        this.prefixColor = ConstantColor.FIELD_PREFIX_ICON,
        this.suffixColor = ConstantColor.FIELD_SUFFIX_ICON,
        this.iconColor = ConstantColor.FIELD_PREFIX_ICON,
        this.borderRadius = 15.0,
        this.borderWidth = 1.0,
        this.keyboardType,
        this.textInputAction,
        this.secureType = SecureType.Never,
        this.outerHorizentalPadding = 16.0,
        this.data});

  @override
  _CustomDropDownFormFieldState createState() =>
      _CustomDropDownFormFieldState();
}

class _CustomDropDownFormFieldState extends State<CustomDropDownFormField> {
  bool secureState = true;
  String selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal:
          ScreenHelper.screenWidth(context, widget.outerHorizentalPadding)),
      child: DropdownButtonFormField(
        value: selected,
        items: widget.data
            .map((label) => DropdownMenuItem(
          child:
              Text(
                label.title,
                style:Theme.of(context).textTheme.headline2.copyWith(
                  color: MAINCOLOR,
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
        onChanged: (value){
          widget.onChanged(int.parse(value),widget.data.indexWhere((element) => value == element.id.toString()));
          setState(() {
            // selected = widget.data[widget.data.indexWhere((element) => value == element.id.toString())].title;
            selected = value;
          });
        },
        // onChanged: (value) {
        //   widget.onChanged(
        //   widget.data[widget.data.indexWhere((element) => value == element.title)].id,
        //   widget.data.indexWhere((element) => value == element.title));
        //   setState(() {
        //     selected = value;
        //   });
        // },
        onSaved: widget.onSaved,
        // ignore: missing_return
        validator: (value) {
          if (value == null)
            return widget.errorText;
          else
            return null;
        },
        style: TextStyle(
            fontSize: ScreenHelper.screenFont(context, 16),
            color: ConstantColor.FIELD_TEXT,
            fontFamily: "bahij-semibold"
        ),
        iconEnabledColor: Colors.transparent,
        iconDisabledColor: Colors.transparent,
        decoration: InputDecoration(
          enabled: true,
          filled: true,
          fillColor: ConstantColor.FIELD_BACKGROUND_COLOR,
          // HINT TEXT WITH STYLE
          hintText: widget.hint,
          hintStyle: TextStyle(
              fontSize: ScreenHelper.screenFont(context, 16),
              color: widget.hintColor,
              fontFamily: "bahij-light"
          ),
          // LABEL TEXT WITH STYLE
          labelText: widget.label,
          labelStyle: TextStyle(
              fontSize: ScreenHelper.screenFont(context, 11),
              color: widget.labelColor,
              fontFamily: "bahij-light"
          ),
          // ERROR TEXT STYLE
          errorStyle: Theme.of(context).textTheme.subtitle1.copyWith(
              fontSize: ScreenHelper.screenFont(context, 12.0),
              color: widget.errorColor,
              fontFamily: "bahij-light"
          ),
          // PADDING
          contentPadding: EdgeInsets.symmetric(
              vertical:
              ScreenHelper.screenHeight(context, widget.verticalPadding),
              horizontal:
              ScreenHelper.screenWidth(context, widget.horizentalPadding)),
          icon: widget.icon != null
              ? Icon(
            widget.icon,
            color: widget.iconColor,
            size: ScreenHelper.screenWidth(context, 24),
          )
              : null,
          prefixIcon:
          (widget.prefixIconUrl != null || widget.prefixIconData != null)
              ? widget.prefixIconUrl != null
              ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/${widget.prefixIconUrl}.png",
                height: ScreenHelper.screenWidth(context, 24),
                width: ScreenHelper.screenWidth(context, 24),
                color: widget.prefixColor,
              ),
            ],
          )
              : Icon(
            widget.prefixIconData,
            color: widget.prefixColor,
            size: ScreenHelper.screenWidth(context, 24),
          )
              : null,

          prefixIconConstraints: widget.prefixIconUrl == null
              ? null
              : BoxConstraints(
            maxHeight: ScreenHelper.screenWidth(context, 20),
            maxWidth:
            ScreenHelper.screenWidth(context, 20 + (15.0 * 2.0)),
          ),
          suffixIcon:
          (widget.suffixIconData != null || widget.suffixIconUrl != null)
              ? IconButton(
            icon: Icon(
              widget.suffixIconData,
              color: widget.suffixColor,
              size: ScreenHelper.screenWidth(context, 24),
            ),
            onPressed: widget.onSuffixTap,
          )
              : null,
          border: widget.fieldType == FieldType.WithBorder
              ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(
                color: widget.enableBorder,
                width:
                ScreenHelper.screenWidth(context, widget.borderWidth)
              //style: BorderStyle.solid,
            ),
          )
              : UnderlineInputBorder(
            borderSide: BorderSide(
                color: ConstantColor.FIELD_ERROR_BORDER,
                width: ScreenHelper.screenWidth(
                    context, widget.borderWidth)),
          ),

          enabledBorder: widget.fieldType == FieldType.WithBorder
              ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                ScreenHelper.screenRadius(context, widget.borderRadius)),
            borderSide: BorderSide(
                color: widget.enableBorder,
                width: ScreenHelper.screenWidth(
                    context, widget.borderWidth)),
          )
              : UnderlineInputBorder(
            borderSide: BorderSide(
                color: widget.errorBorder,
                width: ScreenHelper.screenWidth(
                    context, widget.borderWidth)),
          ),
          focusedBorder: widget.fieldType == FieldType.WithBorder
              ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                ScreenHelper.screenRadius(context, widget.borderRadius)),
            borderSide: BorderSide(
                color: widget.focusBorder,
                width: ScreenHelper.screenWidth(
                    context, widget.borderWidth)),
          )
              : UnderlineInputBorder(
            borderSide: BorderSide(
                color: widget.focusBorder,
                width: ScreenHelper.screenWidth(
                    context, widget.borderWidth)),
          ),
          errorBorder: widget.fieldType == FieldType.WithBorder
              ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                ScreenHelper.screenRadius(context, widget.borderRadius)),
            borderSide: BorderSide(
                color: widget.errorBorder,
                width: ScreenHelper.screenWidth(
                    context, widget.borderWidth)),
          )
              : UnderlineInputBorder(
            borderSide: BorderSide(
                color: widget.errorBorder,
                width: ScreenHelper.screenWidth(
                    context, widget.borderWidth)),
          ),
        ),
      ),
    );
  }
}
