import 'detail.dart';

class Error {
  int? code;
  String? message;
  List<Error>? errors;
  String? status;
  List<Detail>? details;

  Error({this.code, this.message, this.errors, this.status, this.details});

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json['code'] as int?,
        message: json['message'] as String?,
        errors: (json['errors'] as List<dynamic>?)
            ?.map((e) => Error.fromJson(e as Map<String, dynamic>))
            .toList(),
        status: json['status'] as String?,
        details: (json['details'] as List<dynamic>?)
            ?.map((e) => Detail.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'errors': errors?.map((e) => e.toJson()).toList(),
        'status': status,
        'details': details?.map((e) => e.toJson()).toList(),
      };
}
