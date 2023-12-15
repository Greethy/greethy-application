import 'dart:convert';

import 'package:flutter/services.dart';

import '../../model/finance_model/collective_finance.dart';
import '../../model/finance_model/group_income.dart';
import '../../model/finance_model/group_shopping.dart';
import '../../model/finance_model/group_spending_plan.dart';
import '../appState.dart';

class CollectiveState extends AppState {

  late CollectiveModel _collectiveModel;
  late GroupSpendingPlanModel _groupSpendingPlanModel;
  late GroupShoppingModel _groupShoppingModel;
  late GroupIncomeModel _groupIncomeModel;

  CollectiveModel get collectiveModel => _collectiveModel;

  GroupSpendingPlanModel get groupSpendingPlan => _groupSpendingPlanModel;

  GroupShoppingModel get groupShoppingModel => _groupShoppingModel;

  GroupIncomeModel get groupIncomeModel => _groupIncomeModel;

  /// state of run CollectiveState
  bool _isBusy = true;

  bool get isbusy => _isBusy;

  set loading(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  Future<void> databaseInit() async {
    _isBusy = true;
    print("CollectiveState init data from server");
    //
    // todo: init info from server
    //
    String collectiveString = await rootBundle.loadString('assets/database_sample/finance/collective_final.json');
    Map<String, dynamic> collectiveData = json.decode(collectiveString);
    _collectiveModel = CollectiveModel.fromJson(collectiveData);

    String groupIncomeModelString = await rootBundle.loadString('assets/database_sample/finance/group_income_final.json');
    Map<String, dynamic> groupIncomeModelData = json.decode(groupIncomeModelString);
    _groupIncomeModel = GroupIncomeModel.fromJson(groupIncomeModelData);

    String groupSpendingPlanString = await rootBundle.loadString('assets/database_sample/finance/group_spending_plan_final.json');
    Map<String, dynamic> groupSpendingPlanData = json.decode(groupSpendingPlanString);
    _groupSpendingPlanModel = GroupSpendingPlanModel.fromJson(groupSpendingPlanData);

    String groupShoppingModelString = await rootBundle.loadString('assets/database_sample/finance/group_shopping_final.json');
    Map<String, dynamic> groupShoppingModelData = json.decode(groupShoppingModelString);
    _groupShoppingModel = GroupShoppingModel.fromJson(groupShoppingModelData);
    _isBusy = false;
  }
}
