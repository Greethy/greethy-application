import 'package:equatable/equatable.dart';

class FinancialManagementModel extends Equatable {
  final String id;
  final String userId;
  final String currency;
  final ManagePersonalFinance managePersonalFinance;
  final ManageCollectiveFinance manageCollectiveFinance;

  FinancialManagementModel({
    required this.id,
    required this.userId,
    required this.currency,
    required this.managePersonalFinance,
    required this.manageCollectiveFinance,
  });

  factory FinancialManagementModel.fromJson(Map<String, dynamic> json) {
    return FinancialManagementModel(
      id: json['id'],
      userId: json['userId'],
      currency: json['currency'],
      managePersonalFinance: ManagePersonalFinance.fromJson(json['manage_personal_finance']),
      manageCollectiveFinance: ManageCollectiveFinance.fromJson(json['manage_collective_finance']),
    );
  }

  @override
  List<Object?> get props => [id, userId, currency, managePersonalFinance, manageCollectiveFinance];
}

class ManagePersonalFinance extends Equatable {
  final Incomes incomes;
  final SpendingPlans spendingPlans;
  final Shopping shopping;

  ManagePersonalFinance({
    required this.incomes,
    required this.spendingPlans,
    required this.shopping,
  });

  factory ManagePersonalFinance.fromJson(Map<String, dynamic> json) {
    return ManagePersonalFinance(
      incomes: Incomes.fromJson(json['incomes']),
      spendingPlans: SpendingPlans.fromJson(json['spendingPlans']),
      shopping: Shopping.fromJson(json['shopping']),
    );
  }

  @override
  List<Object?> get props => [incomes, spendingPlans, shopping];
}

class Incomes extends Equatable {
  final String activeIncomeMonthlyId;
  final String groupIncomeId;

  Incomes({
    required this.activeIncomeMonthlyId,
    required this.groupIncomeId,
  });

  factory Incomes.fromJson(Map<String, dynamic> json) {
    return Incomes(
      activeIncomeMonthlyId: json['active_incomeMonthly_id'],
      groupIncomeId: json['groupIncome_id'],
    );
  }

  @override
  List<Object?> get props => [activeIncomeMonthlyId, groupIncomeId];
}

class SpendingPlans extends Equatable {
  final String activeSpendingPlanMonthlyId;
  final String groupSpendingPlanId;

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
  List<Object?> get props => [activeSpendingPlanMonthlyId, groupSpendingPlanId];
}

class Shopping extends Equatable {
  final String activeShoppingMonthlyId;
  final String groupShoppingId;

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
  List<Object?> get props => [activeShoppingMonthlyId, groupShoppingId];
}

class ManageCollectiveFinance extends Equatable {
  final List<Collective> active;
  final List<Collective> closed;

  ManageCollectiveFinance({
    required this.active,
    required this.closed,
  });

  factory ManageCollectiveFinance.fromJson(Map<String, dynamic> json) {
    return ManageCollectiveFinance(
      active: List<Collective>.from(json['active'].map((x) => Collective.fromJson(x))),
      closed: List<Collective>.from(json['closed'].map((x) => Collective.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [active, closed];
}

class Collective extends Equatable {
  final String collectiveId;
  final String collectiveName;

  Collective({
    required this.collectiveId,
    required this.collectiveName,
  });

  factory Collective.fromJson(Map<String, dynamic> json) {
    return Collective(
      collectiveId: json['collective_id'],
      collectiveName: json['collective_name'],
    );
  }

  @override
  List<Object?> get props => [collectiveId, collectiveName];
}