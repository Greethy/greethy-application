import 'dart:convert';

import 'package:greethy_application/domain/entities/user_entities/user.dart';

class UserDto extends User {
  UserDto({
    super.id,
    super.bodySpecsManagementId,
    super.financialManagementId,
    super.nutritionalManagementId,
    super.fitnessManagementId,
    super.networkingId,
    super.playsUserManagementId,
    super.email,
    super.password,
    super.nickName,
    super.avatar,
    super.bannerImage,
    super.bio,
    super.personalInfo,
    super.premiumUser,
    super.isVerified,
    super.createdDate,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory UserDto.fromRawJson(String str) => UserDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------

  factory UserDto.fromMap(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      nickName: json['nickName'],
      avatar: json['avatar'],
      bannerImage: json['bannerImage'],
      bio: json['bio'],
      personalInfo: json['personal_info'] == null ? null : PersonalInfoDto.fromMap(json['personal_info']),
      premiumUser: json['premiumUser'] == null ? null : PremiumUserDto.fromMap(json['premiumUser']),
      isVerified: json['isVerified'],
      bodySpecsManagementId: json['body_specs_management_id'],
      financialManagementId: json['financial_management_id'],
      nutritionalManagementId: json['nutritional_management_id'],
      fitnessManagementId: json['fitness_management_id'],
      networkingId: json['networking_id'],
      playsUserManagementId: json['plays_user_management_id'],
      createdDate: json['created_date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'nickName': nickName,
      'avatar': avatar,
      'bannerImage': bannerImage,
      'bio': bio,
      'personal_info': personalInfo != null ? PersonalInfoDto.fromPersonalInfo(personalInfo!).toMap() : null,
      'premiumUser': premiumUser != null ? PremiumUserDto.fromPremiumUser(premiumUser!).toMap() : null,
      'isVerified': isVerified,
      'body_specs_management_id': bodySpecsManagementId,
      'financial_management_id': financialManagementId,
      'nutritional_management_id': nutritionalManagementId,
      'fitness_management_id': fitnessManagementId,
      'networking_id': networkingId,
      'plays_user_management_id': playsUserManagementId,
      'created_date': createdDate,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static UserDto fromUser(User user) {
    return UserDto(
      id: user.id,
      email: user.email,
      password: user.password,
      nickName: user.nickName,
      avatar: user.avatar,
      bannerImage: user.bannerImage,
      bio: user.bio,
      personalInfo: user.personalInfo == null ? null : PersonalInfoDto.fromPersonalInfo(user.personalInfo!),
      premiumUser: user.premiumUser == null ? null : PremiumUserDto.fromPremiumUser(user.premiumUser!),
      isVerified: user.isVerified,
      bodySpecsManagementId: user.bodySpecsManagementId,
      financialManagementId: user.financialManagementId,
      nutritionalManagementId: user.nutritionalManagementId,
      fitnessManagementId: user.fitnessManagementId,
      networkingId: user.fitnessManagementId,
      playsUserManagementId: user.fitnessManagementId,
      createdDate: user.createdDate,
    );
  }

  User toUser() {
    return User(
      id: id,
      email: email,
      password: password,
      nickName: nickName,
      avatar: avatar,
      bannerImage: bannerImage,
      bio: bio,
      personalInfo: personalInfo,
      premiumUser: premiumUser,
      isVerified: isVerified,
      bodySpecsManagementId: bodySpecsManagementId,
      financialManagementId: financialManagementId,
      nutritionalManagementId: nutritionalManagementId,
      fitnessManagementId: fitnessManagementId,
      networkingId: fitnessManagementId,
      playsUserManagementId: fitnessManagementId,
      createdDate: createdDate,
    );
  }
}

class PersonalInfoDto extends PersonalInfo {
  PersonalInfoDto({
    super.name,
    super.location,
    super.webSite,
    super.dob,
    super.gender,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory PersonalInfoDto.fromRawJson(String str) => PersonalInfoDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory PersonalInfoDto.fromMap(Map<String, dynamic> json) => PersonalInfoDto(
        name: json['name'],
        location: json['location'],
        webSite: json['webSite'],
        dob: json['dob'] == null ? null : DobDto.fromMap(json['dob']),
        gender: json['gender'],
      );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'webSite': webSite,
      'dob': dob == null ? null : DobDto.fromDob(dob!).toMap(),
      'gender': gender,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static PersonalInfoDto fromPersonalInfo(PersonalInfo personalInfo) {
    return PersonalInfoDto(
      name: personalInfo.name,
      location: personalInfo.location,
      webSite: personalInfo.webSite,
      dob: personalInfo.dob,
      gender: personalInfo.gender,
    );
  }

  PersonalInfo toPersonalInfo() {
    return PersonalInfo(
      name: name,
      location: location,
      webSite: webSite,
      dob: dob,
      gender: gender,
    );
  }
}

class DobDto extends Dob {
  DobDto({
    super.date,
    super.year,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory DobDto.fromRawJson(String str) => DobDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory DobDto.fromMap(Map<String, dynamic> json) => DobDto(
        date: json['date'],
        year: json['year'],
      );

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'year': year,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static DobDto fromDob(Dob dob) {
    return DobDto(
      date: dob.date,
      year: dob.year,
    );
  }

  Dob toDob() {
    return Dob(
      date: date,
      year: year,
    );
  }
}

class PremiumUserDto extends PremiumUser {
  PremiumUserDto({
    super.isPremium,
    super.startTime,
    super.endTime,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory PremiumUserDto.fromRawJson(String str) => PremiumUserDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory PremiumUserDto.fromMap(Map<String, dynamic> json) => PremiumUserDto(
        isPremium: json['isPremium'],
        startTime: json['startTime'],
        endTime: json['endTime'],
      );

  Map<String, dynamic> toMap() {
    return {
      'isPremium': isPremium,
      'startTime': startTime,
      'endTime': endTime,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static PremiumUserDto fromPremiumUser(PremiumUser premiumUser) {
    return PremiumUserDto(
      isPremium: premiumUser.isPremium,
      startTime: premiumUser.startTime,
      endTime: premiumUser.endTime,
    );
  }

  PremiumUser toPremiumUser() {
    return PremiumUser(
      isPremium: isPremium,
      startTime: startTime,
      endTime: endTime,
    );
  }
}
