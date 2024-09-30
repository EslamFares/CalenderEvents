// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class User {
  int? userId;
  int? tenantId;
  int? stateId;
  String? stateName;
  int? buildingId;
  int? authenticationType;
  String? displayName;
  String? firstName;
  String? lastName;
  String? email;
  String? loginId;
  String? imagePath;
  int? languageId;
  String? language;
  int? defaultTimeFormat;
  String? profile;
  int? profileId;
  String? tenant;
  String? building;
  String? role;
  int? roleLevel;
  String? lastAccessTime;
  List<String>? orgId;
  String? sourcedId;
  User({
    this.userId,
    this.tenantId,
    this.stateId,
    this.stateName,
    this.buildingId,
    this.authenticationType,
    this.displayName,
    this.firstName,
    this.lastName,
    this.email,
    this.loginId,
    this.imagePath,
    this.languageId,
    this.language,
    this.defaultTimeFormat,
    this.profile,
    this.profileId,
    this.tenant,
    this.building,
    this.role,
    this.roleLevel,
    this.lastAccessTime,
    this.orgId,
    this.sourcedId,
  });

  User copyWith({
    int? userId,
    int? tenantId,
    int? stateId,
    String? stateName,
    int? buildingId,
    int? authenticationType,
    String? displayName,
    String? firstName,
    String? lastName,
    String? email,
    String? loginId,
    String? imagePath,
    int? languageId,
    String? language,
    int? defaultTimeFormat,
    String? profile,
    int? profileId,
    String? tenant,
    String? building,
    String? role,
    int? roleLevel,
    String? lastAccessTime,
    List<String>? orgId,
    String? sourcedId,
  }) {
    return User(
      userId: userId ?? this.userId,
      tenantId: tenantId ?? this.tenantId,
      stateId: stateId ?? this.stateId,
      stateName: stateName ?? this.stateName,
      buildingId: buildingId ?? this.buildingId,
      authenticationType: authenticationType ?? this.authenticationType,
      displayName: displayName ?? this.displayName,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      loginId: loginId ?? this.loginId,
      imagePath: imagePath ?? this.imagePath,
      languageId: languageId ?? this.languageId,
      language: language ?? this.language,
      defaultTimeFormat: defaultTimeFormat ?? this.defaultTimeFormat,
      profile: profile ?? this.profile,
      profileId: profileId ?? this.profileId,
      tenant: tenant ?? this.tenant,
      building: building ?? this.building,
      role: role ?? this.role,
      roleLevel: roleLevel ?? this.roleLevel,
      lastAccessTime: lastAccessTime ?? this.lastAccessTime,
      orgId: orgId ?? this.orgId,
      sourcedId: sourcedId ?? this.sourcedId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'tenantId': tenantId,
      'stateId': stateId,
      'stateName': stateName,
      'buildingId': buildingId,
      'authenticationType': authenticationType,
      'displayName': displayName,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'loginId': loginId,
      'imagePath': imagePath,
      'languageId': languageId,
      'language': language,
      'defaultTimeFormat': defaultTimeFormat,
      'profile': profile,
      'profileId': profileId,
      'tenant': tenant,
      'building': building,
      'role': role,
      'roleLevel': roleLevel,
      'lastAccessTime': lastAccessTime,
      'orgId': orgId,
      'sourcedId': sourcedId,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId'] != null ? map['userId'] as int : null,
      tenantId: map['tenantId'] != null ? map['tenantId'] as int : null,
      stateId: map['stateId'] != null ? map['stateId'] as int : null,
      stateName: map['stateName'] != null ? map['stateName'] as String : null,
      buildingId: map['buildingId'] != null ? map['buildingId'] as int : null,
      authenticationType: map['authenticationType'] != null
          ? map['authenticationType'] as int
          : null,
      displayName:
          map['displayName'] != null ? map['displayName'] as String : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      loginId: map['loginId'] != null ? map['loginId'] as String : null,
      imagePath: map['imagePath'] != null ? map['imagePath'] as String : null,
      languageId: map['languageId'] != null ? map['languageId'] as int : null,
      language: map['language'] != null ? map['language'] as String : null,
      defaultTimeFormat: map['defaultTimeFormat'] != null
          ? map['defaultTimeFormat'] as int
          : null,
      profile: map['profile'] != null ? map['profile'] as String : null,
      profileId: map['profileId'] != null ? map['profileId'] as int : null,
      tenant: map['tenant'] != null ? map['tenant'] as String : null,
      building: map['building'] != null ? map['building'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
      roleLevel: map['roleLevel'] != null ? map['roleLevel'] as int : null,
      lastAccessTime: map['lastAccessTime'] != null
          ? map['lastAccessTime'] as String
          : null,
      orgId: map['orgId'] != null
          ? List<String>.from((map['orgId'] as List<String>))
          : null,
      sourcedId: map['sourcedId'] != null ? map['sourcedId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(userId: $userId, tenantId: $tenantId, stateId: $stateId, stateName: $stateName, buildingId: $buildingId, authenticationType: $authenticationType, displayName: $displayName, firstName: $firstName, lastName: $lastName, email: $email, loginId: $loginId, imagePath: $imagePath, languageId: $languageId, language: $language, defaultTimeFormat: $defaultTimeFormat, profile: $profile, profileId: $profileId, tenant: $tenant, building: $building, role: $role, roleLevel: $roleLevel, lastAccessTime: $lastAccessTime, orgId: $orgId, sourcedId: $sourcedId)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.tenantId == tenantId &&
        other.stateId == stateId &&
        other.stateName == stateName &&
        other.buildingId == buildingId &&
        other.authenticationType == authenticationType &&
        other.displayName == displayName &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.loginId == loginId &&
        other.imagePath == imagePath &&
        other.languageId == languageId &&
        other.language == language &&
        other.defaultTimeFormat == defaultTimeFormat &&
        other.profile == profile &&
        other.profileId == profileId &&
        other.tenant == tenant &&
        other.building == building &&
        other.role == role &&
        other.roleLevel == roleLevel &&
        other.lastAccessTime == lastAccessTime &&
        listEquals(other.orgId, orgId) &&
        other.sourcedId == sourcedId;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        tenantId.hashCode ^
        stateId.hashCode ^
        stateName.hashCode ^
        buildingId.hashCode ^
        authenticationType.hashCode ^
        displayName.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        loginId.hashCode ^
        imagePath.hashCode ^
        languageId.hashCode ^
        language.hashCode ^
        defaultTimeFormat.hashCode ^
        profile.hashCode ^
        profileId.hashCode ^
        tenant.hashCode ^
        building.hashCode ^
        role.hashCode ^
        roleLevel.hashCode ^
        lastAccessTime.hashCode ^
        orgId.hashCode ^
        sourcedId.hashCode;
  }
}
