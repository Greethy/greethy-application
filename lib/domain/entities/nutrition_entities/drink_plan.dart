import 'package:equatable/equatable.dart';

class DrinkPlan extends Equatable {
  final String id;
  final int? dailyGoal;
  final int? totalDay;
  final String? lastDrink;
  final List<DrinkSchedule>? drinkScheduleDay;
  final List<int>? drinkScheduleDayGroup;

  DrinkPlan({
    required this.id,
    this.dailyGoal,
    this.totalDay,
    this.lastDrink,
    this.drinkScheduleDay,
    this.drinkScheduleDayGroup,
  });

  @override
  List<Object?> get props => [
        id,
        dailyGoal,
        totalDay,
        lastDrink,
        drinkScheduleDay,
        drinkScheduleDayGroup,
      ];
}

class DrinkSchedule extends Equatable {
  final String? time;
  final int? drinkMl;

  DrinkSchedule({
    this.time,
    this.drinkMl,
  });

  @override
  List<Object?> get props => [time, drinkMl];
}
