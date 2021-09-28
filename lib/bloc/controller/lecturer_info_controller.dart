import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:azcourses/bloc/model/course.dart';
import 'package:azcourses/bloc/model/course_rate.dart';
import 'package:http/http.dart' as http;
import 'package:azcourses/bloc/model/lecturer.dart';
import 'package:azcourses/helpers/api_helper.dart';


class LecturerInfoController extends GetxController{
  List<Course> courses= [];
  Lecturer lecturer;

  int id;


  LecturerInfoController({this.id});

  bool isLoading=false;
  GetStorage box = GetStorage();
  Future<void> fetchLecturerInfo({int lecturerId}) async {
    isLoading=true;
    update();
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + box.read("api_token"),
      // 'Authorization': 'Bearer ' +
          // "\$2y\$10\$1iQ8XhUfP2OMTXOu7P2afeW762dbke9eMSPGtI1orHIk1F0hbK1u.",
          // "\$2y\$10\$S6xv15jKV5xYu5kksYiN9u0.QzRnvuuV5A6xEFO2PghR6B5PXKr16",
    };
    courses.clear();
    lecturer = Lecturer();
    final response = await http.post(
        LECTURER_INFO,
        headers: headers,
        body: {
          "lecturer_id"   : lecturerId.toString(),
        }
    );
    print("request sent");
    print(response.body);
    final extractedData = json.decode(response.body);
    final List<Course> loadedCourses = [];
    Lecturer loadedLecturer = Lecturer.fromJson(extractedData['info']);
    if (response.statusCode == 200) {

      for (var item in extractedData['courses']) {
        loadedCourses.add(Course.fromJson(item));
      }
    }
    courses = [...loadedCourses];
    lecturer = loadedLecturer;
    print(courses.length);
    print("convert Success");
    isLoading=false;
    update();
  }

}