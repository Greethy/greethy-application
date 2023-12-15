import 'dart:convert';

import 'package:flutter/services.dart';
import '../../model/finance_model/spending_plan_monthly.dart';
import '../appState.dart';

class SpendingPlanMonthlyState extends AppState {

  late SpendingPlanMonthlyModel _spendingPlanMonthlyModel;

  SpendingPlanMonthlyModel get spendingPlanMonthlyModel => _spendingPlanMonthlyModel;

  /// state of run spendingPlanMonthlyState
  bool _isBusy = true;

  bool get isbusy => _isBusy;

  set loading(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  Future<void> databaseInit() async {
    _isBusy = true;
    print("SpendingPlanMonthlyState init data from server");
    //
    // todo: init info from server
    //

    String spendingPlanMonthlyModelString = await rootBundle.loadString('assets/database_sample/finance/spending_plan_monthly_final.json');
    Map<String, dynamic> spendingPlanMonthlyModelData = json.decode(spendingPlanMonthlyModelString);
    _spendingPlanMonthlyModel = SpendingPlanMonthlyModel.fromJson(spendingPlanMonthlyModelData);
    _isBusy = false;
  }
}
