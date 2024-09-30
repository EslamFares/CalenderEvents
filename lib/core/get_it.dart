import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/network/api/api_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> getitSetup() async {
  //============
  //!use getIt<ApiService>()
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
}
