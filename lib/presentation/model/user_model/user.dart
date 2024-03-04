import 'dart:convert';

import 'package:equatable/equatable.dart';

List<UserModel> listUserModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel extends Equatable {
  final String? id;
  final String? email;
  final String? password;
  late final String? nickName;
  final String? avatar;
  final String? bannerImage;
  late final String? bio;
  final PersonalInfo? personalInfo;
  final PremiumUser? premiumUser;
  final bool? isVerified;
  final String? financialManagementId;
  final String? nutritionalManagementId;
  final String? fitnessManagementId;
  final String? networkingId;
  final String? playsUserManagementId;
  final String? createdDate;

  UserModel({
    this.id,
    this.email,
    this.password,
    this.nickName,
    this.avatar,
    this.bannerImage,
    this.bio,
    this.personalInfo,
    this.premiumUser,
    this.isVerified,
    this.financialManagementId,
    this.nutritionalManagementId,
    this.fitnessManagementId,
    this.networkingId,
    this.playsUserManagementId,
    this.createdDate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      nickName: json['nickName'],
      avatar: json['avatar'],
      bannerImage: json['bannerImage'],
      bio: json['bio'],
      personalInfo: PersonalInfo.fromJson(json['personal_info']),
      premiumUser: PremiumUser.fromJson(json['premiumUser']),
      isVerified: json['isVerified'],
      financialManagementId: json['financial_management_id'],
      nutritionalManagementId: json['nutritional_management_id'],
      fitnessManagementId: json['fitness_management_id'],
      networkingId: json['networking_id'],
      playsUserManagementId: json['plays_user_management_id'],
      createdDate: json['created_date'],
    );
  }

  toJson() {
    return {
      'id': id,
      "email": email,
      'password': password,
      'nickName': nickName,
      'avatar': avatar,
      'bannerImage': bannerImage,
      'bio': bio,
      'personalInfo': personalInfo != null ? personalInfo?.toJson() : null,
      'premiumUser': premiumUser != null ? premiumUser?.toJson() : null,
      'isVerified': isVerified,
      'financialManagementId': financialManagementId,
      'nutritionalManagementId': nutritionalManagementId,
      'fitnessManagementId': fitnessManagementId,
      'networkingId': networkingId,
      'playsUserManagementId': playsUserManagementId,
      'createdDate': createdDate
    };
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? password,
    String? nickName,
    String? avatar,
    String? bannerImage,
    String? bio,
    PersonalInfo? personalInfo,
    PremiumUser? premiumUser,
    bool? isVerified,
    String? financialManagementId,
    String? nutritionalManagementId,
    String? fitnessManagementId,
    String? networkingId,
    String? playsUserManagementId,
    String? createdDate,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      nickName: nickName ?? this.nickName,
      avatar: avatar ?? this.avatar,
      bannerImage: bannerImage ?? this.bannerImage,
      bio: bio ?? this.bio,
      personalInfo: personalInfo ?? this.personalInfo,
      premiumUser: premiumUser ?? this.premiumUser,
      isVerified: isVerified ?? this.isVerified,
      financialManagementId: financialManagementId ?? this.financialManagementId,
      nutritionalManagementId: nutritionalManagementId ?? this.nutritionalManagementId,
      fitnessManagementId: fitnessManagementId ?? this.fitnessManagementId,
      networkingId: networkingId ?? this.networkingId,
      playsUserManagementId: playsUserManagementId ?? this.playsUserManagementId,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        nickName,
        avatar,
        bannerImage,
        bio,
        personalInfo,
        premiumUser,
        isVerified,
        financialManagementId,
        nutritionalManagementId,
        fitnessManagementId,
        networkingId,
        playsUserManagementId,
        createdDate,
      ];
}

class PersonalInfo {
  final String? name;
  final String? location;
  final String? webSite;
  final Dob? dob;
  final int? gender;

  PersonalInfo({
    this.name,
    this.location,
    this.webSite,
    this.dob,
    this.gender,
  });

  toJson() {
    return {
      'name': name,
      'location': location,
      'webSite': webSite,
      'dob': dob != null ? dob?.toJson() : null,
      'gender': gender,
    };
  }

  factory PersonalInfo.fromJson(Map<String, dynamic> json) {
    return PersonalInfo(
      name: json['name'],
      location: json['location'],
      webSite: json['webSite'],
      dob: Dob.fromJson(json['dob']),
      gender: json['gender'],
    );
  }

  @override
  String toString() {
    return 'PersonalInfo{name: $name, location: $location, webSite: $webSite, dob: $dob, gender: $gender}';
  }
}

class Dob {
  final String? date;
  final String? year;

  Dob({
    this.date,
    this.year,
  });

  toJson() {
    return {'date': date, 'year': year};
  }

  factory Dob.fromJson(Map<String, dynamic> json) {
    return Dob(
      date: json['date'],
      year: json['year'],
    );
  }
}

class PremiumUser {
  final bool? isPremium;
  final String? startTime;
  final String? endTime;

  PremiumUser({
    this.isPremium,
    this.startTime,
    this.endTime,
  });

  toJson() {
    return {
      'isPremium': isPremium,
      'startTime': startTime,
      'endTime': endTime,
    };
  }

  factory PremiumUser.fromJson(Map<String, dynamic> json) {
    return PremiumUser(
      isPremium: json['isPremium'],
      startTime: json['startTime'],
      endTime: json['endTime'],
    );
  }
}
