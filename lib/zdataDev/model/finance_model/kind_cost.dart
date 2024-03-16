import 'package:equatable/equatable.dart';

class KindCostModel extends Equatable {
  final String id;
  final String spendingPlanMonthlyId;
  final String kindName;
  final List<Cost> cost;
  final Subtotal subtotal;

  KindCostModel({
    required this.id,
    required this.spendingPlanMonthlyId,
    required this.kindName,
    required this.cost,
    required this.subtotal,
  });

  @override
  List<Object?> get props => [
    id,
    spendingPlanMonthlyId,
    kindName,
    cost,
    subtotal,
  ];

  factory KindCostModel.fromJson(Map<String, dynamic> json) {
    final costList = (json['cost'] as List<dynamic>).map((item) => Cost.fromJson(item)).toList();

    return KindCostModel(
      id: json['id'],
      spendingPlanMonthlyId: json['spendingPlanMonthly_id'],
      kindName: json['kind_name'],
      cost: costList,
      subtotal: Subtotal.fromJson(json['subtotal']),
    );
  }
}

class Cost extends Equatable {
  final String costName;
  final int projectedCost;
  final int actualCost;
  final int difference;
  final List<String> shoppingId;

  Cost({
    required this.costName,
    required this.projectedCost,
    required this.actualCost,
    required this.difference,
    required this.shoppingId,
  });

  @override
  List<Object?> get props => [costName, projectedCost, actualCost, difference, shoppingId];

  factory Cost.fromJson(Map<String, dynamic> json) {
    final shoppingIdList = (json['shopping_id'] as List<dynamic>).cast<String>().toList();

    return Cost(
      costName: json['cost_name'],
      projectedCost: json['projected_cost'],
      actualCost: json['actual_cost'],
      difference: json['difference'],
      shoppingId: shoppingIdList,
    );
  }
}

class Subtotal extends Equatable {
  final int projectedKindCost;
  final int actualKindCost;
  final int difference;

  Subtotal({
    required this.projectedKindCost,
    required this.actualKindCost,
    required this.difference,
  });

  @override
  List<Object?> get props => [projectedKindCost, actualKindCost, difference];

  factory Subtotal.fromJson(Map<String, dynamic> json) {
    return Subtotal(
      projectedKindCost: json['projected_kind_cost'],
      actualKindCost: json['actual_kind_cost'],
      difference: json['difference'],
    );
  }
}

