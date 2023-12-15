import 'dart:convert';

import 'package:flutter/services.dart';

import '../../model/finance_model/shopping_monthly.dart';
import '../appState.dart';
import '../date_state.dart';

class ShoppingMonthlyState extends AppState {
  Ds<ShoppingMonthlyModel> dsShoppingMonthlyModel = Loading<ShoppingMonthlyModel>();

  Future<void> fetchData() async {
    try {
      _isBusy = true;

      print("------ ShoppingMonthlyState init data from server ---------");
      //
      // todo: init info from server
      //

      String shoppingMonthlyModelString = await rootBundle.loadString('assets/database_sample/finance/shopping_monthly_final.json');
      Map<String, dynamic> shoppingMonthlyModelData = json.decode(shoppingMonthlyModelString);
      _lastShoppingMonthlyModel = ShoppingMonthlyModel.fromJson(shoppingMonthlyModelData);

      Map<DateTime, List<ShoppingItem>> shoppingItemMap = {};
      for (var shopping in _lastShoppingMonthlyModel.shopping) {
        DateTime shoppingTime = DateTime.parse(shopping.time);
        if (!shoppingItemMap.containsKey(shoppingTime)) {
          shoppingItemMap[shoppingTime] = [];
        }
        shoppingItemMap[shoppingTime]?.addAll(shopping.shoppingList);
      }

      _kShoppingItemSource = shoppingItemMap;

      dsShoppingMonthlyModel = Fetched(ShoppingMonthlyModel.fromJson(shoppingMonthlyModelData));
    } catch (e) {
      dsShoppingMonthlyModel = Failed(e);
    }
    _isBusy = false;
  }

  void setLoading() {
    dsShoppingMonthlyModel = Loading();
  }

  void setFailed() {
    dsShoppingMonthlyModel = Failed('Something went wrong');
  }

  final kToday = DateTime.now();
  late final kFirstDay;
  late final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

  Map<DateTime, List<ShoppingItem>> _kShoppingItemSource = {};

  Map<DateTime, List<ShoppingItem>> get kShoppingItemSource => _kShoppingItemSource;

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  late ShoppingMonthlyModel _shoppingMonthlyModel;

  ShoppingMonthlyModel get shoppingMonthlyModel => _shoppingMonthlyModel;

  late ShoppingMonthlyModel _lastShoppingMonthlyModel;

  ShoppingMonthlyModel get lastShoppingMonthlyModel => _lastShoppingMonthlyModel;

  /// state of run ShoppingMonthlyState
  bool _isBusy = true;

  bool get isbusy => _isBusy;

  set loading(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  databaseInit() async {
    _isBusy = true;

    print("------ ShoppingMonthlyState init data from server ---------");
    //
    // todo: init info from server
    //

    String shoppingMonthlyModelString = await rootBundle.loadString('assets/database_sample/finance/shopping_monthly_final.json');
    Map<String, dynamic> shoppingMonthlyModelData = json.decode(shoppingMonthlyModelString);
    _lastShoppingMonthlyModel = ShoppingMonthlyModel.fromJson(shoppingMonthlyModelData);

    Map<DateTime, List<ShoppingItem>> shoppingItemMap = {};
    for (var shopping in _lastShoppingMonthlyModel.shopping) {
      DateTime shoppingTime = DateTime.parse(shopping.time);
      if (!shoppingItemMap.containsKey(shoppingTime)) {
        shoppingItemMap[shoppingTime] = [];
      }
      shoppingItemMap[shoppingTime]?.addAll(shopping.shoppingList);
    }

    _kShoppingItemSource = shoppingItemMap;

    _isBusy = false;
  }

// Future<void> initShoppingItemSource(int month) async {
//   //
//   // todo: init info from server
//   //
//   String shoppingMonthlyModelString = await rootBundle.loadString('assets/database_sample/finance/shopping_monthly_final2.json');
//   Map<String, dynamic> shoppingMonthlyModelData = json.decode(shoppingMonthlyModelString);
//   _shoppingMonthlyModel = ShoppingMonthlyModel.fromJson(shoppingMonthlyModelData);
//
//   Map<DateTime, List<ShoppingItem>> shoppingItemMap = {};
//
//   for (var shopping in _shoppingMonthlyModel.shopping) {
//     DateTime shoppingTime = DateTime.parse(shopping.time);
//     if (!shoppingItemMap.containsKey(shoppingTime)) {
//       shoppingItemMap[shoppingTime] = [];
//     }
//     shoppingItemMap[shoppingTime]?.addAll(shopping.shoppingList);
//   }
//   _kShoppingItemSource.addAll(shoppingItemMap);
// }
}
