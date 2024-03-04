import 'package:equatable/equatable.dart';

class EatingScheduleGroup extends Equatable {
  final String id;
  final String eatingPlanId;
  final String createdAt;
  final List<EatingSchedule> eatingSchedule;

  EatingScheduleGroup({
    required this.id,
    required this.eatingPlanId,
    required this.createdAt,
    required this.eatingSchedule,
  });

  @override
  List<Object?> get props => [id, eatingPlanId, createdAt, eatingSchedule];
}

class EatingSchedule extends Equatable {
  final String date;
  final int menuId;

  EatingSchedule({
    required this.date,
    required this.menuId,
  });

  @override
  List<Object?> get props => [date, menuId];
}