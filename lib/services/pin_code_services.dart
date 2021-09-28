import 'dart:async';

import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeServices{
  static pinCodeWidget({int fieldNumbers=6,Function onChanged,BuildContext context,TextEditingController textEditingController , StreamController<ErrorAnimationType> errorController}){
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: ScreenHelper.screenWidth(context,19)),
        child: PinCodeTextField(
          enablePinAutofill: true,
          keyboardType: TextInputType.number,
          cursorColor: Color(0xff4E70DB),
          appContext: context,
          length: fieldNumbers,
          obscureText: false,
          pastedTextStyle: TextStyle(
              color: Color(0xff4E70DB),
              fontSize: ScreenHelper.screenFont(context,15),
              fontFamily: "bahij-semibold"
          ),
          animationType: AnimationType.fade,
          pinTheme: PinTheme(

            inactiveColor: Colors.transparent,
            inactiveFillColor: Color(0xffF3F4F6),
            activeColor: MAINCOLOR,
            disabledColor: Colors.black,
            selectedFillColor: Color(0xffF3F4F6),
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(ScreenHelper.screenWidth(context,12)),
            fieldHeight: ScreenHelper.screenWidth(context,50),
            fieldWidth: ScreenHelper.screenWidth(context,50),
            activeFillColor: Colors.white,
          ),
          animationDuration: Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          errorAnimationController: errorController,
          controller: textEditingController,
          onCompleted: (v) {
            print("Completed");
          },
          onChanged: (value) {
            onChanged(value);
          },
          beforeTextPaste: (text) {
            print("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
        ),
      ),
    );
  }
}
