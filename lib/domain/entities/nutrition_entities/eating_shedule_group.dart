import 'package:equatable/equatable.dart';

class EatingScheduleGroup extends Equatable {
  final String? id;
  final String? eatingPlanId;
  final String? createdAt;
  final List<EatingSchedule>? eatingSchedule;

  EatingScheduleGroup({
    this.id,
    this.eatingPlanId,
    this.createdAt,
    this.eatingSchedule,
  });

  @override
  List<Object?> get props => [
        id,
        eatingPlanId,
        createdAt,
        eatingSchedule,
      ];
}

class EatingSchedule extends Equatable {
  final String? date;
  final int? menuId;

  EatingSchedule({
    this.date,
    this.menuId,
  });

  @override
  List<Object?> get props => [
        date,
        menuId,
      ];
}
