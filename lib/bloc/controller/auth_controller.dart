import 'dart:convert';

import 'package:azcourses/services/device_scrvices.dart';
import 'package:azcourses/ui/screens/global/change_forget_password.dart';
import 'package:azcourses/ui/screens/global/login_screen.dart';
import 'package:azcourses/ui/screens/global/menu_screen.dart';
import 'package:azcourses/ui/screens/global/verfication_screen.dart';
import 'package:azcourses/ui/widgets/global/error_dialog.dart';
import 'package:azcourses/ui/widgets/global/loading_dialog.dart';
import 'package:azcourses/ui/widgets/success_dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:azcourses/bloc/model/auth_user.dart';
import 'package:azcourses/bloc/model/state_location.dart';
import 'package:azcourses/ui/screens/global/start_welcome_screen.dart';
import 'package:azcourses/ui/screens/global/welcome_screen.dart';
import '../../helpers/api_helper.dart';

class AuthController extends GetxController {
  String errorMessage = '';
  List<StateLocation> stateLocations;
  String centerCode=" ";

  void setCenterCode(String code){
    centerCode=code;
  }

  GetStorage box = GetStorage();

  Future<int> login(String userName, String password) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) return 500;
    final prefs = await SharedPreferences.getInstance();
    FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    String token = await _firebaseMessaging.getToken();
    // String token = "await _firebaseMessaging.getToken()";

    Map<String, String> headers = {
      'Accept': 'application/json',
    };
    String deviceId = await DeviceServices.getAndroidDeviceInfo();
      print("my device id is >> $deviceId");
    final response = await http.post(LOGIN_ENDPOINT.toString(),
        headers: headers,
        body: {
       'device_id':deviceId,
      'name': userName.toString(),'phone': userName.toString(), 'password': password.toString(),'device_token':token??"no token"});
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    print(extractedData);
    print(response.body);
      if (response.statusCode == 200 && extractedData["status"] == "true") {
        print("okkkkkk");
        box.write("api_token", extractedData['data']['api_token']);
        box.write("phone", extractedData['data']['phone']);
        print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh ${box.read("phone")}");
        box.write("name", extractedData['data']['name']);
        box.write("info_complete", extractedData['data']['info_compelete']??0);
        box.write("is_primary", extractedData['data']['is_primary']??0);
        box.write("level", extractedData['data']['level']);
        box.write("primary_year", extractedData['data']['primary_year']);
        box.write("university", extractedData['data']['university']);
        box.write("college", extractedData['data']['college']);
        box.write("department", extractedData['data']['department']);
        box.write("college_year", extractedData['data']['college_year']);
        box.write("phone_verify", extractedData['data']['phone_verify']??0);
        if(box.read("info_complete")==1 && box.read("phone_verify")==1){
          box.write("login",1);
        }
        return 0;
      }else{
        errorMessage = extractedData["message_ar"];
        return 1;
      }
  }



  Future<void> checkPhone({String phone ,BuildContext context}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) return 500;
    final prefs = await SharedPreferences.getInstance();

    Map<String, String> headers = {
      'Accept': 'application/json',
    };
    Get.dialog(Center(child: LoadingDialog()));
    final response = await http.post(CHECK_PHONE_END_POINT.toString(),
        headers: headers,
        body: {'phone': phone});
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    print(extractedData);
    print(response.statusCode);
    if (response.statusCode == 200 && extractedData['status']) {
      await verifyPhone(
          context: context,
          phone: phone.startsWith("0")?"+2${phone}" : "+20${phone}",
          // phone: "+201010107168",
          onSucsses: () {
            Get.back();
            Get.offAll(ChangeForgetPassword(phone: phone,),
                transition: Transition.leftToRight);
          });
    } else {
      Get.back();
      Get.dialog(Center(
          child: ErrorDialog(
            onSave: () {
              Get.back();
            },
            buttonTitle: "المحاولة مرة اخري",
            message: extractedData['message']??"حدث خطأ ما",
          )));
    }
  }



  Future<bool> verifyPhone({BuildContext context, String phone, Function onSucsses,bool register=false}) async {
    var _auth = FirebaseAuth.instance;

        _auth.verifyPhoneNumber(
        phoneNumber: phone,
        // phoneNumber: "+201092341428",
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();
          UserCredential result = await _auth.signInWithCredential(credential);
          var user = result.user;
          if (user != null) {
            if(register){
              await setVerifyPhone(onSucces: onSucsses);
            }else{
              onSucsses();
            }
            print("su");
          } else {
            print("Error");
          }
        },
        verificationFailed: verificationFailed,
        codeSent: (String verificationId, [int forceResendingToken]) {
          print("ode sent");
          Get.off(
              VerficationScreen(
                phone: phone,
                validationCode: verificationId,
                onSuccess: (String validationCode, String code) async {
                  AuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: validationCode, smsCode: code);
                  UserCredential result =
                  await _auth.signInWithCredential(credential);
                  var user = result.user;
                  if (user != null){
                    print("hhhhhhhhhhhhhhhhhhhh");
                    if(register){
                      await setVerifyPhone(onSucces: onSucsses);
                    }else{
                      onSucsses();
                    }
                  } else {
                    print(">>>> Error");
                  }
                },
              ),
              transition: Transition.leftToRight,
              curve: Curves.easeInOut);
        },
        codeAutoRetrievalTimeout: (data) {});
  }



  PhoneVerificationFailed verificationFailed = (FirebaseAuthException authException) {
    print(
        'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');

    if (authException.code == "invalid-verification-code") {
      // Get.dialog(
      //     Center(
      //       child: SuccessDialog(),
      //     )
      // );
    }
  };



  Future<void> setVerifyPhone({Function onSucces})async{
    // Get.dialog(Center(child: LoadingDialog()));
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + box.read("api_token"),
    };
    final response = await http.get(PHONE_VERIFY.toString(), headers: headers,);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    print(response.body);
    if(response.statusCode == 200 && extractedData['status']==true){
      box.write("phone_verify", extractedData['data']['phone_verify']??0);
      onSucces();
      Get.dialog(
          SuccessDialog(title: "تم تأكيد حسابك بنجاح",)
      );
    }else{
      Get.back();
      Get.dialog(Center(
          child: ErrorDialog(
            onSave: () {
              Get.back();
            },
            buttonTitle: "المحاولة مرة اخري",
            message:extractedData['message']??"المحاولة مرة اخري",
          )));
    }
  }



  Future<void> changePassword({String oldPassword, String newPassword}) async {
    Get.dialog(Center(child: LoadingDialog()));
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) return 500;
    final prefs = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + box.read("api_token"),
    };
    final response = await http.post(CHANGE_PASSWORD.toString(),
        headers: headers,
        body: {'old_password': oldPassword.toString(), 'new_password': newPassword.toString()});
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    print(response.body);
    Get.back();
    if(response.statusCode == 200 && extractedData['status']=="true"){
      logout();
      Get.dialog(
          SuccessDialog(title: "تم تغيير كلمة المرور بنجاح",)
      );
    }else{
      // Get.back();
      Get.dialog(Center(
          child: ErrorDialog(
            onSave: () {
              Get.back();
            },
            buttonTitle: "المحاولة مرة اخري",
            message:extractedData['data']??"المحاولة مرة اخري",
          )));
    }

  }

  Future<void> resetPassword({String phone , String password}) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
    };

    Get.dialog(Center(child: LoadingDialog()));
    final response = await http.post(
      RESET_PASSWORD_ENDPOINT,
      headers: headers,
      body: {
        'password' : password,
        'phone' : phone,
      }
    );
    final extractedData = json.decode(response.body) as Map<String, dynamic>;

    print(response.statusCode);
    if(response.statusCode==200 &&extractedData['status']){
      Get.back();
      Get.offAll(StartWelcomeScreen(),transition: Transition.leftToRight,duration: Duration(milliseconds: 150));
      Get.dialog(SuccessDialog());
    }else{
      Get.back();
      Get.dialog(Center(
          child: ErrorDialog(
            onSave: () {
              Get.back();
            },
            buttonTitle: "المحاولة مرة اخري",
            message:extractedData['message']??"المحاولة مرة اخري",
          )));
    }
  }

  Future<int> firstRegister(AuthUser authUser) async {
    FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    // String token = await _firebaseMessaging.getToken();
    String token = await _firebaseMessaging.getToken();
    Map<String, String> headers = {
      'Accept': 'application/json',
    };
    String deviceId = await DeviceServices.getAndroidDeviceInfo();
    final response = await http
        .post(FIRST_REGISTER_ENDPOINT.toString(), headers: headers, body: {
      'name': authUser.userName,
      'phone': authUser.phone,
      'device_id':deviceId,
      'email':" ",
      //'is_student': authUser.isStudent.toString(),
      'password': authUser.password,
      'state_id':1.toString(),
      'city_id':1.toString(),
      'device_token' : token??"no token",
      if(centerCode.isNotEmpty)
      'code':centerCode,
      //'year_id': authUser.yearId.toString(),
    });
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    print(extractedData);
    print(response.statusCode);
    if (response.statusCode == 401) {
      errorMessage = extractedData["message_ar"];
      return 1;
    } else {
      if (response.statusCode == 200 && extractedData["status"] == "true") {
        box.write("api_token", extractedData['data']['api_token']);
        box.write("phone", extractedData['data']['phone']);
        box.write("name", extractedData['data']['name']);
        box.write("info_complete", extractedData['data']['info_compelete']??0);

        box.write("is_primary", extractedData['data']['is_primary']);
        box.write("level", extractedData['data']['level']);
        box.write("primary_year", extractedData['data']['primary_year']);

        box.write("phone_verify", extractedData['data']['phone_verify']??0);

        box.write("university", extractedData['data']['university']);
        box.write("college", extractedData['data']['college']);
        box.write("department", extractedData['data']['department']);
        box.write("college_year", extractedData['data']['college_year']);
        // box.write("is_student", extractedData['data']['is_student']);
        return 0;
      }
      return 2;
    }
  }

  Future<int> secondRegister({AuthUser authUser,bool isVisitor=false,bool isEdit=false}) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      if(box.hasData("api_token"))
      'Authorization': 'Bearer ' + box.read("api_token"),
      // 'Authorization': 'Bearer ' + "\$2y\$10\$gJXDlBMIO.eqEw7sxI8tdOO/AZTlcNDMGEjAOlpyuvYIm/rTCISrm",
    };
    Get.dialog(Center(child: LoadingDialog()));
    print("${authUser.universityId},${authUser.collegeId},${authUser.departmentId},${authUser.collegeYearId},${ authUser.isPrimary}");
    final response =
        await http.post(SECOND_REGISTER_ENDPOINT, headers: headers, body: {
      'is_primary': authUser.isPrimary,
      'year_id': authUser.primaryYearId??null,
      'stage_id': authUser.primaryStageId??null,
      'is_scientific': 1.toString(),

       'university_id':authUser.universityId??null,
       'college_id' : authUser.collegeId??null,
       'department_id' : authUser.departmentId??null,
       'college_year_id' : authUser.collegeYearId??null
    });
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    print(extractedData);
    print(response.statusCode);
    Get.back();
    if(response.statusCode==200){
      box.write("api_token", extractedData['data']['api_token']);
      box.write("phone", extractedData['data']['phone']);
      box.write("name", extractedData['data']['name']);
      box.write("is_student", extractedData['data']['is_student']);
      box.write("info_complete", extractedData['data']['info_compelete']??0);
      box.write("is_primary", extractedData['data']['is_primary']);
      box.write("level", extractedData['data']['level']);
      box.write("primary_year", extractedData['data']['primary_year']);

      box.write("phone_verify", extractedData['data']['phone_verify']??0);

      box.write("university", extractedData['data']['university']);
      box.write("college", extractedData['data']['college']);
      box.write("department", extractedData['data']['department']);
      box.write("college_year", extractedData['data']['college_year']);
      if(!isVisitor){
        box.write("login",1);
      }
      if(isEdit){
        logout();
        Get.dialog(
            SuccessDialog(title: "تم تغيير المعلومات بنجاح",)
        );
      }else{
        Get.offAll(MenuDashboardPage(),
            duration: Duration(milliseconds: 100),
            transition: Transition.leftToRight);
      }

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
    // if (response.statusCode == 401) {
    //   errorMessage = extractedData["message_ar"];
    //   return 1;
    // } else {
    //   if (response.statusCode == 200 && extractedData["status"] == "true") {
    //     box.write("api_token", extractedData['data']['api_token']);
    //     box.write("name", extractedData['data']['user_name']);
    //     box.write("is_student", extractedData['data']['is_student']);
    //     if(!isVisitor){
    //       box.write("login",1);
    //     }
    //     return 0;
    //   }
    //   return 2;
    // }
  }

  Future<void> fetchStates() async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      if (box.hasData("api_token"))
        'Authorization': 'Bearer ' + box.read("api_token"),
    };

    final response = await http.get(STATES_ENDPOINT, headers: headers);
    final extractedData = json.decode(response.body);
    final List<StateLocation> loadedStates = [];

    if (response.statusCode == 200) {
      // load states
      for (var item in extractedData['data']) {
        loadedStates.add(StateLocation.fromJson(item));
      }
      stateLocations = loadedStates;
      update();
    }
  }

  void logout({bool logOut=true}) async{

   if(logOut){
     Get.dialog(Center(child: LoadingDialog()));
     Map<String, String> headers = {
       'Accept': 'application/json',
       if (box.hasData("api_token"))
         'Authorization': 'Bearer ' + box.read("api_token"),
     };
     final response = await http.get(LOG_OUT_ENDPOINT, headers: headers);
     if (response.statusCode == 200) {
       box.erase();
       Get.offAll(StartWelcomeScreen(),duration: Duration(milliseconds: 150),transition: Transition.leftToRight);
     }else{
       Get.back();
     }
   }else{
     box.erase();
     Get.to(StartWelcomeScreen(),duration: Duration(milliseconds: 150),transition: Transition.leftToRight);
   }
  }
}

