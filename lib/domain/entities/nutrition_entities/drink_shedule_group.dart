import 'package:equatable/equatable.dart';

class DrinkScheduleGroup extends Equatable {
  final String? id;
  final String? drinkPlanId;
  final String? createdAt;
  final List<DrinkSchedule2Month>? drinkSchedule2Month;

  DrinkScheduleGroup({
    this.id,
    this.drinkPlanId,
    this.createdAt,
    this.drinkSchedule2Month,
  });

  @override
  List<Object?> get props => [
        id,
        drinkPlanId,
        createdAt,
        drinkSchedule2Month,
      ];
}

class DrinkSchedule2Month extends Equatable {
  final String? date;
  final int? totalDay;

  DrinkSchedule2Month({
    this.date,
    this.totalDay,
  });

  @override
  List<Object?> get props => [
        date,
        totalDay,
      ];
}
