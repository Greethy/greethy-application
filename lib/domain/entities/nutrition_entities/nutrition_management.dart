import 'package:equatable/equatable.dart';

class NutritionManagement extends Equatable {
  final String id;
  final String ownId;
  final List<String>? bodySpecs;
  final String? drinkPlanId;
  final String? eatingPlanPersonalId;
  final EatingPlanCollective? eatingPlanCollective;

  NutritionManagement({
    required this.id,
    required this.ownId,
    this.bodySpecs,
    this.drinkPlanId,
    this.eatingPlanPersonalId,
    this.eatingPlanCollective,
  });

  @override
  List<Object?> get props => [
        id,
        ownId,
        bodySpecs,
        drinkPlanId,
        eatingPlanPersonalId,
    eatingPlanCollective,
      ];
}

class EatingPlanCollective extends Equatable {
  final String? eatingPlanCollectiveStartAt;
  final String? eatingPlanCollectiveIdNow;
  final List<String>? listEatingPlanCollectiveIdOld;

  EatingPlanCollective({
    this.eatingPlanCollectiveStartAt,
    this.eatingPlanCollectiveIdNow,
    this.listEatingPlanCollectiveIdOld,
  });

  @override
  List<Object?> get props => [
        eatingPlanCollectiveStartAt,
        eatingPlanCollectiveIdNow,
        listEatingPlanCollectiveIdOld,
      ];
}
