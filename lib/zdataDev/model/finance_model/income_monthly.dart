import 'package:equatable/equatable.dart';

class IncomeMonthlyModel extends Equatable {
  final String id;
  final String type;
  final List<Income> incomes;
  final List<int> spendingPlanMonthlyList;

  IncomeMonthlyModel({
    required this.id,
    required this.type,
    required this.incomes,
    required this.spendingPlanMonthlyList,
  });

  @override
  List<Object?> get props => [id, type, incomes, spendingPlanMonthlyList];

  factory IncomeMonthlyModel.fromJson(Map<String, dynamic> json) {
    final incomeList = (json['income'] as List<dynamic>).map((item) => Income.fromJson(item)).toList();
    final spendingPlanMonthlyList = (json['spending_plan_monthly_list'] as List<dynamic>).cast<int>().toList();

    return IncomeMonthlyModel(
      id: json['id'],
      type: json['type'],
      incomes: incomeList,
      spendingPlanMonthlyList: spendingPlanMonthlyList,
    );
  }
}

class User extends Equatable {
  final String nickname;
  final String userId;

  User({
    required this.nickname,
    required this.userId,
  });

  @override
  List<Object?> get props => [nickname, userId];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nickname: json['nickname'],
      userId: json['user_id'],
    );
  }
}

class Income extends Equatable {
  final String incomeName;
  final User user;
  final int projectedMonthlyIncome;
  final int actualMonthlyIncome;
  final int difference;

  Income({
    required this.incomeName,
    required this.user,
    required this.projectedMonthlyIncome,
    required this.actualMonthlyIncome,
    required this.difference,
  });

  @override
  List<Object?> get props => [incomeName, user, projectedMonthlyIncome, actualMonthlyIncome, difference];

  factory Income.fromJson(Map<String, dynamic> json) {
    return Income(
      incomeName: json['income_name'],
      user: User.fromJson(json['user']),
      projectedMonthlyIncome: json['projected_monthly_income'],
      actualMonthlyIncome: json['actual_monthly_income'],
      difference: json['difference'],
    );
  }
}
