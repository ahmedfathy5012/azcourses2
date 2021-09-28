import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:azcourses/bloc/model/course.dart';
import 'package:azcourses/bloc/model/lecturer.dart';
import '../model/category.dart';
import '../model/offer.dart';
import 'package:http/http.dart' as http;
import 'package:azcourses/helpers/api_helper.dart';
import 'package:connectivity/connectivity.dart';

class AllCoursesController extends GetxController {

  List<Course> courses=[];
  bool isLoading = false;
  GetStorage box = GetStorage();
  Future<void> fetchAllCourses({int subjectId,int isRecently=0}) async {
    isLoading=true;
    update();
    var connectivityResult = await (Connectivity().checkConnectivity());
//   if (connectivityResult == ConnectivityResult.none)
    // print("connectivity is  ${connectivityResult == ConnectivityResult.none}");

    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + box.read("api_token"),
     // 'Authorization': 'Bearer ' + "\$2y\$10\$1iQ8XhUfP2OMTXOu7P2afeW762dbke9eMSPGtI1orHIk1F0hbK1u.",
    };
   final response = await http.post(
       ALL_COURSES_ENDPOINT,
       headers: headers,
       body: {
         "subject_id":subjectId.toString(),
         "is_recently" : isRecently.toString(),
       }
   );
   print(response.body);
    print("request sent");
   final extractedData = json.decode(response.body);
    print("request Success");
    courses.clear();
   if (response.statusCode == 200 &&  extractedData['status']) {
     for (var item in extractedData['data']) {
       courses.add(Course.fromJson(item));
     }
     print("convert Success");
     isLoading=false;
     update();
     return 0;
   }
    isLoading=false;
    update();
  }

}
