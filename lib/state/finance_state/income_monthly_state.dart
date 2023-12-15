import 'dart:convert';

import 'package:flutter/services.dart';

import '../../model/finance_model/income_monthly.dart';
import '../appState.dart';

class IncomeMonthlyState extends AppState {

  late IncomeMonthlyModel _incomeMonthlyModel;

  IncomeMonthlyModel get incomeMonthlyModel => _incomeMonthlyModel;


  /// state of run IncomeMonthlyState
  bool _isBusy = true;

  bool get isbusy => _isBusy;

  set loading(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  Future<void> databaseInit() async {
    _isBusy = true;
    print("IncomeMonthlyState init data from server");
    //
    // todo: init info from server
    //

    String incomeMonthlyModelString = await rootBundle.loadString('assets/database_sample/finance/income_monthly_final.json');
    Map<String, dynamic> incomeMonthlyModelData = json.decode(incomeMonthlyModelString);
    _incomeMonthlyModel = IncomeMonthlyModel.fromJson(incomeMonthlyModelData);
    _isBusy = false;
  }

}
