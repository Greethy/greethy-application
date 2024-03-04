import 'dart:convert';

import 'package:flutter/services.dart';

import '../../model/finance_model/shopping_monthly.dart';
import '../appState.dart';
import '../date_state.dart';

class ShoppingMonthlyState extends AppState {
  late String _activeShoppingMonthlyId;
  late List<List<String>> _mapKindCost;
  late ShoppingMonthlyModel _shoppingMonthlyModel;
  late ShoppingMonthlyModel _lastShoppingMonthlyModel;
  late Map<DateTime, List<ShoppingItem>> _kShoppingItemSource;

  Map<DateTime, List<ShoppingItem>> get kShoppingItemSource => _kShoppingItemSource;

  List<List<String>> get mapKindCost => _mapKindCost;

  ShoppingMonthlyModel get shoppingMonthlyModel => _shoppingMonthlyModel;

  ShoppingMonthlyModel get lastShoppingMonthlyModel => _lastShoppingMonthlyModel;

  Ds<ShoppingMonthlyModel> dsShoppingMonthlyModel = Loading<ShoppingMonthlyModel>();

  ShoppingMonthlyState(this._activeShoppingMonthlyId) {
    fetchShoppingMonthlyModelData(_activeShoppingMonthlyId);
  }

  Future<void> fetchShoppingMonthlyModelData(String _activeShoppingMonthlyId) async {
    try {
      isBusy = true;

      print("------ ShoppingMonthlyState init dataDev from server ---------");
      //
      // todo: init info from server
      //
      String shoppingMonthlyModelString = await rootBundle.loadString('assets/database_sample/finance/shopping_monthly_final.json');
      Map<String, dynamic> shoppingMonthlyModelData = json.decode(shoppingMonthlyModelString);
      _lastShoppingMonthlyModel = ShoppingMonthlyModel.fromJson(shoppingMonthlyModelData);

      _kShoppingItemSource = createShoppingItemMap(_lastShoppingMonthlyModel);
      _mapKindCost = createListMapKindCost(_lastShoppingMonthlyModel.spendingPlanMonthly.kindCostOfPlan);

      dsShoppingMonthlyModel = Fetched(ShoppingMonthlyModel.fromJson(shoppingMonthlyModelData));
    } catch (e) {
      dsShoppingMonthlyModel = Failed(e);
    }
    isBusy = false;
  }

  void setLoading() {
    dsShoppingMonthlyModel = Loading();
  }

  void setFailed() {
    dsShoppingMonthlyModel = Failed('Something went wrong');
  }

  Map<DateTime, List<ShoppingItem>> createShoppingItemMap(ShoppingMonthlyModel model) {
    Map<DateTime, List<ShoppingItem>> shoppingItemMap = {};
    for (var shopping in _lastShoppingMonthlyModel.shopping) {
      DateTime shoppingTime = DateTime.parse(shopping.time);
      if (!shoppingItemMap.containsKey(shoppingTime)) {
        shoppingItemMap[shoppingTime] = [];
      }
      shoppingItemMap[shoppingTime]?.addAll(shopping.shoppingList);
    }
    return shoppingItemMap;
  }

  List<List<String>> createListMapKindCost(List<KindCostOfPlan> kindCostOfPlanList) {
    List<List<String>> result = [];

    for (var kindCostOfPlan in kindCostOfPlanList) {
      List<String> typeOfKindList = kindCostOfPlan.typeOfKind;
      result.add(typeOfKindList);
    }

    return result;
  }

  databaseInit() async {
    isBusy = true;

    print("------ ShoppingMonthlyState init dataDev from server ---------");
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

    isBusy = false;
  }
}
