import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:greethy_application/zdataDev/model/finance_model/kind_cost.dart';

import '../appState.dart';

class KindCostState extends AppState {
  late KindCostModel _kindCostModel;

  KindCostModel get kindCostModel => _kindCostModel;

  databaseInit() async {
    isBusy = true;

    print("------ KindCostState init dataDev from server ---------");
    //
    // todo: init info from server
    //

    String KindCostModelString = await rootBundle.loadString('assets/database_sample/finance/Kind_cost_final.json');
    Map<String, dynamic> KindCostModelData = json.decode(KindCostModelString);
    _kindCostModel = KindCostModel.fromJson(KindCostModelData);

    isBusy = false;
  }
}
