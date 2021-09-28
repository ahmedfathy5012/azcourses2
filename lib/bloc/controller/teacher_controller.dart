import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:azcourses/bloc/model/teacher.dart';
import 'package:http/http.dart' as http;

import '../../helpers/api_helper.dart';

class TeacherController extends GetxController {
  Teacher teacher;
  int id;


  GetStorage box = GetStorage();

  Future<int> fetchTeacher({int teacherID}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) return 1;
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + box.read("api_token"),
//      'Authorization': 'Bearer ' +
//          "\$2y\$10\$A3wH0VpkVhMc5qs5xnP0r.Dxt98rleRNt8t2TjKeq20cv3/Li90Ai",
    };

    final response =
        await http.get(TEACHER_PROFILE_ENDPOINT(teacherID), headers: headers);
    final extractedData = json.decode(response.body);
    print(response.statusCode);
    print(extractedData);
    if (response.statusCode == 200) {
      // load states
      teacher = Teacher.fromJson(extractedData['data']);
      print(teacher.subject);
      update();
      return 0;
    }
  }
}
