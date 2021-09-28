import 'package:azcourses/utils/network_utils.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class MyNewExamsRepository extends NetworkUtil{
  GetStorage box = GetStorage();
  Future<Response> fetchMyNewExams()async{
    Response response = await get(
      url: "fetch_new_exams",
      headers: {
        // 'Authorization': 'Bearer ' + box.read("api_token"),
        'Authorization': 'Bearer ' + "\$2y\$10\$cphA1gvpgoxWVrw65QeNm.JSH.xi34rfiAEKcy0B1DvgEo.gMfaWi"
      },
    );
    return response;
  }
}
