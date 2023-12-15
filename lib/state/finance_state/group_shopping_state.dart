import 'dart:convert';

import 'package:flutter/services.dart';

import '../../model/finance_model/group_shopping.dart';
import '../appState.dart';

class GroupShoppingState extends AppState {

  late GroupShoppingModel _groupShoppingModel;

  GroupShoppingModel get groupShoppingModel => _groupShoppingModel;

  /// state of run GroupShoppingState
  bool _isBusy = true;

  bool get isbusy => _isBusy;

  set loading(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  Future<void> databaseInit() async {
    _isBusy = true;
    print("GroupShoppingState init data from server");
    //
    // todo: init info from server
    //

    String groupShoppingModelString = await rootBundle.loadString('assets/database_sample/finance/group_shopping_final.json');
    Map<String, dynamic> groupShoppingModelData = json.decode(groupShoppingModelString);
    _groupShoppingModel = GroupShoppingModel.fromJson(groupShoppingModelData);
    _isBusy = false;
  }
}
