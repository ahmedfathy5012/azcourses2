import 'dart:convert';

import 'package:azcourses/ui/widgets/success_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:azcourses/bloc/controller/auth_controller.dart';
import 'package:azcourses/bloc/model/auth_user.dart';
import 'package:azcourses/bloc/model/center_model.dart';
import 'package:azcourses/bloc/model/course.dart';
import 'package:azcourses/bloc/model/lecturer.dart';
import 'package:azcourses/ui/screens/global/request_center_register_screen.dart';
import 'package:azcourses/ui/screens/global/request_center_screen.dart';
import 'package:azcourses/ui/widgets/global/error_dialog.dart';
import 'package:azcourses/ui/widgets/global/progress_widget.dart';
import 'package:azcourses/utils/constants.dart';
import '../model/category.dart';
import '../model/offer.dart';
import 'package:http/http.dart' as http;
import 'package:azcourses/helpers/api_helper.dart';
import 'package:connectivity/connectivity.dart';

class CenterController extends GetxController {


  AuthController _authController = Get.put(AuthController());

  List<CenterModel> centers=[];
  CenterModel centerModel;
  bool isLoading = false;
  String errorMessage;
  GetStorage box = GetStorage();
  Future<void> fetchCenters() async {
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
   final response = await http.get(
       MY_CENTERS_ENDPOINT,
       headers: headers,
   );
   print(response.body);
    print("request sent");
   final extractedData = json.decode(response.body);
    print("request Success");
    centers.clear();
   if (response.statusCode == 200 &&  extractedData['status']) {
     for (var item in extractedData['data']) {
       centers.add(CenterModel.fromJson(item));
     }
     print("convert Success");
     isLoading=false;
     update();
     return 0;
   }
    isLoading=false;
    update();
  }

  Future<void> fetchCenter({String centerCode,bool isRegister=false,Function onSuccess}) async {
    isLoading=true;
    update();
    // var connectivityResult = await (Connectivity().checkConnectivity());
//   if (connectivityResult == ConnectivityResult.none)
    // print("connectivity is  ${connectivityResult == ConnectivityResult.none}");

    Map<String, String> headers = {
      'Accept': 'application/json',
      // 'Authorization': 'Bearer ' + box.read("api_token"),
      // 'Authorization': 'Bearer ' + "\$2y\$10\$1iQ8XhUfP2OMTXOu7P2afeW762dbke9eMSPGtI1orHIk1F0hbK1u.",
    };
    centerModel = CenterModel();
    Get.dialog(
      Center(
        child: ProgressWidget(color: isRegister?Color(0xffffffff):MAINCOLOR,),
      ),
    );
    final response = await http.post(
      CENTER_ENDPOINT,
      headers: headers,
      body: {
        "code" :centerCode.toString()
      }
    );
    print(response.body);
    print("request sent");
    final extractedData = json.decode(response.body);
    print("request Success");
    if (response.statusCode == 200 &&  extractedData['status']) {
     centerModel = CenterModel.fromJson(extractedData['data']);
     Get.back();
      print("convert Success");
      isLoading=false;
      update();
      if(isRegister){
        _authController.setCenterCode(centerCode);
      }
      Get.to(
        isRegister?
          RequestCenterRegisterScreen(centerModel: centerModel,):
          RequestCenterScreen(centerModel: centerModel,),
          duration: Duration(milliseconds: 100),
          transition: Transition.cupertino);
      return;
    }else{
     // errorMessage = extractedData['message']??null;
    }
    isLoading=false;
    update();
    Get.back();
    Get.dialog(Center(
        child: ErrorDialog(
            onSave: () {Get.back();},
            buttonTitle: "المحاولة مرة اخري",
            message: extractedData['message']??"حدث خطأ ما")));
  }


  Future<void> AddCenter({String centerCode}) async {
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
    centerModel = CenterModel();
    Get.dialog(
        Center(
          child: ProgressWidget(),
        ),
    );
    final response = await http.post(
        ADD_CENTER_ENDPOINT,
        headers: headers,
        body: {
          "code" :centerCode.toString()
        }
    );
    print(response.body);
    print("request sent");
    final extractedData = json.decode(response.body);
    print("request Success");
    if (response.statusCode == 200 &&  extractedData['status']) {
      centerModel = CenterModel.fromJson(extractedData['data']);
      Get.back();
      Get.dialog(
          SuccessDialog(title: "تم اضافة المركز بنجاح",)
      );
      print("convert Success");
      isLoading=false;
      update();
      Get.back();
      Get.back();
      return 0;
    }else{
      // Get.back();
      // Get.back();
      //errorMessage = extractedData['message']??null;
    }
    isLoading=false;
    update();
    Get.dialog(Center(
        child: ErrorDialog(
            onSave: () {Get.back();},
            buttonTitle: "المحاولة مرة اخري",
            message: extractedData['message']??"حدث خطأ ما")));
  }

}
