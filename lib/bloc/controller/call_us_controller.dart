import 'dart:convert';

import 'package:azcourses/helpers/api_helper.dart';
import 'package:azcourses/ui/widgets/global/error_dialog.dart';
import 'package:azcourses/ui/widgets/global/loading_dialog.dart';
import 'package:azcourses/ui/widgets/success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;


class CallUsController extends GetxController{


  GetStorage box = GetStorage();

  Future<int> callUS({String content}) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
        'Authorization': 'Bearer ' + box.read("api_token"),
      // 'Authorization': 'Bearer ' + "\$2y\$10\$gJXDlBMIO.eqEw7sxI8tdOO/AZTlcNDMGEjAOlpyuvYIm/rTCISrm",
    };
    Get.dialog(Center(child: LoadingDialog()));
    final response =
    await http.post(SECOND_REGISTER_ENDPOINT, headers: headers, body: {
      'message': content,
    });
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    print(extractedData);
    print(response.statusCode);
    Get.back();
    if(response.statusCode==200){
     Get.back();
     Get.dialog(
         SuccessDialog(title: "تم ارسال الرسالة بنجاح",)
     );
    }else{
      Get.dialog(Center(
          child: ErrorDialog(
            onSave: () {
              Get.back();
            },
            buttonTitle: "المحاولة مرة اخري",
            message: extractedData["message_ar"]??"حدث خطأ ما",
          )));
    }
  }
}