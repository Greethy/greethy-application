import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? email;
  final String? password;
  final String? nickName;
  final String? avatar;
  final String? bannerImage;
  final String? bio;
  final PersonalInfo? personalInfo;
  final PremiumUser? premiumUser;
  final bool? isVerified;
  final String? financialManagementId;
  final String? nutritionalManagementId;
  final String? fitnessManagementId;
  final String? networkingId;
  final String? playsUserManagementId;
  final String? createdDate;

  User({
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

  User copyWith({
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
    return User(
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
}

class PersonalInfo extends Equatable {
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

  @override
  List<Object?> get props => [
        name,
        location,
        webSite,
        dob,
        gender,
      ];
}

class Dob extends Equatable {
  final String? date;
  final String? year;

  Dob({
    this.date,
    this.year,
  });

  @override
  List<Object?> get props => [
        date,
        year,
      ];
}

class PremiumUser extends Equatable {
  final bool? isPremium;
  final String? startTime;
  final String? endTime;

  PremiumUser({
    this.isPremium,
    this.startTime,
    this.endTime,
  });

  @override
  List<Object?> get props => [
        isPremium,
        startTime,
        endTime,
      ];
}
