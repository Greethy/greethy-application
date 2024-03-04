class NutritionManagementModel {
  final int id;
  final int userId;
  final List<int> bodySpecs;
  final int drinkPlanId;
  final int eatingPlanPersonalId;
  final EatingPlanCollective eatingPlanCollective;

  NutritionManagementModel({
    required this.id,
    required this.userId,
    required this.bodySpecs,
    required this.drinkPlanId,
    required this.eatingPlanPersonalId,
    required this.eatingPlanCollective,
  });

  factory NutritionManagementModel.fromJson(Map<String, dynamic> json) {
    final bodySpecsList = (json['body_specs'] as List<dynamic>).cast<int>().toList();

    return NutritionManagementModel(
      id: json['id'],
      userId: json['userId'],
      bodySpecs: bodySpecsList,
      drinkPlanId: json['drink_plan_id'],
      eatingPlanPersonalId: json['eating_plan_personal_id'],
      eatingPlanCollective: EatingPlanCollective.fromJson(json['eating_plan_collective']),
    );
  }
}

class EatingPlanCollective {
  final String eatingPlanCollectiveStartAt;
  final int eatingPlanCollectiveId;
  final List<int> eatingPlanCollectiveOld;

  EatingPlanCollective({
    required this.eatingPlanCollectiveStartAt,
    required this.eatingPlanCollectiveId,
    required this.eatingPlanCollectiveOld,
  });

  factory EatingPlanCollective.fromJson(Map<String, dynamic> json) {
    final eatingPlanCollectiveOldList =
        (json['eating_plan_collective_old'] as List<dynamic>).cast<int>().toList();

    return EatingPlanCollective(
      eatingPlanCollectiveStartAt: json['eating_plan_collective_start_at'],
      eatingPlanCollectiveId: json['eating_plan_collective_id'],
      eatingPlanCollectiveOld: eatingPlanCollectiveOldList,
    );
  }
}