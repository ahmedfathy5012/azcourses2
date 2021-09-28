import 'dart:convert';

import 'package:azcourses/bloc/model/notification_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:azcourses/bloc/model/course.dart';
import '../model/category.dart';
import '../model/offer.dart';
import 'package:http/http.dart' as http;
import 'package:azcourses/helpers/api_helper.dart';
import 'package:connectivity/connectivity.dart';

class NotificationsController extends GetxController {

  List<NotificationModel> notifications=[];
  bool isLoading = false;





  GetStorage box = GetStorage();
  Future<void> fetchNotifications() async {
    isLoading=true;
    update();

    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + box.read("api_token"),
     // 'Authorization': 'Bearer ' + "\$2y\$10\$1iQ8XhUfP2OMTXOu7P2afeW762dbke9eMSPGtI1orHIk1F0hbK1u.",
    };
   final response = await http.get(NOTIFICATIONS_ENDPOINT, headers: headers);
   print(response.body);
    print("request sent");
   final extractedData = json.decode(response.body);
    print("request Success");
    notifications.clear();
   if (response.statusCode == 200 &&  extractedData['status']) {
     for (var item in extractedData['notifications']) {
       notifications.add(NotificationModel.fromJson(item['data']['data']));
     }

     print("convert Success");
     isLoading=false;
     update();
     return 0;
   }
    isLoading=false;
    update();
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchNotifications();
  }

}
