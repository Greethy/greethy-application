import 'package:equatable/equatable.dart';

class NetworkingModel extends Equatable {
  final int id;
  final int userId;
  final List<int>? following;
  final List<int>? followers;
  final List<int>? resFollowing;
  final List<int>? resFollower;
  final Map<String, List<Relative>>? relatives;
  final ClubGroup? clubGroup;
  final ChallengesTrophy? challengesTrophy;

  NetworkingModel({
    required this.id,
    required this.userId,
    this.following,
    this.followers,
    this.resFollowing,
    this.resFollower,
    this.relatives,
    this.clubGroup,
    this.challengesTrophy,
  });

  factory NetworkingModel.fromJson(Map<String, dynamic> json) {
    return NetworkingModel(
      id: json['id'],
      userId: json['userId'],
      following: List<int>.from(json['following']),
      followers: List<int>.from(json['followers']),
      resFollowing: List<int>.from(json['resFollowing']),
      resFollower: List<int>.from(json['resFollower']),
      relatives: (json['relatives'] as Map<String, dynamic>).map<String, List<Relative>>(
        (key, value) => MapEntry<String, List<Relative>>(
          key,
          (value as List<dynamic>).map<Relative>((x) => Relative.fromJson(x as Map<String, dynamic>)).toList(),
        ),
      ),
      clubGroup: ClubGroup.fromJson(json['clubGroup']),
      challengesTrophy: ChallengesTrophy.fromJson(json['challengesTrophy']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'following': following,
      'followers': followers,
      'resFollowing': resFollowing,
      'resFollower': resFollower,
      'relatives': relatives?.map((key, value) => MapEntry(key, List<dynamic>.from(value.map((x) => x)))),
      'clubGroup': clubGroup?.toJson(),
      'challengesTrophy': challengesTrophy?.toJson(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        following,
        followers,
        resFollowing,
        resFollower,
        relatives,
        clubGroup,
        challengesTrophy,
      ];
}

class Relative extends Equatable {
  final String position;
  final int userId;

  Relative({
    required this.position,
    required this.userId,
  });

  factory Relative.fromJson(Map<String, dynamic> json) {
    return Relative(
      position: json['position'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'position': position,
      'userId': userId,
    };
  }

  @override
  List<Object> get props => [
        position,
        userId,
      ];
}

class ClubGroup extends Equatable {
  final List<TopClub> topClub;
  final List<Club> clubList;

  ClubGroup({
    required this.topClub,
    required this.clubList,
  });

  factory ClubGroup.fromJson(Map<String, dynamic> json) {
    return ClubGroup(
      topClub: List<TopClub>.from(json['topClub'].map((x) => TopClub.fromJson(x))),
      clubList: List<Club>.from(json['clubList'].map((x) => Club.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'topClub': List<dynamic>.from(topClub.map((x) => x.toJson())),
      'clubList': List<dynamic>.from(clubList.map((x) => x.toJson())),
    };
  }

  @override
  List<Object> get props => [
        topClub,
        clubList,
      ];
}

class TopClub extends Equatable {
  final String clubName;
  final String clubProfilePic;
  final int clubStar;
  final int clubPlaysPersonalId;
  final int clubId;

  TopClub({
    required this.clubName,
    required this.clubProfilePic,
    required this.clubStar,
    required this.clubPlaysPersonalId,
    required this.clubId,
  });

  factory TopClub.fromJson(Map<String, dynamic> json) {
    return TopClub(
      clubName: json['club_name'],
      clubProfilePic: json['club_profile_pic'],
      clubStar: json['club_star'],
      clubPlaysPersonalId: json['club_plays_personal_id'],
      clubId: json['club_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'club_name': clubName,
      'club_profile_pic': clubProfilePic,
      'club_star': clubStar,
      'club_plays_personal_id': clubPlaysPersonalId,
      'club_id': clubId,
    };
  }

  @override
  List<Object> get props => [
        clubName,
        clubProfilePic,
        clubStar,
        clubPlaysPersonalId,
        clubId,
      ];
}

class Club extends Equatable {
  final int clubId;
  final int clubPlaysPersonalId;

  Club({
    required this.clubId,
    required this.clubPlaysPersonalId,
  });

  factory Club.fromJson(Map<String, dynamic> json) {
    return Club(
      clubId: json['club_id'],
      clubPlaysPersonalId: json['club_plays_personal_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'club_Id': clubId,
      'club_plays_personal_id': clubPlaysPersonalId,
    };
  }

  @override
  List<Object> get props => [
    clubId,
    clubPlaysPersonalId,
  ];
}

class TrophyChallenge extends Equatable {
  final String challengeName;
  final String challengeImage;
  final String challengeTrophy;
  final int challengeId;

  TrophyChallenge({
    required this.challengeName,
    required this.challengeImage,
    required this.challengeTrophy,
    required this.challengeId,
  });

  factory TrophyChallenge.fromJson(Map<String, dynamic> json) {
    return TrophyChallenge(
      challengeName: json['challenges_name'],
      challengeImage: json['challenges_image'],
      challengeTrophy: json['challenge_trophy'],
      challengeId: json['challenge_id'],
    );
  }

  static List<TrophyChallenge> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => TrophyChallenge.fromJson(json))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'challenges_name': challengeName,
      'challenges_image': challengeImage,
      'challenge_trophy': challengeTrophy,
      'challenge_id': challengeId,
    };
  }

  @override
  List<Object?> get props => [
    challengeName,
    challengeImage,
    challengeTrophy,
    challengeId,
  ];
}

class PresentChallenge extends Equatable {
  final String challengeName;
  final String challengeImage;
  final String challengeTimeStart;
  final String challengeTimeClose;
  final int challengeId;

  PresentChallenge({
    required this.challengeName,
    required this.challengeImage,
    required this.challengeTimeStart,
    required this.challengeTimeClose,
    required this.challengeId,
  });

  factory PresentChallenge.fromJson(Map<String, dynamic> json) {
    return PresentChallenge(
      challengeName: json['challenges_name'],
      challengeImage: json['challenges_image'],
      challengeTimeStart: json['challenges_time_start'],
      challengeTimeClose: json['challenges_time_close'],
      challengeId: json['challenge_id'],
    );
  }

  static List<PresentChallenge> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => PresentChallenge.fromJson(json))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'challenges_name': challengeName,
      'challenges_image': challengeImage,
      'challenges_time_start': challengeTimeStart,
      'challenges_time_close': challengeTimeClose,
      'challenge_id': challengeId,
    };
  }

  @override
  List<Object?> get props => [
    challengeName,
    challengeImage,
    challengeTimeStart,
    challengeTimeClose,
    challengeId,
  ];
}

class ChallengesTrophy extends Equatable {
  final List<PresentChallenge> presentChallenge;
  final List<TrophyChallenge> trophyChallenge;
  final List<int> challengesJoinList;

  ChallengesTrophy({
    required this.presentChallenge,
    required this.trophyChallenge,
    required this.challengesJoinList,
  });

  factory ChallengesTrophy.fromJson(Map<String, dynamic> json) {
    return ChallengesTrophy(
      presentChallenge: PresentChallenge.fromJsonList(json['presentChallenge']),
      trophyChallenge: TrophyChallenge.fromJsonList(json['trophyChallenge']),
      challengesJoinList: List<int>.from(json['challengesJoinList']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'presentChallenge': presentChallenge.map((challenge) => challenge.toJson()).toList(),
      'trophyChallenge': trophyChallenge.map((challenge) => challenge.toJson()).toList(),
      'challengesJoinList': challengesJoinList,
    };
  }

  @override
  List<Object?> get props => [
    presentChallenge,
    trophyChallenge,
    challengesJoinList,
  ];
}


