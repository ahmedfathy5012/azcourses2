import 'dart:convert';

import 'package:azcourses/ui/widgets/must_login_dialog.dart';
import 'package:azcourses/ui/widgets/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:azcourses/bloc/model/course_rate.dart';
import 'package:http/http.dart' as http;
import 'package:azcourses/helpers/api_helper.dart';
import 'package:azcourses/ui/screens/global/menu_screen.dart';
import 'package:azcourses/ui/widgets/global/error_dialog.dart';
import 'package:azcourses/ui/widgets/global/loading_dialog.dart';


class BuyController extends GetxController{
  List<CourseRate> rates= [];
  bool isLoading;
  int allRates=0;
  int rateCollection=0;
  GetStorage box = GetStorage();

  Future<void> buyCourse({int courseId}) async {
 if(box.hasData("login")){
   Get.dialog(Center(child: LoadingDialog()));
   Map<String, String> headers = {
     'Accept': 'application/json',
     'Authorization': 'Bearer ' + box.read("api_token"),
     // 'Authorization': 'Bearer ' +
     //     // "\$2y\$10\$1iQ8XhUfP2OMTXOu7P2afeW762dbke9eMSPGtI1orHIk1F0hbK1u.",
     //     "\$2y\$10\$S6xv15jKV5xYu5kksYiN9u0.QzRnvuuV5A6xEFO2PghR6B5PXKr16",
   };
   final response = await http.post(
       BUY_COURSE,
       headers: headers,
       body: {
         "course_id"   : courseId.toString(),
       }
   );
   print("request sent");
   print(response.body);
   Get.back();
   final extractedData = json.decode(response.body);
   final List<CourseRate> loadedRates = [];
   if (response.statusCode == 200 && extractedData['status']) {
     print("convert Success");
     Get.offAll(MenuDashboardPage(),duration: Duration(milliseconds: 150),transition: Transition.leftToRight);
     Get.dialog(SuccessDialog());
   }else{
     Get.back();
     Get.dialog(Center(
         child: ErrorDialog(
           onSave: () {
             Get.back();
           },
           buttonTitle: "المحاولة مرة اخري",
           message: extractedData['message']??"حدث خطأ ما",
         )));
   }
   update();
 }else{

 }
  }



  Future<void> buyGeneralCourse({int courseId}) async {
    if(box.hasData("login")){
      Get.dialog(Center(child: LoadingDialog()));
      Map<String, String> headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + box.read("api_token"),
        // 'Authorization': 'Bearer ' +
        //     // "\$2y\$10\$1iQ8XhUfP2OMTXOu7P2afeW762dbke9eMSPGtI1orHIk1F0hbK1u.",
        //     "\$2y\$10\$S6xv15jKV5xYu5kksYiN9u0.QzRnvuuV5A6xEFO2PghR6B5PXKr16",
      };
      final response = await http.post(
          BUY_GENERAL_COURSE,
          headers: headers,
          body: {
            "course_id"   : courseId.toString(),
          }
      );
      print("request sent");
      print(response.body);
      Get.back();
      final extractedData = json.decode(response.body);
      final List<CourseRate> loadedRates = [];
      if (response.statusCode == 200 && extractedData['status']) {
        print("convert Success");
        Get.offAll(MenuDashboardPage(),duration: Duration(milliseconds: 150),transition: Transition.leftToRight);
        Get.dialog(SuccessDialog());
      }else{
        Get.back();
        Get.dialog(Center(
            child: ErrorDialog(
              onSave: () {
                Get.back();
              },
              buttonTitle: "المحاولة مرة اخري",
              message: extractedData['message']??"حدث خطأ ما",
            )));
      }
      update();
    }else{

    }
  }

  Future<void> buyClass({int courseId,int classId}) async {
    Get.dialog(Center(child: LoadingDialog()));
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + box.read("api_token"),
      // 'Authorization': 'Bearer ' +
      //     // "\$2y\$10\$1iQ8XhUfP2OMTXOu7P2afeW762dbke9eMSPGtI1orHIk1F0hbK1u.",
      //     "\$2y\$10\$S6xv15jKV5xYu5kksYiN9u0.QzRnvuuV5A6xEFO2PghR6B5PXKr16",
    };
    final response = await http.post(
        BUY_CLASS,
        headers: headers,
        body: {
          "course_id"   : courseId.toString(),
          "class_id"   : classId.toString(),
        }
    );
    print("request sent");
    print(response.body);
    Get.back();
    final extractedData = json.decode(response.body);
    final List<CourseRate> loadedRates = [];
    if (response.statusCode == 200 && extractedData['status']) {
      print("convert Success");
      Get.offAll(MenuDashboardPage(),duration: Duration(milliseconds: 150),transition: Transition.leftToRight);
      Get.dialog(SuccessDialog());
    }else{
      Get.back();
      Get.dialog(Center(
          child: ErrorDialog(
            onSave: () {
              Get.back();
            },
            buttonTitle: "المحاولة مرة اخري",
            message: extractedData['message']??"حدث خطأ ما",
          )));
    }
    update();
  }


}