// ignore_for_file: type_annotate_public_apis

import 'package:dio/dio.dart';

// ignore: avoid_classes_with_only_static_members
class DioHelper {
  static Dio? dio;

  // ignore: always_declare_return_types
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://lavie.orangedigitalcenteregypt.com/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };
    return dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = 'en',
    String? token = 'null',
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };
    return dio!.post(endPoint, queryParameters: query, data: data);
  }

  static Future<Response> putData({
    required String endPoint,
    Map<String, dynamic>? query,
    required data,
    String lang = 'en',
    String? boundary,
    String? token = 'null',
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': "Bearer $token",
      'Content-Type': 'multipart/form-data'
    };
    return dio!.put(endPoint, queryParameters: query, data: data);
  }
}

// ignore: avoid_classes_with_only_static_members
class DioPay {
  static Dio? dio;

  // ignore: always_declare_return_types
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://gradproject-hmis-app.herokuapp.com/api/v1/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };
    return dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = 'en',
    String? token = 'null',
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };
    return dio!.post(endPoint, queryParameters: query, data: data);
  }

  static Future<Response> putData({
    required String endPoint,
    Map<String, dynamic>? query,
    required data,
    String lang = 'en',
    String? boundary,
    String? token = 'null',
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': "Bearer $token",
      'Content-Type': 'multipart/form-data'
    };
    return dio!.put(endPoint, queryParameters: query, data: data);
  }
}

// https://newsapi.org/
// v2/everything
// query
// apiKey=73494344d158448a8fd7388b12e8f00a
