// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserToken {
  String? token;
  String? gwsToken;

  UserToken({
    this.token,
    this.gwsToken,
  });

  UserToken copyWith({
    String? token,
    String? gwsToken,
  }) =>
      UserToken(
        token: token ?? this.token,
        gwsToken: gwsToken ?? this.gwsToken,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'gwsToken': gwsToken,
    };
  }

  factory UserToken.fromMap(Map<String, dynamic> map) {
    return UserToken(
      token: map['token'] != null ? map['token'] as String : null,
      gwsToken: map['gwsToken'] != null ? map['gwsToken'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserToken.fromJson(String source) =>
      UserToken.fromMap(json.decode(source) as Map<String, dynamic>);
}
