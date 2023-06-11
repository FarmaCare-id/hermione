import 'dart:io';

import 'package:dio/dio.dart';

class DioErrorUtil {
  // general methods:------------------------------------------------------------
  static String handleError(DioException error) {
    String errorDescription = "";
    if (error.error is SocketException) {
      errorDescription = "Connection failed due to internet connection";
    } else if (error.response != null) {
        switch (error.response!.statusCode) {
          case 400:
            errorDescription = "Bad request";
            break;
          case 401:
            errorDescription = "Unauthorized";
            break;
          case 403:
            errorDescription = "Forbidden";
            break;
          case 404:
            errorDescription = "Not found";
            break;
          case 500:
            errorDescription = "Internal server error";
            break;
          default:
            errorDescription = "Received invalid status code: ${error.response!.statusCode}";
            break;
        }
      } else {
        errorDescription = "Unexpected error occurred";
      }
    return errorDescription;
  }
}