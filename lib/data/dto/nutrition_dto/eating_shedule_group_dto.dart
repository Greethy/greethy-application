import 'dart:convert';

import 'package:greethy_application/domain/entities/nutrition_entities/eating_shedule_group.dart';

class EatingScheduleGroupDto extends EatingScheduleGroup {
  EatingScheduleGroupDto({
    super.id,
    super.eatingPlanId,
    super.createdAt,
    super.eatingSchedule,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory EatingScheduleGroupDto.fromRawJson(String str) => EatingScheduleGroupDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory EatingScheduleGroupDto.fromMap(Map<String, dynamic> json) => EatingScheduleGroupDto(
    id: json['id'],
    eatingPlanId: json['eating_plan_id'],
    createdAt: json['create_at'],
    eatingSchedule: json['eating_schedule'] == null ? null : List<EatingScheduleDto>.from(json['eating_schedule'].map((x) => EatingScheduleDto.fromMap(x))),
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'eating_plan_id': eatingPlanId,
      'create_at': createdAt,
      'eating_schedule': eatingSchedule == null ? null : EatingScheduleDto.fromEatingScheduleList(eatingSchedule!).map((x) => x.toMap()).toList(),
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static EatingScheduleGroupDto fromEatingScheduleGroup(EatingScheduleGroup eatingScheduleGroup) {
    return EatingScheduleGroupDto(
      id: eatingScheduleGroup.id,
      eatingPlanId: eatingScheduleGroup.eatingPlanId,
      createdAt: eatingScheduleGroup.createdAt,
      eatingSchedule: eatingScheduleGroup.eatingSchedule,
    );
  }

  EatingScheduleGroup toEatingScheduleGroup() {
    return EatingScheduleGroup(
      id: id,
      eatingPlanId: eatingPlanId,
      createdAt: createdAt,
      eatingSchedule: eatingSchedule,
    );
  }
}

class EatingScheduleDto extends EatingSchedule {
  EatingScheduleDto({
    super.date,
    super.menuId,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory EatingScheduleDto.fromRawJson(String str) => EatingScheduleDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory EatingScheduleDto.fromMap(Map<String, dynamic> json) => EatingScheduleDto(
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
  static EatingScheduleDto fromEatingSchedule(EatingSchedule eatingSchedule) {
    return EatingScheduleDto(
      date: eatingSchedule.date,
      menuId: eatingSchedule.menuId,
    );
  }

  EatingSchedule toEatingSchedule() {
    return EatingSchedule(
      date: date,
      menuId: menuId,
    );
  }

  static List<EatingScheduleDto> fromEatingScheduleList(List<EatingSchedule> eatingScheduleList) {
    return eatingScheduleList
        .map(
          (entity) => EatingScheduleDto(
            date: entity.date,
            menuId: entity.menuId,
          ),
        )
        .toList();
  }
}
