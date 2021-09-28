import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:azcourses/bloc/model/collector_stage_model.dart';
import 'package:azcourses/bloc/model/primary_stage_model.dart';
import 'package:azcourses/helpers/api_helper.dart';



class StageController extends GetxController{
  bool isLoading = false;
   List<PrimaryStageModel> primaryStage = [];
   List<CollectorStageModel> collectorStage = [];
  Future<void> fetchStages() async {
    // var connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.none) return 500;
    // print("connectivity is  ${connectivityResult == ConnectivityResult.none}");
    isLoading=true;
    update();
    Map<String, String> headers = {
      'Accept': 'application/json',
    };

   final response = await http.get(STAGE_ENDPOINT, headers: headers);
   final extractedData = json.decode(response.body);
   final List<PrimaryStageModel> primaryStageLoad = [];
   final List<CollectorStageModel> CollectorStageLoad = [];
   print(extractedData);
   print(response.statusCode);
   if (response.statusCode == 200) {
     // load states
     for (var item in extractedData['primary']) {
       primaryStageLoad.add(PrimaryStageModel.fromJson(item));
     }
     for (var item in extractedData['collectors']) {
       CollectorStageLoad.add(CollectorStageModel.fromJson(item));
     }
     primaryStage = primaryStageLoad;
     collectorStage = CollectorStageLoad;
     print("primary >> ${primaryStage[0].id}");
   }
    isLoading=false;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchStages();
  }
}