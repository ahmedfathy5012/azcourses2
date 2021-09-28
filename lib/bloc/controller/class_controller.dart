import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:azcourses/bloc/model/class_model.dart';
import '../model/category.dart';
import '../model/offer.dart';
import 'package:http/http.dart' as http;
import 'package:azcourses/helpers/api_helper.dart';
import 'package:connectivity/connectivity.dart';

class ClassController extends GetxController {

  List<ClassModel> classModels=[];
  bool isLoading = false;
  GetStorage box = GetStorage();

  Future<void> fetchClasses({int classId,int categoryId}) async {
    isLoading=true;
    update();
    var connectivityResult = await (Connectivity().checkConnectivity());

//     if (connectivityResult == ConnectivityResult.none)
    // print("connectivity is  ${connectivityResult == ConnectivityResult.none}");

    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + box.read("api_token"),
      // 'Authorization': 'Bearer ' + "\$2y\$10\$1iQ8XhUfP2OMTXOu7P2afeW762dbke9eMSPGtI1orHIk1F0hbK1u.",
    };


    final response = await http.post(
        CLASSES_ENDPOINT,
        headers: headers,
        body: {
          "course_id":classId.toString(),
          "category_id":categoryId.toString()
        }
    );
    print(response.body);
    final extractedData = json.decode(response.body);
    final List<ClassModel> loadedClasses = [];
    if (response.statusCode == 200) {
      // load states
      for (var item in extractedData['data']) {
        loadedClasses.add(ClassModel.fromJson(item));
      }
      print("convert Success");
      classModels = [...loadedClasses];
      print(classModels[0].classVideoModels.length);
      isLoading=false;
      update();
      return 0;
    }
    isLoading=false;
    update();
  }
}
