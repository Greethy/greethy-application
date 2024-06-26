import 'dart:convert';

import 'package:greethy_application/domain/entities/user_entities/networking.dart';

class NetworkingDto extends Networking {
  NetworkingDto({
    super.id,
    super.userId,
    super.following,
    super.followers,
    super.resFollowing,
    super.resFollower,
    super.relatives,
    super.clubGroup,
    super.challengesTrophy,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory NetworkingDto.fromRawJson(String str) => NetworkingDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory NetworkingDto.fromMap(Map<String, dynamic> json) => NetworkingDto(
        id: json['id'],
        userId: json['userId'],
        following: json['following'] == null ? [] : List<String>.from(json['following']),
        followers: json['followers'] == null ? [] : List<String>.from(json['followers']),
        resFollowing: json['resFollowing'] == null ? [] : List<String>.from(json['resFollowing']),
        resFollower: json['resFollower'] == null ? [] : List<String>.from(json['resFollower']),
        relatives: json['relatives'] == null ? null : RelativeDto.fromMap(json['relatives']),
        clubGroup: json['clubGroup'] == null ? null : ClubGroupDto.fromMap(json['clubGroup']),
        challengesTrophy: json['challengesTrophy'] == null ? null : ChallengesTrophyDto.fromMap(json['challengesTrophy']),
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'following': following == null ? [] : following,
      'followers': followers == null ? [] : followers,
      'resFollowing': resFollowing == null ? [] : resFollowing,
      'resFollower': resFollower == null ? [] : resFollower,
      'relatives': relatives != null ? RelativeDto.fromRelative(relatives!).toMap() : null,
      'clubGroup': clubGroup != null ? ClubGroupDto.fromClubGroup(clubGroup!).toMap() : null,
      'challengesTrophy': challengesTrophy != null ? ChallengesTrophyDto.fromChallengesTrophy(challengesTrophy!).toMap() : null,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static NetworkingDto fromNetworking(Networking networking) {
    return NetworkingDto(
      id: networking.id,
      userId: networking.userId,
      following: networking.following,
      followers: networking.followers,
      resFollowing: networking.resFollowing,
      resFollower: networking.resFollower,
      relatives: networking.relatives,
      clubGroup: networking.clubGroup,
      challengesTrophy: networking.challengesTrophy,
    );
  }

  Networking toNetworking() {
    return Networking(
      id: id,
      userId: userId,
      following: following,
      followers: followers,
      resFollowing: resFollowing,
      resFollower: resFollower,
      relatives: relatives,
      clubGroup: clubGroup,
      challengesTrophy: challengesTrophy,
    );
  }
}

class RelativeDto extends Relative {
  RelativeDto({
    super.resHomieSend,
    super.resHomieGet,
    super.homieList,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory RelativeDto.fromRawJson(String str) => RelativeDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory RelativeDto.fromMap(Map<String, dynamic> json) => RelativeDto(
        resHomieSend: json['resHomieSend'] == null ? null : List<Homie>.from(json['resHomieSend'].map((x) => HomieDto.fromMap(x))),
        resHomieGet: json['resHomieGet'] == null ? null : List<Homie>.from(json['resHomieGet'].map((x) => HomieDto.fromMap(x))),
        homieList: json['homieList'] == null ? null : List<Homie>.from(json['homieList'].map((x) => HomieDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() {
    return {
      'resHomieSend': resHomieSend == null ? null : HomieDto.fromHomieList(resHomieSend!).map((x) => x.toMap()).toList(),
      'resHomieGet': resHomieGet == null ? null : HomieDto.fromHomieList(resHomieGet!).map((x) => x.toMap()).toList(),
      'homieList': homieList == null ? null : HomieDto.fromHomieList(homieList!).map((x) => x.toMap()).toList(),
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static RelativeDto fromRelative(Relative relative) {
    return RelativeDto(
      resHomieSend: relative.resHomieSend,
      resHomieGet: relative.resHomieGet,
      homieList: relative.homieList,
    );
  }

  Relative toRelative() {
    return Relative(
      resHomieSend: resHomieSend,
      resHomieGet: resHomieGet,
      homieList: homieList,
    );
  }
}

class HomieDto extends Homie {
  HomieDto({
    super.position,
    super.userId,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory HomieDto.fromRawJson(String str) => HomieDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory HomieDto.fromMap(Map<String, dynamic> json) => HomieDto(
        position: json['position'],
        userId: json['userId'],
      );

  Map<String, dynamic> toMap() {
    return {
      'position': position,
      'userId': userId,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static HomieDto fromHomie(Homie homie) {
    return HomieDto(
      position: homie.position,
      userId: homie.userId,
    );
  }

  Homie toHomie() {
    return Homie(
      position: position,
      userId: userId,
    );
  }

  static List<HomieDto> fromHomieList(List<Homie> homieList) {
    return homieList
        .map(
          (entity) => HomieDto(
            position: entity.position,
            userId: entity.userId,
          ),
        )
        .toList();
  }
}

class ClubGroupDto extends ClubGroup {
  ClubGroupDto({
    super.topClub,
    super.clubList,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory ClubGroupDto.fromRawJson(String str) => ClubGroupDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory ClubGroupDto.fromMap(Map<String, dynamic> json) => ClubGroupDto(
        topClub: json['topClub'] == null ? null : List<TopClub>.from(json['topClub'].map((x) => TopClubDto.fromMap(x))),
        clubList: json['clubList'] == null ? null : List<Club>.from(json['clubList'].map((x) => ClubDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() {
    return {
      'topClub': topClub == null ? null : TopClubDto.fromTopClubList(topClub!).map((x) => x.toMap()).toList(),
      'clubList': clubList == null ? null : ClubDto.fromClubList(clubList!).map((x) => x.toMap()).toList(),
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static ClubGroupDto fromClubGroup(ClubGroup clubGroup) {
    return ClubGroupDto(
      topClub: clubGroup.topClub,
      clubList: clubGroup.clubList,
    );
  }

  ClubGroup toClubGroup() {
    return ClubGroup(
      topClub: topClub,
      clubList: clubList,
    );
  }
}

class TopClubDto extends TopClub {
  TopClubDto({
    super.clubName,
    super.clubProfilePic,
    super.clubStar,
    super.clubPlaysPersonalId,
    required super.clubId,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory TopClubDto.fromRawJson(String str) => TopClubDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory TopClubDto.fromMap(Map<String, dynamic> json) => TopClubDto(
        clubName: json['club_name'],
        clubProfilePic: json['club_profile_pic'],
        clubStar: json['club_star'],
        clubPlaysPersonalId: json['club_plays_personal_id'],
        clubId: json['club_id'],
      );

  Map<String, dynamic> toMap() {
    return {
      'club_name': clubName,
      'club_profile_pic': clubProfilePic,
      'club_star': clubStar,
      'club_plays_personal_id': clubPlaysPersonalId,
      'club_id': clubId,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static TopClubDto fromTopClub(TopClub topClub) {
    return TopClubDto(
      clubName: topClub.clubName,
      clubProfilePic: topClub.clubProfilePic,
      clubStar: topClub.clubStar,
      clubPlaysPersonalId: topClub.clubPlaysPersonalId,
      clubId: topClub.clubId,
    );
  }

  TopClub toTopClub() {
    return TopClub(
      clubName: clubName,
      clubProfilePic: clubProfilePic,
      clubStar: clubStar,
      clubPlaysPersonalId: clubPlaysPersonalId,
      clubId: clubId,
    );
  }

  static List<TopClubDto> fromTopClubList(List<TopClub> topClubList) {
    return topClubList
        .map(
          (entity) => TopClubDto(
            clubName: entity.clubName,
            clubProfilePic: entity.clubProfilePic,
            clubStar: entity.clubStar,
            clubPlaysPersonalId: entity.clubPlaysPersonalId,
            clubId: entity.clubId,
          ),
        )
        .toList();
  }
}

class ClubDto extends Club {
  ClubDto({
    super.clubId,
    super.clubPlaysPersonalId,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory ClubDto.fromRawJson(String str) => ClubDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory ClubDto.fromMap(Map<String, dynamic> json) => ClubDto(
        clubId: json['club_id'],
        clubPlaysPersonalId: json['club_plays_personal_id'],
      );

  Map<String, dynamic> toMap() {
    return {
      'club_Id': clubId,
      'club_plays_personal_id': clubPlaysPersonalId,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static ClubDto fromClub(Club club) {
    return ClubDto(
      clubId: club.clubId,
      clubPlaysPersonalId: club.clubPlaysPersonalId,
    );
  }

  Club toClub() {
    return Club(
      clubId: clubId,
      clubPlaysPersonalId: clubPlaysPersonalId,
    );
  }

  static List<ClubDto> fromClubList(List<Club> clubList) {
    return clubList
        .map(
          (entity) => ClubDto(
            clubId: entity.clubId,
            clubPlaysPersonalId: entity.clubPlaysPersonalId,
          ),
        )
        .toList();
  }
}

class ChallengesTrophyDto extends ChallengesTrophy {
  ChallengesTrophyDto({
    super.presentChallenge,
    super.trophyChallenge,
    super.challengesJoinList,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory ChallengesTrophyDto.fromRawJson(String str) => ChallengesTrophyDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory ChallengesTrophyDto.fromMap(Map<String, dynamic> json) => ChallengesTrophyDto(
        presentChallenge: json['presentChallenge'] == null ? null : List<PresentChallenge>.from(json['presentChallenge'].map((x) => PresentChallengeDto.fromMap(x))),
        trophyChallenge: json['trophyChallenge'] == null ? null : List<TrophyChallenge>.from(json['trophyChallenge'].map((x) => TrophyChallengeDto.fromMap(x))),
        challengesJoinList: json['challengesJoinList'] == null ? null : List<String>.from(json['challengesJoinList'].map((x) => x)),
      );

  Map<String, dynamic> toMap() {
    return {
      'presentChallenge': presentChallenge == null ? null : PresentChallengeDto.fromPresentChallengeList(presentChallenge!).map((x) => x.toMap()).toList(),
      'trophyChallenge': trophyChallenge == null ? null : TrophyChallengeDto.fromTrophyChallengeList(trophyChallenge!).map((x) => x.toMap()).toList(),
      'challengesJoinList': challengesJoinList == null ? [] : challengesJoinList,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static ChallengesTrophyDto fromChallengesTrophy(ChallengesTrophy challengesTrophy) {
    return ChallengesTrophyDto(presentChallenge: challengesTrophy.presentChallenge, trophyChallenge: challengesTrophy.trophyChallenge, challengesJoinList: challengesTrophy.challengesJoinList);
  }

  ChallengesTrophy toChallengesTrophy() {
    return ChallengesTrophy(presentChallenge: presentChallenge, trophyChallenge: trophyChallenge, challengesJoinList: challengesJoinList);
  }
}

class PresentChallengeDto extends PresentChallenge {
  PresentChallengeDto({
    super.challengeName,
    super.challengeImage,
    super.challengeTimeStart,
    super.challengeTimeClose,
    super.challengeId,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory PresentChallengeDto.fromRawJson(String str) => PresentChallengeDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory PresentChallengeDto.fromMap(Map<String, dynamic> json) => PresentChallengeDto(
        challengeName: json['challenges_name'],
        challengeImage: json['challenges_image'],
        challengeTimeStart: json['challenges_time_start'],
        challengeTimeClose: json['challenges_time_close'],
        challengeId: json['challenge_id'],
      );

  Map<String, dynamic> toMap() {
    return {
      'challenges_name': challengeName,
      'challenges_image': challengeImage,
      'challenges_time_start': challengeTimeStart,
      'challenges_time_close': challengeTimeClose,
      'challenge_id': challengeId,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static PresentChallengeDto fromPresentChallenge(PresentChallenge presentChallenge) {
    return PresentChallengeDto(
      challengeName: presentChallenge.challengeName,
      challengeImage: presentChallenge.challengeImage,
      challengeTimeStart: presentChallenge.challengeTimeStart,
      challengeTimeClose: presentChallenge.challengeTimeClose,
      challengeId: presentChallenge.challengeTimeStart,
    );
  }

  PresentChallenge toPresentChallenge() {
    return PresentChallenge(
      challengeName: challengeName,
      challengeImage: challengeImage,
      challengeTimeStart: challengeTimeStart,
      challengeTimeClose: challengeTimeClose,
      challengeId: challengeTimeStart,
    );
  }

  static List<PresentChallengeDto> fromPresentChallengeList(List<PresentChallenge> presentChallenge) {
    return presentChallenge
        .map(
          (entity) => PresentChallengeDto(
            challengeName: entity.challengeName,
            challengeImage: entity.challengeImage,
            challengeTimeStart: entity.challengeTimeStart,
            challengeTimeClose: entity.challengeTimeClose,
            challengeId: entity.challengeTimeStart,
          ),
        )
        .toList();
  }
}

class TrophyChallengeDto extends TrophyChallenge {
  TrophyChallengeDto({
    super.challengeName,
    super.challengeImage,
    super.challengeTrophy,
    super.challengeId,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory TrophyChallengeDto.fromRawJson(String str) => TrophyChallengeDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory TrophyChallengeDto.fromMap(Map<String, dynamic> json) => TrophyChallengeDto(
        challengeName: json['challenges_name'],
        challengeImage: json['challenges_image'],
        challengeTrophy: json['challenge_trophy'],
        challengeId: json['challenge_id'],
      );

  Map<String, dynamic> toMap() {
    return {
      'challenges_name': challengeName,
      'challenges_image': challengeImage,
      'challenge_trophy': challengeTrophy,
      'challenge_id': challengeId,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static TrophyChallengeDto fromTrophyChallenge(TrophyChallenge trophyChallenge) {
    return TrophyChallengeDto(
      challengeName: trophyChallenge.challengeName,
      challengeImage: trophyChallenge.challengeImage,
      challengeTrophy: trophyChallenge.challengeTrophy,
      challengeId: trophyChallenge.challengeId,
    );
  }

  TrophyChallenge toTrophyChallenge() {
    return TrophyChallenge(
      challengeName: challengeName,
      challengeImage: challengeImage,
      challengeTrophy: challengeTrophy,
      challengeId: challengeId,
    );
  }

  static List<TrophyChallengeDto> fromTrophyChallengeList(List<TrophyChallenge> trophyChallengeList) {
    return trophyChallengeList
        .map(
          (entity) => TrophyChallengeDto(
            challengeName: entity.challengeName,
            challengeImage: entity.challengeImage,
            challengeTrophy: entity.challengeTrophy,
            challengeId: entity.challengeId,
          ),
        )
        .toList();
  }
}
