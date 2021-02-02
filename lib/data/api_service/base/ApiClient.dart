import 'dart:io';
import 'package:dio/dio.dart';
import 'package:informermobile_flutter/data/api_service/constants/EndPoints.dart';
import 'package:informermobile_flutter/data/shared_pref/constants/SharedPrefConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  static Dio _dio;

  static ApiClient _instance;

  ApiClient._();

  static ApiClient get getInstance {
    if (_instance == null) {
      _dio = Dio();
      _dio.options.headers[HttpHeaders.contentTypeHeader] =
          'application/json; charset=UTF-8';
      _dio.options.baseUrl = Endpoints.baseUrl;
      _dio.options.connectTimeout = Endpoints.connectionTimeout;
      _dio.options.receiveTimeout = Endpoints.receiveTimeout;
      _dio.options.followRedirects = false;
      _dio.options.validateStatus = (status) {
        return status < 500;
      };
      _dio.interceptors
          .add(InterceptorsWrapper(onRequest: (Options options) async {
        // getting shared pref instance
        var prefs = await SharedPreferences.getInstance();
        // getting token
        var token = prefs.getString(SharedPrefConstants.auth_token);
        if (token != null) {
          options.headers["user-token"] = token;
        } else {
          print('Auth token is null');
        }
      }));
      _dio.interceptors.add(LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true));
      return ApiClient._();
    } else {
      return _instance;
    }
  }

  Future<dynamic> get(String url,
      {Map<String, dynamic> queryParameters}) async {
    try {
      var response = await _dio.get(
        url,
        queryParameters: queryParameters,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> post(String url,
      {dynamic requestBody, Map<String, dynamic> queryParameters}) async {
    try {
      var response = await _dio.post(
        url,
        data: requestBody,
        queryParameters: queryParameters,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> put(String url,
      {dynamic requestBody, Map<String, dynamic> queryParameters}) async {
    try {
      var response = await _dio.put(
        url,
        data: requestBody,
        queryParameters: queryParameters,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> patch(
    String url, {
    dynamic requestBody,
    Map<String, dynamic> queryParameters,
  }) async {
    try {
      var response = await _dio.patch(
        url,
        data: requestBody,
        queryParameters: queryParameters,
      );
      return response.data;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> delete(String url,
      {dynamic requestBody, Map<String, dynamic> queryParameters}) async {
    try {
      var response = await _dio.delete(
        url,
        data: requestBody,
        queryParameters: queryParameters,
      );
      return response.data;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

}
