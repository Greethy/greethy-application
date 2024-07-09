import 'package:equatable/equatable.dart';

class NutritionManagement extends Equatable {
  final String? id;
  final String? ownId;
  final String? drinkPlanId;
  final String? eatingPlanPersonalId;
  final int? lunchRations;
  final int? dinnerRations;
  final bool? breakfastSnack;
  final bool? afternoonSnack;
  final EatingPlanCollective? eatingPlanCollective;

  NutritionManagement({
    this.id,
    this.ownId,
    this.drinkPlanId,
    this.eatingPlanPersonalId,
    this.lunchRations,
    this.dinnerRations,
    this.breakfastSnack,
    this.afternoonSnack,
    this.eatingPlanCollective,
  });

  @override
  List<Object?> get props => [
        id,
        ownId,
        drinkPlanId,
        eatingPlanPersonalId,
        lunchRations,
        dinnerRations,
        breakfastSnack,
        afternoonSnack,
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
