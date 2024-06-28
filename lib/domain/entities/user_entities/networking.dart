import 'package:equatable/equatable.dart';

class Networking extends Equatable {
  final String? id;
  final String? userId;
  final List<String>? following;
  final List<String>? followers;
  final List<String>? resFollowing;
  final List<String>? resFollower;
  final Relative? relatives;
  final ClubGroup? clubGroup;
  final ChallengesTrophy? challengesTrophy;

  Networking({
    this.id,
    this.userId,
    this.following,
    this.followers,
    this.resFollowing,
    this.resFollower,
    this.relatives,
    this.clubGroup,
    this.challengesTrophy,
  });

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
  final List<Homie>? resHomieSend;
  final List<Homie>? resHomieGet;
  final List<Homie>? homieList;

  Relative({
    this.resHomieSend,
    this.resHomieGet,
    this.homieList,
  });

  @override
  List<Object?> get props => [
        resHomieSend,
        resHomieGet,
        homieList,
      ];
}

class Homie extends Equatable {
  final String? position;
  final String? userId;

  Homie({
    this.position,
    this.userId,
  });

  @override
  List<Object?> get props => [
        position,
        userId,
      ];
}

class ClubGroup extends Equatable {
  final List<TopClub>? topClub;
  final List<Club>? clubList;

  ClubGroup({
    this.topClub,
    this.clubList,
  });

  @override
  List<Object?> get props => [
        topClub,
        clubList,
      ];
}

class TopClub extends Equatable {
  final String? clubName;
  final String? clubProfilePic;
  final int? clubStar;
  final String? clubPlaysPersonalId;
  final String clubId;

  TopClub({
    this.clubName,
    this.clubProfilePic,
    this.clubStar,
    this.clubPlaysPersonalId,
    required this.clubId,
  });

  @override
  List<Object?> get props => [
        clubName,
        clubProfilePic,
        clubStar,
        clubPlaysPersonalId,
        clubId,
      ];
}

class Club extends Equatable {
  final String? clubId;
  final String? clubPlaysPersonalId;

  Club({
    this.clubId,
    this.clubPlaysPersonalId,
  });

  @override
  List<Object?> get props => [
        clubId,
        clubPlaysPersonalId,
      ];
}

class ChallengesTrophy extends Equatable {
  final List<PresentChallenge>? presentChallenge;
  final List<TrophyChallenge>? trophyChallenge;
  final List<String>? challengesJoinList;

  ChallengesTrophy({
    this.presentChallenge,
    this.trophyChallenge,
    this.challengesJoinList,
  });

  @override
  List<Object?> get props => [
        presentChallenge,
        trophyChallenge,
        challengesJoinList,
      ];
}

class TrophyChallenge extends Equatable {
  final String? challengeName;
  final String? challengeImage;
  final String? challengeTrophy;
  final String? challengeId;

  TrophyChallenge({
    this.challengeName,
    this.challengeImage,
    this.challengeTrophy,
    this.challengeId,
  });

  @override
  List<Object?> get props => [
        challengeName,
        challengeImage,
        challengeTrophy,
        challengeId,
      ];
}

class PresentChallenge extends Equatable {
  final String? challengeName;
  final String? challengeImage;
  final String? challengeTimeStart;
  final String? challengeTimeClose;
  final String? challengeId;

  PresentChallenge({
    this.challengeName,
    this.challengeImage,
    this.challengeTimeStart,
    this.challengeTimeClose,
    this.challengeId,
  });

  @override
  List<Object?> get props => [
        challengeName,
        challengeImage,
        challengeTimeStart,
        challengeTimeClose,
        challengeId,
      ];
}
