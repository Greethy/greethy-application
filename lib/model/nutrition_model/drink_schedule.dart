class DrinkScheduleModel {
  final int id;
  final int drinkPlanId;
  final String createdAt;
  final List<DrinkScheduleDay> drinkScheduleDay;

  DrinkScheduleModel({
    required this.id,
    required this.drinkPlanId,
    required this.createdAt,
    required this.drinkScheduleDay,
  });

  factory DrinkScheduleModel.fromJson(Map<String, dynamic> json) {
    final drinkScheduleDayList = (json['drink_schedule_day'] as List<dynamic>)
        .map((scheduleJson) => DrinkScheduleDay.fromJson(scheduleJson))
        .toList();

    return DrinkScheduleModel(
      id: json['id'],
      drinkPlanId: json['drink_plan_id'],
      createdAt: json['create_at'],
      drinkScheduleDay: drinkScheduleDayList,
    );
  }
}

class DrinkScheduleDay {
  final String date;
  final int totalDay;

  DrinkScheduleDay({
    required this.date,
    required this.totalDay,
  });

  factory DrinkScheduleDay.fromJson(Map<String, dynamic> json) {
    return DrinkScheduleDay(
      date: json['date'],
      totalDay: json['total_day'],
    );
  }
}