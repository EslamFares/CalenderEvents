import 'failure.dart';
import 'handel_dio_exceptions.dart';
import 'package:dio/dio.dart';

class ServerFailure extends Failure {
  //implements Exception
  ServerFailure(super.message);
  factory ServerFailure.fromDioError(DioException e) {
    return handelDioExceptions(e);
  }
}

class ConnectionFailure extends Failure {
  final String? msg;
  ConnectionFailure({this.msg = kConnectionFailerMassage})
      : super(msg ?? kConnectionFailerMassage);
}

const String kConnectionFailerMassage = "No Internet Connection";
