import 'package:equatable/equatable.dart';

class GroupIncomeModel extends Equatable {
  final String id;
  final String type;
  final List<IncomeMonthlyNearest> incomeMonthlyNearest;
  final List<String> incomeMonthlyList;

  GroupIncomeModel({
    required this.id,
    required this.type,
    required this.incomeMonthlyNearest,
    required this.incomeMonthlyList,
  });

  @override
  List<Object?> get props => [id, type, incomeMonthlyNearest, incomeMonthlyList];

  factory GroupIncomeModel.fromJson(Map<String, dynamic> json) {
    final incomeMonthlyNearestList = json['income_monthly_nearest'] as List<dynamic>;
    final incomeMonthlyList = json['income_monthly_list'] as List<dynamic>;

    final nearestList = incomeMonthlyNearestList
        .map((item) => IncomeMonthlyNearest.fromJson(item))
        .toList();

    final monthlyList = incomeMonthlyList.cast<String>().toList();

    return GroupIncomeModel(
      id: json['id'],
      type: json['type'],
      incomeMonthlyNearest: nearestList,
      incomeMonthlyList: monthlyList,
    );
  }
}

class IncomeMonthlyNearest extends Equatable {
  final String date;
  final String incomeMonthlyId;
  final int totalActualMonthlyIncome;

  IncomeMonthlyNearest({
    required this.date,
    required this.incomeMonthlyId,
    required this.totalActualMonthlyIncome,
  });

  @override
  List<Object?> get props => [date, incomeMonthlyId, totalActualMonthlyIncome];

  factory IncomeMonthlyNearest.fromJson(Map<String, dynamic> json) {
    return IncomeMonthlyNearest(
      date: json['date'],
      incomeMonthlyId: json['income_monthly_id'],
      totalActualMonthlyIncome: json['Total_actual_monthly_income'],
    );
  }
}

