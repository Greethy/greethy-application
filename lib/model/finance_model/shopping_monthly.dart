import 'package:equatable/equatable.dart';

class ShoppingMonthlyModel extends Equatable {
  final String id;
  final String time;
  final GroupShopping groupShopping;
  final SpendingPlanMonthly spendingPlanMonthly;
  final List<Shopping> shopping;
  final int totalShoppingMonth;
  final Payment payment;

  ShoppingMonthlyModel({
    required this.id,
    required this.time,
    required this.groupShopping,
    required this.spendingPlanMonthly,
    required this.shopping,
    required this.totalShoppingMonth,
    required this.payment,
  });

  factory ShoppingMonthlyModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> shoppingJson = json['shopping'];
    List<Shopping> shoppingList = shoppingJson.map((shoppingJson) => Shopping.fromJson(shoppingJson)).toList();

    return ShoppingMonthlyModel(
      id: json['id'],
      time: json['time'],
      groupShopping: GroupShopping.fromJson(json['groupShopping']),
      spendingPlanMonthly: SpendingPlanMonthly.fromJson(json['spending_plan_monthly']),
      shopping: shoppingList,
      totalShoppingMonth: json['total_shopping_month'],
      payment: Payment.fromJson(json['payment']),
    );
  }

  @override
  List<Object?> get props => [
        id,
        time,
        groupShopping,
        spendingPlanMonthly,
        shopping,
        totalShoppingMonth,
        payment,
      ];

  @override
  String toString() {
    return 'ShoppingMonthlyModel{id: $id, time: $time, groupShopping: $groupShopping, spendingPlanMonthly: $spendingPlanMonthly, shopping: $shopping, totalShoppingMonth: $totalShoppingMonth, payment: $payment}';
  }
}

class GroupShopping extends Equatable {
  final String id;
  final String type;

  GroupShopping({required this.id, required this.type});

  factory GroupShopping.fromJson(Map<String, dynamic> json) {
    return GroupShopping(
      id: json['id'],
      type: json['type'],
    );
  }

  List<Object?> get props => [
        id,
        type,
      ];

  @override
  String toString() {
    return 'GroupShopping{id: $id, type: $type}';
  }
}

class KindCostOfPlan extends Equatable {
  final String kindId;
  final String kindName;
  final List<String> typeOfKind;

  KindCostOfPlan({
    required this.kindId,
    required this.kindName,
    required this.typeOfKind,
  });

  factory KindCostOfPlan.fromJson(Map<String, dynamic> json) {
    return KindCostOfPlan(
      kindId: json['kind_id'],
      kindName: json['kind_name'],
      typeOfKind: List<String>.from(json['type_of_kind']),
    );
  }

  @override
  List<Object?> get props => [
        kindId,
        kindName,
        typeOfKind,
      ];

  @override
  String toString() {
    return 'KindCostOfPlan{kindId: $kindId, kindName: $kindName, typeOfKind: $typeOfKind}';
  }
}

class SpendingPlanMonthly extends Equatable {
  final String spendingPlanMonthlyId;
  final List<KindCostOfPlan> kindCostOfPlan;

  SpendingPlanMonthly({
    required this.spendingPlanMonthlyId,
    required this.kindCostOfPlan,
  });

  factory SpendingPlanMonthly.fromJson(Map<String, dynamic> json) {
    List<dynamic> kindCostOfPlanJson = json['kind_cost_of_plan'];
    List<KindCostOfPlan> kindCostOfPlanList = kindCostOfPlanJson.map((kindJson) => KindCostOfPlan.fromJson(kindJson)).toList();

    return SpendingPlanMonthly(
      spendingPlanMonthlyId: json['spending_plan_monthly_id'],
      kindCostOfPlan: kindCostOfPlanList,
    );
  }

  @override
  List<Object?> get props => [
        spendingPlanMonthlyId,
        kindCostOfPlan,
      ];

  @override
  String toString() {
    return 'SpendingPlanMonthly{spendingPlanMonthlyId: $spendingPlanMonthlyId, kindCostOfPlan: $kindCostOfPlan}';
  }
}

class Shopping {
  final String time;
  final List<ShoppingItem> shoppingList;
  final int totalShoppingDay;

  Shopping({
    required this.time,
    required this.shoppingList,
    required this.totalShoppingDay,
  });

  factory Shopping.fromJson(Map<String, dynamic> json) {
    return Shopping(
      time: json['time'],
      shoppingList: List<ShoppingItem>.from(json['shoppingList'].map((x) => ShoppingItem.fromJson(x))),
      totalShoppingDay: json['total_shopping_day'],
    );
  }

  @override
  String toString() {
    return 'Shopping{time: $time, shoppingList: $shoppingList, totalShoppingDay: $totalShoppingDay}';
  }
}

class ShoppingItem {
  final String shoppingId;
  final String name;
  final String kindName;

  ShoppingItem({
    required this.shoppingId,
    required this.name,
    required this.kindName
  });

  factory ShoppingItem.fromJson(Map<String, dynamic> json) {
    return ShoppingItem(
      shoppingId: json['shoppingId'],
      name: json['name'],
      kindName: json ['kind_name']
    );
  }

  @override
  String toString() {
    return 'ShoppingItem{shoppingId: $shoppingId, name: $name, kindName: $kindName}';
  }
}

class PaymentDetail extends Equatable {
  final String paymentType;
  final int money;

  PaymentDetail({required this.paymentType, required this.money});

  factory PaymentDetail.fromJson(Map<String, dynamic> json) {
    return PaymentDetail(
      paymentType: json['payment_type'],
      money: json['money'],
    );
  }

  @override
  List<Object?> get props => [paymentType, money];

  @override
  String toString() {
    return 'PaymentDetail{paymentType: $paymentType, money: $money}';
  }
}

class Payment extends Equatable {
  final List<String> paymentTypeList;
  final List<PaymentDetail> paymentDetail;

  Payment({required this.paymentTypeList, required this.paymentDetail});

  factory Payment.fromJson(Map<String, dynamic> json) {
    final List<dynamic> paymentDetailJson = json['payment_detail'];
    final List<PaymentDetail> paymentDetailList = paymentDetailJson.map((paymentDetailJson) => PaymentDetail.fromJson(paymentDetailJson)).toList();

    return Payment(
      paymentTypeList: List<String>.from(json['payment_type_list']),
      paymentDetail: paymentDetailList,
    );
  }

  @override
  List<Object?> get props => [
        paymentTypeList,
        paymentDetail,
      ];

  @override
  String toString() {
    return 'Payment{paymentTypeList: $paymentTypeList, paymentDetail: $paymentDetail}';
  }
}
