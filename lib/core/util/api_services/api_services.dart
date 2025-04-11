import 'dart:convert';

import 'package:dio/dio.dart';

class ApiService {
  final Dio dioHelper;
  ApiService(this.dioHelper);
  Future<Map<String, dynamic>> get(String endPoint,
      {Map<String, dynamic>? query, Object? data}) async {
    var response = await dioHelper.get(
      endPoint,
      data: data,
      queryParameters: query,
      options: Options(headers: {'ngrok-skip-browser-warning': 'true'}),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> postOTP(String endPoint,
      {Map<String, dynamic>? query, Object? data}) async {
    var response = await dioHelper.post(
      endPoint,
      data: data,
      queryParameters: query,
      options: Options(headers: {'ngrok-skip-browser-warning': 'true'}),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> postData(
      String endPoint, Map<String, dynamic> query) async {
    var response = await dioHelper.post(
      endPoint,
      data: jsonEncode(query),
      options: Options(headers: {'ngrok-skip-browser-warning': 'true'}),
    );
    return response.data;
  }
}
