import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<dynamic> get({
    required String url,
    dynamic data,
    dynamic params,
  }) async {
    final response = await _dio.get(
      url,
      data: data,
      queryParameters: params,
    );
    return response.data;
  }

  Future<dynamic> post({
    required String url,
    dynamic data,
    dynamic params,
  }) async {
    final response = await _dio.post(
      url,
      data: data,
      queryParameters: params,
    );
    return response.data;
  }

  Future<dynamic> put(
      {required String url, dynamic data, dynamic params}) async {
    var response = await _dio.put(url, data: data, queryParameters: params);
    return response.data;
  }

  Future<dynamic> patch(
      {required String url, dynamic data, dynamic params}) async {
    final response = await _dio.patch(url, data: data, queryParameters: params);
    return response.data;
  }

  Future<dynamic> delete({required String url}) async {
    var response = await _dio.delete(url);
    return response.data;
  }
}
