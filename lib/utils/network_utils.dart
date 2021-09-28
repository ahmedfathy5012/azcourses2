import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class NetworkUtil {

  String baseUrl = "https://coursat.crazyideaco.com/public/api/";

  Dio dio = Dio();

  Future<Response> get({@required String url, Map<String , String> headers}) async {
    var response;
    try {
      dio.options.baseUrl = baseUrl;
      response = await dio.get(url, options: Options(headers: headers));
    } on DioError catch (e) {
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse(response);
  }

  Future<Response> post({@required String url,
    Map<String , String> headers, Map<String , dynamic> body, encoding}) async {
    var response;
    dio.options.baseUrl = baseUrl;
    try {
      response = await dio.post(url,
          data: body,
          options: Options(headers: headers, requestEncoder: encoding));
    } on DioError catch (e) {
      if (e.response != null) {
        response = e.response;
      }
    }
    return handleResponse(response);
  }

  Response handleResponse(Response response) {
    final int statusCode = response.statusCode??500;
    // print("correrct request: " + response.toString());
    if (statusCode >= 200 && statusCode < 300) {
      print("correrct request: " + response.toString());
      return response;
    } else {
      print("request error: " + response.toString());
      return response;
    }
  }

}
