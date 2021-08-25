import 'package:dio/dio.dart';

class DataException implements Exception {
  DataException({required this.message});

  DataException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "RequestCancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "ConnectionTimeout";
        break;
      case DioErrorType.receiveTimeout:
        message = "ReceiveTimeout";
        break;
      case DioErrorType.response:
        message = _handleError(dioError.response!.statusCode!);
        break;
      case DioErrorType.sendTimeout:
        message = "SendTimeout";
        break;
      default:
        message = "InternetConnection";
        break;
    }
  }

  String message = "";

  String _handleError(int statusCode) {
    switch (statusCode) {
      case 400:
        return "BadRequest";
      case 404:
        return "RequestNotFound";
      case 500:
        return "IntenalServer";
      default:
        return "SomethingWentWrong";
    }
  }

  @override
  String toString() => message;
}
