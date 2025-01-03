import 'dart:convert';

import 'package:flutter/services.dart';
import '../../../zdataDev/model/finance_model/spending_plan_monthly.dart';
import '../appState.dart';

class SpendingPlanMonthlyState extends AppState {

  late SpendingPlanMonthlyModel _spendingPlanMonthlyModel;

  SpendingPlanMonthlyModel get spendingPlanMonthlyModel => _spendingPlanMonthlyModel;

  Future<void> databaseInit() async {
    isBusy = true;
    print("SpendingPlanMonthlyState init dataDev from server");
    //
    // todo: init info from server
    //

    String spendingPlanMonthlyModelString = await rootBundle.loadString('assets/database_sample/finance/spending_plan_monthly_final.json');
    Map<String, dynamic> spendingPlanMonthlyModelData = json.decode(spendingPlanMonthlyModelString);
    _spendingPlanMonthlyModel = SpendingPlanMonthlyModel.fromJson(spendingPlanMonthlyModelData);
    isBusy = false;
  }
}
