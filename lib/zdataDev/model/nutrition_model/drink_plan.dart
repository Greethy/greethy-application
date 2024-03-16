class DrinkScheduleModel {
  final int id;
  final int dailyGoal;
  final int totalDay;
  final String lastDrink;
  final List<DrinkSchedule> drinkScheduleDay;
  final List<int> drinkScheduleDayGroup;

  DrinkScheduleModel({
    required this.id,
    required this.dailyGoal,
    required this.totalDay,
    required this.lastDrink,
    required this.drinkScheduleDay,
    required this.drinkScheduleDayGroup,
  });

  factory DrinkScheduleModel.fromJson(Map<String, dynamic> json) {
    final drinkScheduleList = (json['drink_schedule_day'] as List<dynamic>)
        .map((scheduleJson) => DrinkSchedule.fromJson(scheduleJson))
        .toList();
    final drinkScheduleDayGroupList =
        (json['drink_schedule_day_group'] as List<dynamic>)
            .cast<int>()
            .toList();

    return DrinkScheduleModel(
      id: json['id'],
      dailyGoal: json['daily_goal'],
      totalDay: json['total_day'],
      lastDrink: json['last_drink'],
      drinkScheduleDay: drinkScheduleList,
      drinkScheduleDayGroup: drinkScheduleDayGroupList,
    );
  }
}

class DrinkSchedule {
  final String time;
  final int drinkMl;

  DrinkSchedule({
    required this.time,
    required this.drinkMl,
  });

  factory DrinkSchedule.fromJson(Map<String, dynamic> json) {
    return DrinkSchedule(
      time: json['time'],
      drinkMl: json['drink_ml'],
    );
  }
}