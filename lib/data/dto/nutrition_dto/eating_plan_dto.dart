import 'dart:convert';

import 'package:greethy_application/domain/entities/nutrition_entities/eating_plan.dart';

class EatingPlanDto extends EatingPlan {
  EatingPlanDto({
    super.id,
    super.eatingPlanName,
    super.bio,
    super.ownerId,
    super.participants,
    super.bmrPerDay,
    super.eatingScheduleWeek,
    super.eatingScheduleGroup,
    super.createDate,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory EatingPlanDto.fromRawJson(String str) => EatingPlanDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory EatingPlanDto.fromMap(Map<String, dynamic> json) => EatingPlanDto(
        id: json['id'],
        eatingPlanName: json['eating_plan_name'],
        bio: json['bio'],
        ownerId: json['owner_id'],
        participants: json['participants'] == null ? [] : List<String>.from(json['participants']),
        bmrPerDay: json['bmrPerDay'],
        eatingScheduleWeek: json['eating_schedule_week'] == null ? null : List<EatingScheduleWeekDto>.from(json['eating_schedule_week'].map((x) => EatingScheduleWeekDto.fromMap(x))),
        eatingScheduleGroup: json['eating_schedule_group'] == null ? [] : List<String>.from(json['eating_schedule_group']),
        createDate: json['create_date'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'eating_plan_name': eatingPlanName,
      'bio': bio,
      'owner_id': ownerId,
      'participants': participants == null ? [] : participants,
      'bmrPerDay': bmrPerDay,
      'eating_schedule_week': eatingScheduleWeek == null ? null : EatingScheduleWeekDto.fromEatingScheduleWeekList(eatingScheduleWeek!).map((x) => x.toMap()).toList(),
      'eating_schedule_group': eatingScheduleGroup == null ? [] : eatingScheduleGroup,
      'create_date': createDate,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static EatingPlanDto fromEatingPlan(EatingPlan eatingPlan) {
    return EatingPlanDto(
      id: eatingPlan.id,
      eatingPlanName: eatingPlan.eatingPlanName,
      bio: eatingPlan.bio,
      ownerId: eatingPlan.ownerId,
      participants: eatingPlan.participants,
      bmrPerDay: eatingPlan.bmrPerDay,
      eatingScheduleWeek: eatingPlan.eatingScheduleWeek,
      eatingScheduleGroup: eatingPlan.eatingScheduleGroup,
      createDate: eatingPlan.createDate,
    );
  }

  EatingPlan toEatingPlan() {
    return EatingPlan(
      id: id,
      eatingPlanName: eatingPlanName,
      bio: bio,
      ownerId: ownerId,
      participants: participants,
      bmrPerDay: bmrPerDay,
      eatingScheduleWeek: eatingScheduleWeek,
      eatingScheduleGroup: eatingScheduleGroup,
      createDate: createDate,
    );
  }
}

class EatingScheduleWeekDto extends EatingScheduleWeek {
  EatingScheduleWeekDto({
    super.date,
    super.menuId,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory EatingScheduleWeekDto.fromRawJson(String str) => EatingScheduleWeekDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory EatingScheduleWeekDto.fromMap(Map<String, dynamic> json) => EatingScheduleWeekDto(
        date: json['date'],
        menuId: json['menu_id'],
      );

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'menu_id': menuId,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static EatingScheduleWeekDto fromEatingScheduleWeek(EatingScheduleWeek eatingScheduleWeek) {
    return EatingScheduleWeekDto(
      date: eatingScheduleWeek.date,
      menuId: eatingScheduleWeek.menuId,
    );
  }

  EatingScheduleWeek toEatingScheduleWeek() {
    return EatingScheduleWeek(
      date: date,
      menuId: menuId,
    );
  }

  static List<EatingScheduleWeekDto> fromEatingScheduleWeekList(List<EatingScheduleWeek> eatingScheduleWeekList) {
    return eatingScheduleWeekList
        .map(
          (entity) => EatingScheduleWeekDto(
            date: entity.date,
            menuId: entity.menuId,
          ),
        )
        .toList();
  }
}
