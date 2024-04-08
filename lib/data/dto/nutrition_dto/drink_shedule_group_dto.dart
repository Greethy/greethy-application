import 'dart:convert';

import 'package:greethy_application/domain/entities/nutrition_entities/drink_shedule_group.dart';

class DrinkScheduleGroupDto extends DrinkScheduleGroup {
  DrinkScheduleGroupDto({
    super.id,
    super.drinkPlanId,
    super.createdAt,
    super.drinkSchedule2Month,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory DrinkScheduleGroupDto.fromRawJson(String str) => DrinkScheduleGroupDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory DrinkScheduleGroupDto.fromMap(Map<String, dynamic> json) {
    return DrinkScheduleGroupDto(
      id: json['id'],
      drinkPlanId: json['drink_plan_id'],
      createdAt: json['create_at'],
      drinkSchedule2Month: json['drink_schedule_2_month'] == null ? null : List<DrinkSchedule2MonthDto>.from(json['drink_schedule_day_group'].map((x) => DrinkSchedule2MonthDto.fromMap(x))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'drink_plan_id': drinkPlanId,
      'create_at': createdAt,
      'drink_schedule_2_month': drinkSchedule2Month == null ? null : DrinkSchedule2MonthDto.fromDrinkSchedule2MonthList(drinkSchedule2Month!).map((x) => x.toMap()).toList(),
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static DrinkScheduleGroupDto fromDrinkScheduleGroup(DrinkScheduleGroup drinkScheduleGroup) {
    return DrinkScheduleGroupDto(
      id: drinkScheduleGroup.id,
      drinkPlanId: drinkScheduleGroup.drinkPlanId,
      createdAt: drinkScheduleGroup.createdAt,
      drinkSchedule2Month: drinkScheduleGroup.drinkSchedule2Month,
    );
  }

  DrinkScheduleGroup toDrinkScheduleGroup() {
    return DrinkScheduleGroup(
      id: id,
      drinkPlanId: drinkPlanId,
      createdAt: createdAt,
      drinkSchedule2Month: drinkSchedule2Month,
    );
  }
}

class DrinkSchedule2MonthDto extends DrinkSchedule2Month {
  DrinkSchedule2MonthDto({
    super.date,
    super.totalDay,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------

  factory DrinkSchedule2MonthDto.fromRawJson(String str) => DrinkSchedule2MonthDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory DrinkSchedule2MonthDto.fromMap(Map<String, dynamic> json) => DrinkSchedule2MonthDto(
        date: json['date'],
        totalDay: json['total_day'],
      );

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'total_day': totalDay,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static DrinkSchedule2MonthDto fromDrinkSchedule2Month(DrinkSchedule2Month drinkScheduleDayIn2Month) {
    return DrinkSchedule2MonthDto(
      date: drinkScheduleDayIn2Month.date,
      totalDay: drinkScheduleDayIn2Month.totalDay,
    );
  }

  DrinkSchedule2MonthDto toDrinkSchedule2Month() {
    return DrinkSchedule2MonthDto(
      date: date,
      totalDay: totalDay,
    );
  }

  static List<DrinkSchedule2MonthDto> fromDrinkSchedule2MonthList(List<DrinkSchedule2Month> drinkScheduleDayIn2Month) {
    return drinkScheduleDayIn2Month
        .map(
          (schedule) => DrinkSchedule2MonthDto(
            date: schedule.date,
            totalDay: schedule.totalDay,
          ),
        )
        .toList();
  }
}
