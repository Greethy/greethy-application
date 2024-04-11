import 'dart:convert';

import 'package:greethy_application/domain/entities/nutrition_entities/drink_plan.dart';

class DrinkPlanDto extends DrinkPlan {
  DrinkPlanDto({
    super.id,
    super.dailyGoal,
    super.totalDay,
    super.lastDrink,
    super.drinkScheduleDay,
    super.drinkScheduleDayGroup,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory DrinkPlanDto.fromRawJson(String str) => DrinkPlanDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory DrinkPlanDto.fromMap(Map<String, dynamic> json) {
    return DrinkPlanDto(
      id: json['id'],
      dailyGoal: json['daily_goal'],
      totalDay: json['total_day'],
      lastDrink: json['last_drink'],
      drinkScheduleDay: json['drink_schedule_day'] == null ? null : List<DrinkSchedule>.from(json['drink_schedule_day'].map((x) => DrinkScheduleDto.fromMap(x))),
      drinkScheduleDayGroup: json['drink_schedule_day_group'] == null ? [] : List<String>.from(json['drink_schedule_day_group']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'daily_goal': dailyGoal,
      'total_day': totalDay,
      'last_drink': lastDrink,
      'drink_schedule_day': drinkScheduleDay == null ? null : DrinkScheduleDto.fromDrinkScheduleList(drinkScheduleDay!).map((x) => x.toMap()).toList(),
      'drink_schedule_day_group': drinkScheduleDayGroup == null ? [] : drinkScheduleDayGroup,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static DrinkPlanDto fromDrinkPlan(DrinkPlan drinkPlan) {
    return DrinkPlanDto(
      id: drinkPlan.id,
      dailyGoal: drinkPlan.dailyGoal,
      totalDay: drinkPlan.totalDay,
      lastDrink: drinkPlan.lastDrink,
      drinkScheduleDay: drinkPlan.drinkScheduleDay,
      drinkScheduleDayGroup: drinkPlan.drinkScheduleDayGroup,
    );
  }

  DrinkPlan toDrinkPlan() {
    return DrinkPlan(
      id: id,
      dailyGoal: dailyGoal,
      totalDay: totalDay,
      lastDrink: lastDrink,
      drinkScheduleDay: drinkScheduleDay,
      drinkScheduleDayGroup: drinkScheduleDayGroup,
    );
  }
}

class DrinkScheduleDto extends DrinkSchedule {
  DrinkScheduleDto({
    super.time,
    super.drinkMl,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory DrinkScheduleDto.fromRawJson(String str) => DrinkScheduleDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory DrinkScheduleDto.fromMap(Map<String, dynamic> json) => DrinkScheduleDto(
        time: json['time'],
        drinkMl: json['drink_ml'],
      );

  Map<String, dynamic> toMap() {
    return {
      'time': time,
      'drink_ml': drinkMl,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static DrinkScheduleDto fromDrinkSchedule(DrinkSchedule drinkSchedule) {
    return DrinkScheduleDto(
      drinkMl: drinkSchedule.drinkMl,
      time: drinkSchedule.time,
    );
  }

  DrinkSchedule toDrinkSchedule() {
    return DrinkSchedule(
      drinkMl: drinkMl,
      time: time,
    );
  }

  static List<DrinkScheduleDto> fromDrinkScheduleList(List<DrinkSchedule> drinkSchedule) {
    return drinkSchedule
        .map(
          (schedule) => DrinkScheduleDto(
            drinkMl: schedule.drinkMl,
            time: schedule.time,
          ),
        )
        .toList();
  }
}
