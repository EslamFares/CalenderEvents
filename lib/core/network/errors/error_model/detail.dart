import 'field_violation.dart';

class Detail {
  String? type;
  List<FieldViolation>? fieldViolations;

  Detail({this.type, this.fieldViolations});

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        type: json['@type'] as String?,
        fieldViolations: (json['fieldViolations'] as List<dynamic>?)
            ?.map((e) => FieldViolation.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        '@type': type,
        'fieldViolations': fieldViolations?.map((e) => e.toJson()).toList(),
      };
}
