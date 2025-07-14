import 'package:dio/dio.dart';

abstract class Faliure {
  final String errMessage;

  const Faliure(this.errMessage);
}

class ServerFaliure extends Faliure {
  ServerFaliure(super.errMessage);

  factory ServerFaliure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.sendTimeout:
        return ServerFaliure('Send timeout with API server');
      case DioExceptionType.receiveTimeout:
        return ServerFaliure('Receive timeout with API server');
      case DioExceptionType.badCertificate:
        return ServerFaliure('Bad certificate with API server');
      case DioExceptionType.badResponse:
        return ServerFaliure.fromBadResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFaliure('Request to API server was canceled');
      case DioExceptionType.connectionError:
        return ServerFaliure('Connection error with API server');
      case DioExceptionType.unknown:
        return ServerFaliure(dioError.toString());

      case DioExceptionType.connectionTimeout:
        return ServerFaliure('Connection timeout with API server');
      default:
        return ServerFaliure('there was an error , please try again later');
    }
  }
  factory ServerFaliure.fromBadResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFaliure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFaliure('Your request not found , please try later');
    } else {
      return ServerFaliure('there was an error , please try again later');
    }
  }
}
