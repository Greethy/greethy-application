import 'package:equatable/equatable.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/body_specs.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/drink_plan.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/eating_plan.dart';
import 'package:greethy_application/domain/entities/user_entities/user.dart';

class NutritionManagement extends Equatable {
  final String id;
  final User me;
  final List<BodySpecs>? bodySpecs;
  final DrinkPlan? drinkPlan;
  final EatingPlan? eatingPlanPersonal;
  final EatingPlanCollective? eatingPlanCollective;

  NutritionManagement({
    required this.id,
    required this.me,
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
  final EatingPlan? eatingPlanCollectiveNow;
  final List<EatingPlan>? eatingPlanCollectiveOld;

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
