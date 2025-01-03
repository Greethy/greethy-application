import 'dart:convert';

import 'package:greethy_application/domain/entities/nutrition_entities/nutrition_management.dart';

class NutritionManagementDto extends NutritionManagement {
  NutritionManagementDto({
    super.id,
    super.ownId,
    super.drinkPlanId,
    super.eatingPlanPersonalId,
    super.lunchRations,
    super.dinnerRations,
    super.breakfastSnack,
    super.afternoonSnack,
    super.eatingPlanCollective,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory NutritionManagementDto.fromRawJson(String str) => NutritionManagementDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory NutritionManagementDto.fromMap(Map<String, dynamic> json) => NutritionManagementDto(
        id: json['id'],
        ownId: json['userId'],
        drinkPlanId: json['drink_plan_id'],
        eatingPlanPersonalId: json['eating_plan_personal_id'],
        lunchRations: json['lunch_rations'],
        dinnerRations: json['dinner_rations'],
        breakfastSnack: json['breakfast_snack'],
        afternoonSnack: json['afternoon_snack'],
        eatingPlanCollective: json['eating_plan_collective'] == null ? null : EatingPlanCollectiveDto.fromMap(json['eating_plan_collective']),
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': ownId,
      'drink_plan_id': drinkPlanId,
      'eating_plan_personal_id': eatingPlanPersonalId,
      'lunch_rations': lunchRations,
      'dinner_rations': dinnerRations,
      'breakfast_snack': breakfastSnack,
      'afternoon_snack': afternoonSnack,
      'eating_plan_collective': eatingPlanCollective == null ? null : EatingPlanCollectiveDto.fromEatingPlanCollective(eatingPlanCollective!).toMap(),
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static NutritionManagementDto fromNutritionManagement(NutritionManagement nutritionManagement) {
    return NutritionManagementDto(
      id: nutritionManagement.id,
      ownId: nutritionManagement.ownId,
      drinkPlanId: nutritionManagement.drinkPlanId,
      eatingPlanPersonalId: nutritionManagement.eatingPlanPersonalId,
      lunchRations: nutritionManagement.lunchRations,
      dinnerRations: nutritionManagement.dinnerRations,
      breakfastSnack: nutritionManagement.breakfastSnack,
      afternoonSnack: nutritionManagement.afternoonSnack,
      eatingPlanCollective: nutritionManagement.eatingPlanCollective,
    );
  }

  NutritionManagement toNutritionManagement() {
    return NutritionManagement(
      id: id,
      ownId: ownId,
      drinkPlanId: drinkPlanId,
      eatingPlanPersonalId: eatingPlanPersonalId,
      lunchRations: lunchRations,
      dinnerRations: dinnerRations,
      breakfastSnack: breakfastSnack,
      afternoonSnack: afternoonSnack,
      eatingPlanCollective: eatingPlanCollective,
    );
  }
}

class EatingPlanCollectiveDto extends EatingPlanCollective {
  EatingPlanCollectiveDto({
    super.eatingPlanCollectiveStartAt,
    super.eatingPlanCollectiveIdNow,
    super.listEatingPlanCollectiveIdOld,
  });

  // ---------------------------------------------------------------------------
  // JSON
  // ---------------------------------------------------------------------------
  factory EatingPlanCollectiveDto.fromRawJson(String str) => EatingPlanCollectiveDto.fromMap(json.decode(str));

  String toRawJson() => json.encode(toMap());

  // ---------------------------------------------------------------------------
  // Maps
  // ---------------------------------------------------------------------------
  factory EatingPlanCollectiveDto.fromMap(Map<String, dynamic> json) => EatingPlanCollectiveDto(
        eatingPlanCollectiveStartAt: json['eating_plan_collective_start_at'],
        eatingPlanCollectiveIdNow: json['eating_plan_collective_id'],
        listEatingPlanCollectiveIdOld: json['eating_plan_collective_old'] == null ? [] : List<String>.from(json['eating_plan_collective_old']),
      );

  Map<String, dynamic> toMap() {
    return {
      'eating_plan_collective_start_at': eatingPlanCollectiveStartAt,
      'eating_plan_collective_id': eatingPlanCollectiveIdNow,
      'eating_plan_collective_old': listEatingPlanCollectiveIdOld == null ? [] : listEatingPlanCollectiveIdOld,
    };
  }

  // ---------------------------------------------------------------------------
  // Domain
  // ---------------------------------------------------------------------------
  static EatingPlanCollectiveDto fromEatingPlanCollective(EatingPlanCollective eatingPlanCollective) {
    return EatingPlanCollectiveDto(
      eatingPlanCollectiveStartAt: eatingPlanCollective.eatingPlanCollectiveStartAt,
      eatingPlanCollectiveIdNow: eatingPlanCollective.eatingPlanCollectiveIdNow,
      listEatingPlanCollectiveIdOld: eatingPlanCollective.listEatingPlanCollectiveIdOld,
    );
  }

  EatingPlanCollective toEatingPlanCollective() {
    return EatingPlanCollective(
      eatingPlanCollectiveStartAt: eatingPlanCollectiveStartAt,
      eatingPlanCollectiveIdNow: eatingPlanCollectiveIdNow,
      listEatingPlanCollectiveIdOld: listEatingPlanCollectiveIdOld,
    );
  }
}
