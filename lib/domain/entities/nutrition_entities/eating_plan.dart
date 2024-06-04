import 'package:equatable/equatable.dart';

class EatingPlan extends Equatable {
  final String? id;
  final String? eatingPlanName;
  final String? bio;
  final EatingPlanOwner? owner;
  final List<String>? participants;
  final int? bmrPerDay;
  final List<EatingScheduleWeek>? eatingScheduleWeek;
  final List<String>? eatingScheduleGroup;
  final String? createDate;

  EatingPlan({
    this.id,
    this.eatingPlanName,
    this.bio,
    this.owner,
    this.participants,
    this.bmrPerDay,
    this.eatingScheduleWeek,
    this.eatingScheduleGroup,
    this.createDate,
  });

  @override
  List<Object?> get props => [
        id,
        eatingPlanName,
        bio,
        owner,
        participants,
        bmrPerDay,
        eatingScheduleWeek,
        eatingScheduleGroup,
        createDate,
      ];
}

class EatingScheduleWeek extends Equatable {
  final String? date;
  final String? menuId;

  EatingScheduleWeek({
    this.date,
    this.menuId,
  });

  @override
  List<Object?> get props => [
        date,
        menuId,
      ];
}

class EatingPlanOwner extends Equatable {
  final String? id;
  final String? name;
  final String? avatar;

  EatingPlanOwner({
    this.id,
    this.name,
    this.avatar,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        avatar,
      ];
}
