import 'error.dart';

class ErrorModel {
  Error? error;

  ErrorModel({this.error});

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        error: json['error'] == null
            ? null
            : Error.fromJson(json['error'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'error': error?.toJson(),
      };
}
