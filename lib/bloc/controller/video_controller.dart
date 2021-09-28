import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../helpers/api_helper.dart';
import '../model/video_model.dart';
import '../model/video_model.dart';
import 'package:http/http.dart' as http;

class VideoController extends GetxController {
  List<VideoModel> teacherVideoModels;
  List<VideoModel> videos;

  GetStorage box = GetStorage();

  Future<int> fetchVideosByTeacherId({int teacherID}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) return 1;

    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + box.read("api_token"),
//      'Authorization': 'Bearer ' +
//          "\$2y\$10\$A3wH0VpkVhMc5qs5xnP0r.Dxt98rleRNt8t2TjKeq20cv3/Li90Ai",
    };

    final response =
        await http.get(TEACHER_VIDEOS_ENDPOINT(teacherID), headers: headers);
    final extractedData = json.decode(response.body);
    final List<VideoModel> loadedVideos = [];
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      // load states
      for (var item in extractedData['data']) {
        loadedVideos.add(VideoModel.fromJson(item));
      }
      teacherVideoModels = loadedVideos;
      update();
      return 0;
    }
  }

  Future<int> fetchRecentlyVideosByCategoryId(
      {int categoryID, int isClosest}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) return 1;
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + box.read("api_token"),
//      'Authorization': 'Bearer ' +
//          "\$2y\$10\$A3wH0VpkVhMc5qs5xnP0r.Dxt98rleRNt8t2TjKeq20cv3/Li90Ai",
    };

    final response = await http.post(VIEW_ALL_ENDPOINT,
        headers: headers,
        body: {
          "category_id": categoryID.toString(),
          "status": isClosest.toString()
        });
    final extractedData = json.decode(response.body);
    final List<VideoModel> loadedVideos = [];
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      // load states
      for (var item in extractedData['data']) {
        loadedVideos.add(VideoModel.fromJson(item));
      }
      videos = loadedVideos;
      update();
      return 0;
    }
  }

  Future<int> fetchVideosByTypeId({int categoryID, int typeId}) async {
    print(typeId);
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) return 1;
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + box.read("api_token"),
    };

    final response = await http.post(VIEW_ALL_IN_TYPE_ENDPOINT,
        headers: headers,
        body: {
          "subject_id": categoryID.toString(),
          "type_id": typeId.toString()
        });
    final extractedData = json.decode(response.body);
    final List<VideoModel> loadedVideos = [];
    print(response.body);
    if (response.statusCode == 200) {
      // load states
      for (var item in extractedData['data']) {
        loadedVideos.add(VideoModel.fromJson(item));
      }
      videos = loadedVideos;
      update();
      return 0;
    }
  }

  Future<int> fetchVideosBySubTypeId(
      {int categoryID, int typeId, int subTypeId}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) return 1;
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + box.read("api_token"),
    };

    final response =
        await http.post(VIEW_ALL_IN_SUBTYPE_ENDPOINT, headers: headers, body: {
      "subject_id": categoryID.toString(),
      "type_id": typeId.toString(),
      "subtype_id": subTypeId.toString()
    });
    final extractedData = json.decode(response.body);
    final List<VideoModel> loadedVideos = [];
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      // load states
      for (var item in extractedData['data']) {
        loadedVideos.add(VideoModel.fromJson(item));
      }
      videos = loadedVideos;
      update();
      return 0;
    }
  }

  Future<int> fetchVideosByCategoryId({int categoryID}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) return 1;
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + box.read("api_token"),
//      'Authorization': 'Bearer ' +
//          "\$2y\$10\$A3wH0VpkVhMc5qs5xnP0r.Dxt98rleRNt8t2TjKeq20cv3/Li90Ai",
    };

    final response = await http.get(
      VIEW_ALL_CATEGORIES_ENDPOINT(categoryID),
      headers: headers,
    );
    final extractedData = json.decode(response.body);
    final List<VideoModel> loadedVideos = [];
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      // load states
      for (var item in extractedData['data']) {
        loadedVideos.add(VideoModel.fromJson(item));
      }
      videos = loadedVideos;
      update();
      return 0;
    }
  }
}
