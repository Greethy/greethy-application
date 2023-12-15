import 'dart:convert';

import 'package:flutter/services.dart';

import '../../model/finance_model/group_income.dart';
import '../appState.dart';

class GroupIncomeState extends AppState {

  late GroupIncomeModel _groupIncomeModel;

  GroupIncomeModel get groupIncomeModel => _groupIncomeModel;


  /// state of run groupIncomeState
  bool _isBusy = true;

  bool get isbusy => _isBusy;

  set loading(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  Future<void> databaseInit() async {
    _isBusy = true;
    print("GroupIncomeState init data from server");
    //
    // todo: init info from server
    //

    String groupIncomeModelString = await rootBundle.loadString('assets/database_sample/finance/group_income_final.json');
    Map<String, dynamic> groupIncomeModelData = json.decode(groupIncomeModelString);
    _groupIncomeModel = GroupIncomeModel.fromJson(groupIncomeModelData);
    _isBusy = false;
  }
}
