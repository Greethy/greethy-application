import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:greethy_application/model/finance_model/shopping.dart';

import '../appState.dart';

class ShoppingState extends AppState {
  late ShoppingModel _shoppingModel;

  ShoppingModel get shoppingModel => _shoppingModel;

  /// state of run ShoppingState
  bool _isBusy = true;

  bool get isbusy => _isBusy;

  set loading(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  databaseInit() async {
    _isBusy = true;

    print("------ ShoppingState init data from server ---------");
    //
    // todo: init info from server
    //

    String ShoppingModelString = await rootBundle.loadString('assets/database_sample/finance/shopping.json');
    Map<String, dynamic> ShoppingModelData = json.decode(ShoppingModelString);
    _shoppingModel = ShoppingModel.fromJson(ShoppingModelData);

    _isBusy = false;
  }
}
