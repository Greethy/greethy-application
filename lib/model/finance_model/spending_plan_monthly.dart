import 'package:equatable/equatable.dart';

class SpendingPlanMonthlyModel extends Equatable {
  final String id;
  final GroupSpendingPlan groupSpendingPlan;
  final String time;
  final String shoppingMonthlyId;
  final String incomeMonthlyId;
  final List<KindCostOfPlan> kindCostOfPlan;
  final TotalCost totalCost;
  final TotalBalance totalBalance;
  final String oldMoney;

  SpendingPlanMonthlyModel({
    required this.id,
    required this.groupSpendingPlan,
    required this.time,
    required this.shoppingMonthlyId,
    required this.incomeMonthlyId,
    required this.kindCostOfPlan,
    required this.totalCost,
    required this.totalBalance,
    required this.oldMoney,
  });

  @override
  List<Object?> get props => [
        id,
        groupSpendingPlan,
        time,
        shoppingMonthlyId,
        incomeMonthlyId,
        kindCostOfPlan,
        totalCost,
        totalBalance,
        oldMoney,
      ];

  factory SpendingPlanMonthlyModel.fromJson(Map<String, dynamic> json) {
    final kindCostOfPlanList = (json['kind_cost_of_plan'] as List<dynamic>).map((item) => KindCostOfPlan.fromJson(item)).toList();

    return SpendingPlanMonthlyModel(
      id: json['id'],
      groupSpendingPlan: GroupSpendingPlan.fromJson(json['groupSpendingPlan']),
      time: json['time'],
      shoppingMonthlyId: json['shopping_monthly_id'],
      incomeMonthlyId: json['income_monthly_id'],
      kindCostOfPlan: kindCostOfPlanList,
      totalCost: TotalCost.fromJson(json['total_cost']),
      totalBalance: TotalBalance.fromJson(json['total_balance']),
      oldMoney: json['old_money'],
    );
  }
}

class GroupSpendingPlan extends Equatable {
  final String id;
  final String type;

  GroupSpendingPlan({
    required this.id,
    required this.type,
  });

  @override
  List<Object?> get props => [id, type];

  factory GroupSpendingPlan.fromJson(Map<String, dynamic> json) {
    return GroupSpendingPlan(
      id: json['id'],
      type: json['type'],
    );
  }
}

class KindCostOfPlan extends Equatable {
  final String kindId;
  final String kindName;
  final List<String> typeOfKind;
  final bool tooMuch;
  final int totalActualCost;

  KindCostOfPlan({
    required this.kindId,
    required this.kindName,
    required this.typeOfKind,
    required this.tooMuch,
    required this.totalActualCost,
  });

  @override
  List<Object?> get props => [
        kindId,
        kindName,
        typeOfKind,
        tooMuch,
        totalActualCost,
      ];

  factory KindCostOfPlan.fromJson(Map<String, dynamic> json) {
    final typeOfKindList = (json['type_of_kind'] as List<dynamic>).cast<String>().toList();

    return KindCostOfPlan(
      kindId: json['kind_id'],
      kindName: json['kind_name'],
      typeOfKind: typeOfKindList,
      tooMuch: json['too_much'],
      totalActualCost: json['total_actual_cost'],
    );
  }
}

class TotalCost extends Equatable {
  final int totalProjectedCost;
  final int totalActualCost;
  final int difference;

  TotalCost({
    required this.totalProjectedCost,
    required this.totalActualCost,
    required this.difference,
  });

  @override
  List<Object?> get props => [
        totalProjectedCost,
        totalActualCost,
        difference,
      ];

  factory TotalCost.fromJson(Map<String, dynamic> json) {
    return TotalCost(
      totalProjectedCost: json['total_projected_cost'],
      totalActualCost: json['total_actual_cost'],
      difference: json['difference'],
    );
  }
}

class TotalBalance extends Equatable {
  final int projectedBalance;
  final int actualBalance;

  TotalBalance({
    required this.projectedBalance,
    required this.actualBalance,
  });

  @override
  List<Object?> get props => [
        projectedBalance,
        actualBalance,
      ];

  factory TotalBalance.fromJson(Map<String, dynamic> json) {
    return TotalBalance(
      projectedBalance: json['projected_balance'],
      actualBalance: json['actual_balance'],
    );
  }
}
