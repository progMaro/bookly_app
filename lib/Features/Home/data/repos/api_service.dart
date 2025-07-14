import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    final Response response = await _dio.get('$_baseUrl$endpoint');
    return response.data;
  }
}
