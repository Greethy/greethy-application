import 'dart:convert';

import 'package:flutter/services.dart';

import '../../model/finance_model/income_monthly.dart';
import '../appState.dart';

class IncomeMonthlyState extends AppState {
  late String _activeIncomeMonthlyId;

  late IncomeMonthlyModel _incomeMonthlyModel;

  IncomeMonthlyState(this._activeIncomeMonthlyId) {
    databaseInit(_activeIncomeMonthlyId);
  }

  IncomeMonthlyModel get incomeMonthlyModel => _incomeMonthlyModel;

  Future<void> databaseInit(_activeIncomeMonthlyId) async {
    isBusy = true;
    print("IncomeMonthlyState init data from server");
    //
    // todo: init info from server
    //

    String incomeMonthlyModelString = await rootBundle.loadString('assets/database_sample/finance/income_monthly_final.json');
    Map<String, dynamic> incomeMonthlyModelData = json.decode(incomeMonthlyModelString);
    _incomeMonthlyModel = IncomeMonthlyModel.fromJson(incomeMonthlyModelData);
    isBusy = false;
  }
}
