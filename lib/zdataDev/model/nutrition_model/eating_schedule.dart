class EatingScheduleModel {
  final int id;
  final int eatingPlanId;
  final String createdAt;
  final List<EatingSchedule> eatingSchedule;

  EatingScheduleModel({
    required this.id,
    required this.eatingPlanId,
    required this.createdAt,
    required this.eatingSchedule,
  });

  factory EatingScheduleModel.fromJson(Map<String, dynamic> json) {
    final eatingScheduleList = (json['eating_schedule'] as List<dynamic>)
        .map((scheduleJson) => EatingSchedule.fromJson(scheduleJson))
        .toList();

    return EatingScheduleModel(
      id: json['id'],
      eatingPlanId: json['eating_plan_id'],
      createdAt: json['create_at'],
      eatingSchedule: eatingScheduleList,
    );
  }
}

class EatingSchedule {
  final String date;
  final int menuId;

  EatingSchedule({
    required this.date,
    required this.menuId,
  });

  factory EatingSchedule.fromJson(Map<String, dynamic> json) {
    return EatingSchedule(
      date: json['date'],
      menuId: json['menu_id'],
    );
  }
}