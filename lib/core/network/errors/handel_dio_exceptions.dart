import 'server_failure.dart';
import 'package:dio/dio.dart';

ServerFailure handelDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return ServerFailure('timeout: $e');
    case DioExceptionType.sendTimeout:
      return ServerFailure('sendTimeout: $e');
    case DioExceptionType.receiveTimeout:
      return ServerFailure('receiveTimeout: $e');
    case DioExceptionType.badCertificate:
      return ServerFailure('bad Certificate: $e');
    case DioExceptionType.cancel:
      return ServerFailure('canceled: $e');
    case DioExceptionType.connectionError:
      return ServerFailure('connection Error: $e');

    case DioExceptionType.unknown:
      return ServerFailure('Error Type unknown: $e');

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: //Bad request
          return ServerFailure('Error 400 Bad request: ${e.response?.data}');
        case 401: //unauthorized
          return ServerFailure('Error 401 Unauthorized: ${e.response?.data}');
        case 403: //forbidden
          return ServerFailure('Error 403 Forbidden: ${e.response?.data}');
        case 404: //notfound //# can handel her ${e.response?.data['error']['message']}
          return ServerFailure(
              'Error 404 Not found , Your request is not found, please try again:');
        case 409: //cpfficient
          return ServerFailure('Error 409 Conflict: ${e.response?.data}');
        case 422: //unprocessable Entity
          return ServerFailure(
              // 'Error 422 Unprocessable Entity: ${e.response?.data}');
              'Error 422 Unprocessable Entity: ${e.response}');
        case 504: //Bad request
          return ServerFailure(
              'Error 504 Gateway Timeout: ${e.response?.data}');

        default:
          return ServerFailure('bad Response Unknown: ${e.response?.data}');
      }

    default:
      return ServerFailure('Error default Unknown: $e');
  }
}
