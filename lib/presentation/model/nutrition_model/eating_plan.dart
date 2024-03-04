class EatingPlanModel {
  final int id;
  final String eatingPlanName;
  final String bio;
  final int ownerId;
  final List<int> participants;
  final int bmrPerDay;
  final List<EatingScheduleWeek> eatingScheduleWeek;
  final List<int> eatingScheduleGroup;
  final String createDate;

  EatingPlanModel({
    required this.id,
    required this.eatingPlanName,
    required this.bio,
    required this.ownerId,
    required this.participants,
    required this.bmrPerDay,
    required this.eatingScheduleWeek,
    required this.eatingScheduleGroup,
    required this.createDate,
  });

  factory EatingPlanModel.fromJson(Map<String, dynamic> json) {
    final eatingScheduleWeekList =
        (json['eating_schedule_week'] as List<dynamic>)
            .map((scheduleJson) => EatingScheduleWeek.fromJson(scheduleJson))
            .toList();
    final eatingScheduleGroupList =
        (json['eating_schedule_group'] as List<dynamic>)
            .cast<int>()
            .toList();

    return EatingPlanModel(
      id: json['id'],
      eatingPlanName: json['eating_plan_name'],
      bio: json['bio'],
      ownerId: json['owner_id'],
      participants: (json['participants'] as List<dynamic>).cast<int>().toList(),
      bmrPerDay: json['bmrPerDay'],
      eatingScheduleWeek: eatingScheduleWeekList,
      eatingScheduleGroup: eatingScheduleGroupList,
      createDate: json['create_date'],
    );
  }
}

class EatingScheduleWeek {
  final String date;
  final int menuId;

  EatingScheduleWeek({
    required this.date,
    required this.menuId,
  });

  factory EatingScheduleWeek.fromJson(Map<String, dynamic> json) {
    return EatingScheduleWeek(
      date: json['date'],
      menuId: json['menu_id'],
    );
  }
}