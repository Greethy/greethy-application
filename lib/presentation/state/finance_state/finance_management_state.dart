import 'dart:convert';

import 'package:flutter/services.dart';

import '../../model/finance_model/financial_management.dart';
import '../../model/finance_model/group_income.dart';
import '../../model/finance_model/group_shopping.dart';
import '../../model/finance_model/group_spending_plan.dart';
import '../appState.dart';
import '../date_state.dart';

class FinanceManagementState extends AppState {
  final String financeManagement_id;

  late String incomeMonthlyCurrentId;
  late String shoppingMonthlyCurrentId;
  late String spendingPlanMonthlyCurrentId;

  late FinancialManagementModel _financialManagementModel;
  late GroupIncomeModel _groupIncomeModel;
  late GroupSpendingPlanModel _groupSpendingPlanModel;
  late GroupShoppingModel _groupShoppingModel;

  FinancialManagementModel get financialManagementModel => _financialManagementModel;

  GroupSpendingPlanModel get groupSpendingPlan => _groupSpendingPlanModel;

  GroupShoppingModel get groupShoppingModel => _groupShoppingModel;

  GroupIncomeModel get groupIncomeModel => _groupIncomeModel;

  FinanceManagementState(this.financeManagement_id) {
    fetchFinancialManagementModelData(financeManagement_id);
  }

  Ds<FinancialManagementModel> dsFinancialManagementModel = Loading<FinancialManagementModel>();
  

  Future<void> fetchFinancialManagementModelData(String _activeShoppingMonthlyId) async {
    try {
      isBusy = true;

      print("FinanceManagementState init dataDev from server");
      //
      // todo: init info from server
      //
      String financialManagementString = await rootBundle.loadString('assets/database_sample/finance/financial_management_final.json');
      Map<String, dynamic> financialManagementData = json.decode(financialManagementString);
      _financialManagementModel = FinancialManagementModel.fromJson(financialManagementData);

      incomeMonthlyCurrentId = _financialManagementModel.managePersonalFinance.incomes.activeIncomeMonthlyId;
      shoppingMonthlyCurrentId = _financialManagementModel.managePersonalFinance.shopping.activeShoppingMonthlyId;
      spendingPlanMonthlyCurrentId = _financialManagementModel.managePersonalFinance.spendingPlans.activeSpendingPlanMonthlyId;

      dsFinancialManagementModel = Fetched(FinancialManagementModel.fromJson(financialManagementData));

      String groupIncomeModelString = await rootBundle.loadString('assets/database_sample/finance/group_income_final.json');
      Map<String, dynamic> groupIncomeModelData = json.decode(groupIncomeModelString);
      _groupIncomeModel = GroupIncomeModel.fromJson(groupIncomeModelData);

      String groupSpendingPlanString = await rootBundle.loadString('assets/database_sample/finance/group_spending_plan_final.json');
      Map<String, dynamic> groupSpendingPlanData = json.decode(groupSpendingPlanString);
      _groupSpendingPlanModel = GroupSpendingPlanModel.fromJson(groupSpendingPlanData);

      String groupShoppingModelString = await rootBundle.loadString('assets/database_sample/finance/group_shopping_final.json');
      Map<String, dynamic> groupShoppingModelData = json.decode(groupShoppingModelString);
      _groupShoppingModel = GroupShoppingModel.fromJson(groupShoppingModelData);

    } catch (e) {
      dsFinancialManagementModel = Failed(e);
    }
    isBusy = false;
  }

  void setLoading() {
    dsFinancialManagementModel = Loading();
  }

  void setFailed() {
    dsFinancialManagementModel = Failed('Something went wrong');
  }

}
