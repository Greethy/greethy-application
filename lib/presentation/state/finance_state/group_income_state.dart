import 'dart:convert';

import 'package:flutter/services.dart';

import '../../model/finance_model/group_income.dart';
import '../appState.dart';

class GroupIncomeState extends AppState {

  late GroupIncomeModel _groupIncomeModel;

  GroupIncomeModel get groupIncomeModel => _groupIncomeModel;

  Future<void> databaseInit() async {
    isBusy = true;
    print("GroupIncomeState init dataDev from server");
    //
    // todo: init info from server
    //

    String groupIncomeModelString = await rootBundle.loadString('assets/database_sample/finance/group_income_final.json');
    Map<String, dynamic> groupIncomeModelData = json.decode(groupIncomeModelString);
    _groupIncomeModel = GroupIncomeModel.fromJson(groupIncomeModelData);
    isBusy = false;
  }
}
