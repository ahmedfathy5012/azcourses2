import 'dart:convert';

import 'package:azcourses/ui/widgets/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:azcourses/bloc/model/course_rate.dart';
import 'package:http/http.dart' as http;
import 'package:azcourses/helpers/api_helper.dart';
import 'package:azcourses/ui/widgets/global/error_dialog.dart';
import 'package:azcourses/ui/widgets/global/loading_dialog.dart';


class RateController extends GetxController{
  List<CourseRate> rates= [];
  bool isLoading;
  int allRates=0;
  int rateCollection=0;
  GetStorage box = GetStorage();

  Future<void> fetchCourseRates({int courseId}) async {
    isLoading=true;
    update();
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + box.read("api_token"),
      // 'Authorization': 'Bearer ' +
      //     // "\$2y\$10\$1iQ8XhUfP2OMTXOu7P2afeW762dbke9eMSPGtI1orHIk1F0hbK1u.",
      //     "\$2y\$10\$S6xv15jKV5xYu5kksYiN9u0.QzRnvuuV5A6xEFO2PghR6B5PXKr16",
    };
    rates.clear();
    allRates=0;
    rateCollection=0;
    final response = await http.post(
        COURSE_RATE,
        headers: headers,
        body: {
          "course_id"   : courseId.toString(),
          // "category_id" : 2.toString()
        }
    );
    print("request sent");
    print(response.body);
    final extractedData = json.decode(response.body);
    final List<CourseRate> loadedRates = [];
    if (response.statusCode == 200) {
      rateCollection = int.tryParse(extractedData['averagerate'].toString());
      for (var item in extractedData['data']) {
        loadedRates.add(CourseRate.fromJson(item));
      }
    }
    rates = [...loadedRates];
    print("convert Success");
    isLoading=false;
    update();
  }



  Future<void> rateCourse({int courseId,int rateCount,String comment=" "}) async {
    Get.dialog(Center(child: LoadingDialog()));
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + box.read("api_token"),
      // 'Authorization': 'Bearer ' +
      //     // "\$2y\$10\$1iQ8XhUfP2OMTXOu7P2afeW762dbke9eMSPGtI1orHIk1F0hbK1u.",
      //     "\$2y\$10\$S6xv15jKV5xYu5kksYiN9u0.QzRnvuuV5A6xEFO2PghR6B5PXKr16",
    };
    CourseRate rate;
    final response = await http.post(
        RATE_COURSE,
        headers: headers,
        body: {
          "course_id"   : courseId.toString(),
          "rate":rateCount.toString(),
          "comment" :comment,
        }
    );
    print(response.body);
    Get.back();
    final extractedData = json.decode(response.body);
    final List<CourseRate> loadedRates = [];
    if (response.statusCode == 200) {
      Get.back();
     if(extractedData['data']!=null)
       {
         rate = CourseRate.fromJson(extractedData['data']);
         rates.insert(0,rate);
         Get.dialog(SuccessDialog());
         update();
       }
    }else{
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