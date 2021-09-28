import 'package:azcourses/utils/network_utils.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class MyCurrentExamsRepository extends NetworkUtil{
  GetStorage box = GetStorage();
  Future<Response> fetchMyCurrentExams()async{
    Response response = await get(
      url: "fetch_current_exams",
      headers: {
        // 'Authorization': 'Bearer ' + box.read("api_token"),
        'Authorization': 'Bearer ' + "\$2y\$10\$meIJI2Um.B9zgpcGS7U3wOlv9A7rgLO.FVWAZIa9H/2BU1Dntbjku"
      },
    );
    return response;
  }
}
