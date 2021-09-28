import 'package:azcourses/utils/network_utils.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class LibraryRepository extends NetworkUtil{
  GetStorage box = GetStorage();
  Future<Response> fetchLibrary({int subjectId})async{
    Response response = await post(
      url: "fetch_my_library",
      headers: {
        // 'Authorization': 'Bearer ' + box.read("api_token"),
        'Authorization': 'Bearer ' + "\$2y\$10\$meIJI2Um.B9zgpcGS7U3wOlv9A7rgLO.FVWAZIa9H/2BU1Dntbjku"
      },
      body: {
        'subjects_id'  : subjectId
      }
    );
    return response;
  }
}
