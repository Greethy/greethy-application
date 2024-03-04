import 'package:equatable/equatable.dart';

class CollectiveModel extends Equatable {
  String id;
  String collectiveName;
  int ownerId;
  List<int> participants;
  Income income;
  SpendingPlans spendingPlans;
  Shopping shopping;

  CollectiveModel({
    required this.id,
    required this.collectiveName,
    required this.ownerId,
    required this.participants,
    required this.income,
    required this.spendingPlans,
    required this.shopping,
  });

  factory CollectiveModel.fromJson(Map<String, dynamic> json) {
    return CollectiveModel(
      id: json['id'],
      collectiveName: json['collectiveName'],
      ownerId: json['owner_id'],
      participants: List<int>.from(json['participants']),
      income: Income.fromJson(json['income']),
      spendingPlans: SpendingPlans.fromJson(json['spendingPlans']),
      shopping: Shopping.fromJson(json['shopping']),
    );
  }

  @override
  List<Object?> get props => [
        id,
        collectiveName,
        ownerId,
        participants,
        income,
        spendingPlans,
        shopping,
      ];
}

class Income extends Equatable {
  String activeIncomeMonthlyId;
  String groupIncomeId;

  Income({
    required this.activeIncomeMonthlyId,
    required this.groupIncomeId,
  });

  factory Income.fromJson(Map<String, dynamic> json) {
    return Income(
      activeIncomeMonthlyId: json['active_incomeMonthly_id'],
      groupIncomeId: json['groupIncome_id'],
    );
  }

  @override
  List<Object?> get props => [
        activeIncomeMonthlyId,
        groupIncomeId,
      ];
}

class SpendingPlans extends Equatable {
  String activeSpendingPlanMonthlyId;
  String groupSpendingPlanId;

  SpendingPlans({
    required this.activeSpendingPlanMonthlyId,
    required this.groupSpendingPlanId,
  });

  factory SpendingPlans.fromJson(Map<String, dynamic> json) {
    return SpendingPlans(
      activeSpendingPlanMonthlyId: json['active_spendingPlanMonthly_id'],
      groupSpendingPlanId: json['groupSpendingPlan_id'],
    );
  }

  @override
  List<Object?> get props => [
        activeSpendingPlanMonthlyId,
        groupSpendingPlanId,
      ];
}

class Shopping extends Equatable {
  String activeShoppingMonthlyId;
  String groupShoppingId;

  Shopping({
    required this.activeShoppingMonthlyId,
    required this.groupShoppingId,
  });

  factory Shopping.fromJson(Map<String, dynamic> json) {
    return Shopping(
      activeShoppingMonthlyId: json['active_shoppingMonthly_id'],
      groupShoppingId: json['groupShopping_id'],
    );
  }

  @override
  List<Object?> get props => [
        activeShoppingMonthlyId,
        groupShoppingId,
      ];
}
