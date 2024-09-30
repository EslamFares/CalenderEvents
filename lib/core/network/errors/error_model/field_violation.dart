class FieldViolation {
  String? field;
  String? description;

  FieldViolation({this.field, this.description});

  factory FieldViolation.fromJson(Map<String, dynamic> json) {
    return FieldViolation(
      field: json['field'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'field': field,
        'description': description,
      };
}
