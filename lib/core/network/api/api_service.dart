import 'package:flutter_application_1/core/get_it.dart';
import '../errors/server_failure.dart';
import 'api_consumer.dart';
import 'api_interceptor.dart';
import 'api_consts.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

//ToDo: in main UserCubit(ApiService(dio: Dio())),
class ApiService extends ApiConsumer {
  final Dio dio;
  static final instance = getIt<ApiService>();
  static final instanceGlobal = ApiService(dio: Dio());
  ApiService({required this.dio}) {
    dio.options = BaseOptions(
      //TODo: add base url
      baseUrl: ApiConsts.baseUrl,
      headers: {
        // "Authorization":
        //     "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3NhbGVzY28ubWUvYXBpL20vbG9naW4iLCJpYXQiOjE3MTkyMzI2MTcsIm5iZiI6MTcxOTIzMjYxNywianRpIjoiM01PWkx1MDUzSVhncUpxdyIsInN1YiI6IjEiLCJwcnYiOiJlNTM1NGNiNWJkN2NhN2Y0MDM2ODMzYTA5NWY0MDkyODgyZDk3MzYwIn0.8km1TP5TTYmDmr6fzdQ3psMQIWCE-79ZItiIP5abaNM",
      },
      receiveDataWhenStatusError: true,
    );
    // Simply add PrettyDioLogger to your dio interceptors.
    //TODO: cooment After Testing it
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));

    // to add option in (request ex=>headers) & error & respons but i add for every method a lone
    dio.interceptors.add(ApiInterceptor());
  }
  @override
  Future get(
      {required String path,
      Map<String, dynamic>? query,
      ResponseType? responseType,
      Object? data,
      Map<String, String>? headers,
      String? contentType}) async {
    try {
      final response = await dio.get(path,
          queryParameters: query,
          data: data,
          options: Options(
            responseType: responseType,
            //ex=>  contentType: Headers.formUrlEncodedContentType,
            contentType: contentType ?? 'application/json',
            headers: headers, //{'Authorization': 'Bearer $token'}
          ));
      return response.data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  @override
  Future delete(
      {required String path,
      Map<String, dynamic>? query,
      dynamic data,
      bool isFormData = false,
      Map<String, String>? headers,
      String? contentType,
      ResponseType? responseType}) async {
    try {
      final response = await dio.delete(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: query,
          options: Options(
              responseType: responseType,
              //ex=>  contentType: Headers.formUrlEncodedContentType,
              contentType: contentType ?? 'application/json',
              headers: headers //{'Authorization': 'Bearer $token'}
              ));
      return response.data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  @override
  Future patch(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, String>? headers,
      ResponseType? responseType,
      dynamic data,
      bool isFormData = false,
      String? contentType}) async {
    try {
      final response = await dio.patch(path,
          queryParameters: query,
          data: isFormData ? FormData.fromMap(data) : data,
          options: Options(
            responseType: responseType,
            //ex=>  contentType: Headers.formUrlEncodedContentType,
            contentType: contentType ?? 'application/json',
            headers: headers, //{'Authorization': 'Bearer $token'}
          ));
      return response.data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  @override
  Future post(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, String>? headers,
      dynamic data,
      bool isFormData = false,
      String? contentType,
      ResponseType? responseType}) async {
    try {
      final response = await dio.post(path,
          queryParameters: query,
          data: isFormData ? FormData.fromMap(data) : data,
          options: Options(
            //ex=>  contentType: Headers.formUrlEncodedContentType,
            contentType: contentType ?? 'application/json',
            responseType: responseType,
            headers: headers, //{'Authorization': 'Bearer $token'}
          ));
      return response.data;
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }
}
