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


class LecturerCoverController extends GetxController{
  String cover;
  bool isLoading=false;


  int id;


  LecturerCoverController({
    this.id
});

  GetStorage box = GetStorage();

  Future<void> fetchCover() async {
    print("lhsdfkjhsdkjhfksjdfl");
    isLoading=true;
    update();
    Map<String, String> headers = {
      'Accept': 'application/json',
    };
    final response = await http.post(
        LECTURER_COVER,
        headers: headers,
        body: {
          "id"   : this.id.toString(),
          // "id"   : 342.toString(),
        }
    );
    print("request cover sent");
    print(response.body);
    final extractedData = json.decode(response.body);
    cover = " ";
    if (response.statusCode == 200) {
      cover = extractedData['data']['cover']??" ";
      }
    isLoading=false;
    update();
  }


  @override
  void onInit() {
    super.onInit();
    fetchCover();
  }
}