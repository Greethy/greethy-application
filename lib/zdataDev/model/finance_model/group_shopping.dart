import 'package:equatable/equatable.dart';

class GroupShoppingModel extends Equatable {
  final String id;
  final String type;
  final List<ShoppingMonthlyNearest> shoppingMonthlyNearest;
  final List<String> shoppingMonthlyList;

  GroupShoppingModel({
    required this.id,
    required this.type,
    required this.shoppingMonthlyNearest,
    required this.shoppingMonthlyList,
  });

  @override
  List<Object?> get props => [id, type, shoppingMonthlyNearest, shoppingMonthlyList];

  factory GroupShoppingModel.fromJson(Map<String, dynamic> json) {
    final shoppingMonthlyNearestList = json['shopping_monthly_nearest'] as List<dynamic>;
    final shoppingMonthlyList = json['shopping_monthly_list'] as List<dynamic>;

    final nearestList = shoppingMonthlyNearestList
        .map((item) => ShoppingMonthlyNearest.fromJson(item))
        .toList();

    final shoppingList = shoppingMonthlyList.cast<String>().toList();

    return GroupShoppingModel(
      id: json['id'],
      type: json['type'],
      shoppingMonthlyNearest: nearestList,
      shoppingMonthlyList: shoppingList,
    );
  }
}

class ShoppingMonthlyNearest extends Equatable {
  final String date;
  final String shoppingMonthlyId;
  final int totalShopping;

  ShoppingMonthlyNearest({
    required this.date,
    required this.shoppingMonthlyId,
    required this.totalShopping,
  });

  @override
  List<Object?> get props => [date, shoppingMonthlyId, totalShopping];

  factory ShoppingMonthlyNearest.fromJson(Map<String, dynamic> json) {
    return ShoppingMonthlyNearest(
      date: json['date'],
      shoppingMonthlyId: json['shopping_monthly_id'],
      totalShopping: json['total_shopping'],
    );
  }
}