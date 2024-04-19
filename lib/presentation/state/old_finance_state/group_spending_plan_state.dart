import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../zdataDev/model/finance_model/group_spending_plan.dart';
import '../appState.dart';

class GroupSpendingPlanState extends AppState {

  late GroupSpendingPlanModel _groupShoppingPlanModel;

  GroupSpendingPlanModel get groupSpendingPlanModel => _groupShoppingPlanModel;


  Future<void> databaseInit() async {
    isBusy = true;
    print("GroupSpendingPlanState init dataDev from server");
    //
    // todo: init info from server
    //

    String groupSpendingPlanString = await rootBundle.loadString('assets/database_sample/finance/group_shopping_plan_final.json');
    Map<String, dynamic> groupSpendingPlanData = json.decode(groupSpendingPlanString);
    _groupShoppingPlanModel = GroupSpendingPlanModel.fromJson(groupSpendingPlanData);
    isBusy = false;
  }
}
