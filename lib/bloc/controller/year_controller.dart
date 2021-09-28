import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:azcourses/bloc/model/year.dart';
import 'package:http/http.dart' as http;
import 'package:azcourses/helpers/api_helper.dart';

class YearController extends GetxController {
  List<YearModel> years;

  GetStorage box = GetStorage();

  Future<void> fetchYears() async {
    Map<String, String> headers = {
      'Accept': 'application/json',
    };

    final response = await http.get(YEARS_ENDPOINT, headers: headers);
    final extractedData = json.decode(response.body);

    final List<YearModel> loadedYears = [];
    print(response.body);
    if (response.statusCode == 200) {
      // load states
      for (var item in extractedData['data']) {
        loadedYears.add(YearModel.fromJson(item));
      }
      years = loadedYears;
      update();
    }
  }
}
