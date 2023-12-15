import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:greethy_application/model/finance_model/shopping.dart';

import '../appState.dart';

class ShoppingState extends AppState {
  late ShoppingModel _shoppingModel;

  ShoppingModel get shoppingModel => _shoppingModel;

  databaseInit() async {
    isBusy = true;

    print("------ ShoppingState init data from server ---------");
    //
    // todo: init info from server
    //

    String ShoppingModelString = await rootBundle.loadString('assets/database_sample/finance/shopping.json');
    Map<String, dynamic> ShoppingModelData = json.decode(ShoppingModelString);
    _shoppingModel = ShoppingModel.fromJson(ShoppingModelData);

    isBusy = false;
  }
}
