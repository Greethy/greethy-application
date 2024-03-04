import 'package:equatable/equatable.dart';

class NutritionManagement extends Equatable {
  final String id;
  final String ownId;
  final List<String>? bodySpecs;
  final String? drinkPlan;
  final String? eatingPlanPersonal;
  final EatingPlanCollective? eatingPlanCollective;

  NutritionManagement({
    required this.id,
    required this.ownId,
    this.bodySpecs,
    this.drinkPlan,
    this.eatingPlanPersonal,
    this.eatingPlanCollective,
  });

  @override
  List<Object?> get props => [
        id,
        me,
        bodySpecs,
        drinkPlan,
        eatingPlanPersonal,
        eatingPlanCollective,
      ];
}

class EatingPlanCollective extends Equatable {
  final String? eatingPlanCollectiveStartAt;
  final String? eatingPlanCollectiveNow;
  final List<String>? eatingPlanCollectiveOld;

  EatingPlanCollective({
    this.eatingPlanCollectiveStartAt,
    this.eatingPlanCollectiveNow,
    this.eatingPlanCollectiveOld,
  });

  @override
  List<Object?> get props => [
        eatingPlanCollectiveStartAt,
        eatingPlanCollectiveNow,
        eatingPlanCollectiveOld,
      ];
}
