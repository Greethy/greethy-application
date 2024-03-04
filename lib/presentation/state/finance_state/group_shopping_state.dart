import 'dart:convert';

import 'package:flutter/services.dart';

import '../../model/finance_model/group_shopping.dart';
import '../appState.dart';

class GroupShoppingState extends AppState {

  late GroupShoppingModel _groupShoppingModel;

  GroupShoppingModel get groupShoppingModel => _groupShoppingModel;

  Future<void> databaseInit() async {
    isBusy = true;
    print("GroupShoppingState init dataDev from server");
    //
    // todo: init info from server
    //

    String groupShoppingModelString = await rootBundle.loadString('assets/database_sample/finance/group_shopping_final.json');
    Map<String, dynamic> groupShoppingModelData = json.decode(groupShoppingModelString);
    _groupShoppingModel = GroupShoppingModel.fromJson(groupShoppingModelData);
    isBusy = false;
  }
}
