import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetServices{
  static bottomSheet({Widget child}){
    Get.bottomSheet(
      child,
      clipBehavior: Clip.hardEdge,
      isScrollControlled: true
    );
  }


  static customAlertDialog({Widget child}){
    Get.dialog(
      Center(
          child:child,
      ),
    );
  }
}