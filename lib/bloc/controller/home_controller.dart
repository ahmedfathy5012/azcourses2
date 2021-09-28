import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../model/category.dart';
import '../model/offer.dart';
import 'package:http/http.dart' as http;
import 'package:azcourses/helpers/api_helper.dart';
import 'package:connectivity/connectivity.dart';

class HomeController extends GetxController {

  List<Category> categories=[];
  List<Offer> offers=[];
  bool isLoading = false;

  GetStorage box = GetStorage();

  int tabIndex = 0;

  int listAverageIndex = 0;

  setAverage(){
    listAverageIndex = int.tryParse((offers.length/2).toString());
  }




  void setTabsIndex(int value) {
    tabIndex = value;
    update();
  }


  Future<void> fetchHome() async {
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


   final response = await http.get(HOME_ENDPOINT, headers: headers);
   final extractedData = json.decode(response.body);
   final List<Category> loadedCategories = [];
   final List<Offer> loadedOffers = [];
   print(extractedData);
   print(response);
   if (response.statusCode == 200) {
     // load states
     for (var item in extractedData['data']) {
       loadedCategories.add(Category.fromJson(item));
     }
     for (var item in extractedData['offers']) {
       loadedOffers.add(Offer.fromJson(item));
     }
     // for (var item in extractedData['offer']) {
     //   loadedOffers.add(Offer.fromJson(item));
     // }
     print("conver Success");
     categories = [...loadedCategories];
     offers =     [...loadedOffers];
     print(categories.length);
     setAverage();
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
    fetchHome();
  }
}
