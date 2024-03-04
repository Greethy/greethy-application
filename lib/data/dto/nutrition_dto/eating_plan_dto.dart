import 'package:equatable/equatable.dart';

class EatingPlan extends Equatable {
  final String id;
  final String? eatingPlanName;
  final String? bio;
  final String? ownerId;
  final List<String>? participants;
  final int? bmrPerDay;
  final List<EatingScheduleWeek>? eatingScheduleWeek;
  final List<int>? eatingScheduleGroup;
  final String? createDate;

  EatingPlan({
    required this.id,
    this.eatingPlanName,
    this.bio,
    this.ownerId,
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
        ownerId,
        participants,
        bmrPerDay,
        eatingScheduleWeek,
        eatingScheduleGroup,
        createDate,
      ];
}

class EatingScheduleWeek extends Equatable {
  final String? date;
  final int? menuId;

  EatingScheduleWeek({
    this.date,
    this.menuId,
  });

  @override
  List<Object?> get props => [date, menuId];
}
