import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:greethy_application/model/finance_model/kind_cost.dart';

import '../appState.dart';

class KindCostState extends AppState {
  late KindCostModel _kindCostModel;

  KindCostModel get kindCostModel => _kindCostModel;

  /// state of run KindCostState
  bool _isBusy = true;

  bool get isbusy => _isBusy;

  set loading(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  databaseInit() async {
    _isBusy = true;

    print("------ KindCostState init data from server ---------");
    //
    // todo: init info from server
    //

    String KindCostModelString = await rootBundle.loadString('assets/database_sample/finance/Kind_cost_final.json');
    Map<String, dynamic> KindCostModelData = json.decode(KindCostModelString);
    _kindCostModel = KindCostModel.fromJson(KindCostModelData);

    _isBusy = false;
  }
}
