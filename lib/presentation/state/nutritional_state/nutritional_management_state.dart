import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:greethy_application/data/dto/nutrition_dto/nutrition_management_dto.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/nutrition_management.dart';
import '../appState.dart';

class NutritionManagementState extends AppState {

  late NutritionManagement _nutritionManagementModel;

  NutritionManagement get nutritionManagementModel => _nutritionManagementModel;
  

  /// state of run NutritionManagementState
  Future<void> databaseInit() async {
    isBusy = true;
    print("NutritionManagementState init dataDev from server");
    //
    // todo: init info from server
    //
    String groupShoppingModelString = await rootBundle.loadString('assets/database_sample/finance/group_shopping_final.json');
    _nutritionManagementModel = NutritionManagementDto.fromRawJson(groupShoppingModelString);
    isBusy = false;
  }
}
