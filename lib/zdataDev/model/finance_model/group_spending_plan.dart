import 'package:equatable/equatable.dart';

class GroupSpendingPlanModel extends Equatable {
  final String id;
  final String type;
  final List<SpendingPlanMonthly> spendingPlanMonthly;

  GroupSpendingPlanModel({
    required this.id,
    required this.type,
    required this.spendingPlanMonthly,
  });

  @override
  List<Object?> get props => [id, type, spendingPlanMonthly];

  factory GroupSpendingPlanModel.fromJson(Map<String, dynamic> json) {
    final spendingPlanMonthly = json['spending_plan_monthly'] as List<dynamic>;

    final nearestList = spendingPlanMonthly
        .map((item) => SpendingPlanMonthly.fromJson(item))
        .toList();

    return GroupSpendingPlanModel(
      id: json['id'],
      type: json['type'],
      spendingPlanMonthly: nearestList,
    );
  }
}

class SpendingPlanMonthly extends Equatable {
  final String date;
  final String spendingPlanMonthlyId;
  final int totalActualMonthlySpendingPlan;

  SpendingPlanMonthly({
    required this.date,
    required this.spendingPlanMonthlyId,
    required this.totalActualMonthlySpendingPlan,
  });

  @override
  List<Object?> get props => [date, spendingPlanMonthlyId, totalActualMonthlySpendingPlan];

  factory SpendingPlanMonthly.fromJson(Map<String, dynamic> json) {
    return SpendingPlanMonthly(
      date: json['date'],
      spendingPlanMonthlyId: json['spending_plan_monthly_id'],
      totalActualMonthlySpendingPlan: json['total_actual_monthly_spending_plan'],
    );
  }
}
