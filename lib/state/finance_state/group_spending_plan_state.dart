import 'dart:convert';

import 'package:flutter/services.dart';

import '../../model/finance_model/group_spending_plan.dart';
import '../appState.dart';

class GroupSpendingPlanState extends AppState {

  late GroupSpendingPlanModel _groupShoppingPlanModel;

  GroupSpendingPlanModel get groupSpendingPlanModel => _groupShoppingPlanModel;


  /// state of runGroupSpendingPlanState
  bool _isBusy = true;

  bool get isbusy => _isBusy;

  set loading(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  Future<void> databaseInit() async {
    _isBusy = true;
    print("GroupSpendingPlanState init data from server");
    //
    // todo: init info from server
    //

    String groupSpendingPlanString = await rootBundle.loadString('assets/database_sample/finance/group_shopping_plan_final.json');
    Map<String, dynamic> groupSpendingPlanData = json.decode(groupSpendingPlanString);
    _groupShoppingPlanModel = GroupSpendingPlanModel.fromJson(groupSpendingPlanData);
    _isBusy = false;
  }
}
