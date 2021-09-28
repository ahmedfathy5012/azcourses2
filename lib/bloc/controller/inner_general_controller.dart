import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../model/category.dart';
import '../model/offer.dart';
import 'package:http/http.dart' as http;
import 'package:azcourses/helpers/api_helper.dart';
import 'package:connectivity/connectivity.dart';

class InnerGeneralController extends GetxController {

  List<Category> categories=[];
  bool isLoading = false;

  GetStorage box = GetStorage();

  int tabIndex = 0;

  void setTabsIndex(int value) {
    tabIndex = value;
    update();
  }

  Future<void> fetchGenralCourses({int id}) async {
    isLoading=true;
    update();
    var connectivityResult = await (Connectivity().checkConnectivity());

//     if (connectivityResult == ConnectivityResult.none)

    // print("connectivity is  ${connectivityResult == ConnectivityResult.none}");
    print("my id is >> $id");
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + box.read("api_token"),
     // 'Authorization': 'Bearer ' + "\$2y\$10\$1iQ8XhUfP2OMTXOu7P2afeW762dbke9eMSPGtI1orHIk1F0hbK1u.",
    };

   final response = await http.post(INNER_GENERAL_COURSES_ENDPOINT, headers: headers,body: {"id":id.toString()});
   final extractedData = json.decode(response.body);
   final List<Category> loadedCategories = [];
   print(extractedData);
   print(response);
   if (response.statusCode == 200) {
     // load states
     for (var item in extractedData['data']) {
       loadedCategories.add(Category.fromJson(item));
     }
     categories = [...loadedCategories];
     isLoading=false;
     update();
     return 0;
   }
    isLoading=false;
    update();
  }

}
