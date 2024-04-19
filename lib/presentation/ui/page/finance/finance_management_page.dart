import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/state/old_finance_state/group_income_state.dart';
import 'package:greethy_application/presentation/state/old_finance_state/group_shopping_state.dart';
import 'package:greethy_application/presentation/state/old_finance_state/group_spending_plan_state.dart';
import 'package:greethy_application/presentation/state/old_finance_state/income_monthly_state.dart';
import 'package:greethy_application/presentation/state/old_finance_state/kind_cost_state.dart';
import 'package:greethy_application/presentation/ui/page/finance/shopping_management/plan_page.dart';
import 'package:provider/provider.dart';

import 'package:greethy_application/presentation/state/old_finance_state/collective_state.dart';
import 'package:greethy_application/presentation/state/old_finance_state/finance_management_state.dart';
import 'package:greethy_application/presentation/state/old_finance_state/shopping_monthly_state.dart';
import 'package:greethy_application/presentation/state/old_finance_state/shopping_state.dart';
import 'package:greethy_application/presentation/state/old_finance_state/spending_plan_monthly_state.dart';
import 'package:greethy_application/presentation/theme/theme.dart';
import '../common/error_indicator.dart';
import 'add/add_page.dart';
import 'income _management/income_page.dart';

List screen = [
  IncomeManagementPage(),
  PlanManagementPage(),
  PlanManagementPage(),
  IncomeManagementPage(),
];

class FinanceManagementPage extends StatefulWidget {
  const FinanceManagementPage({Key? key, required this.financeManagementId}) : super(key: key);

  final String financeManagementId;

  static MaterialPageRoute getRoute({required String financeManagementId}) {
    return MaterialPageRoute(
      builder: (_) => Provider(
        create: (_) => FinanceManagementState(financeManagementId),
        child: ChangeNotifierProvider(
          create: (BuildContext context) => FinanceManagementState(financeManagementId),
          builder: (_, child) => FinanceManagementPage(
            financeManagementId: financeManagementId,
          ),
        ),
      ),
    );
  }

  @override
  State<FinanceManagementPage> createState() => _Finance();
}

class _Finance extends State<FinanceManagementPage> {
  int index_screen = 0;

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<FinanceManagementState>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Builder(builder: (BuildContext context) {
          final financialManagement = state.dsFinancialManagementModel;
          return state.dsFinancialManagementModel.onState(
            fetched: (value) => _buildView(),
            failed: (e) => ErrorIndicator(e),
            loading: () => const CircularProgressIndicator(),
          );
        }),
      ),
    );
  }

  Widget _buildView() {
    var state = Provider.of<FinanceManagementState>(context, listen: false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ShoppingMonthlyState>(create: (_) => ShoppingMonthlyState(state.shoppingMonthlyCurrentId)),
        ChangeNotifierProvider<SpendingPlanMonthlyState>(create: (_) => SpendingPlanMonthlyState()),
        ChangeNotifierProvider<ShoppingState>(create: (_) => ShoppingState()),
        ChangeNotifierProvider<IncomeMonthlyState>(create: (_) => IncomeMonthlyState(state.incomeMonthlyCurrentId)),
        ChangeNotifierProvider<CollectiveState>(create: (_) => CollectiveState()),
        ChangeNotifierProvider<GroupSpendingPlanState>(create: (_) => GroupSpendingPlanState()),
        ChangeNotifierProvider<GroupShoppingState>(create: (_) => GroupShoppingState()),
        ChangeNotifierProvider<GroupIncomeState>(create: (_) => GroupIncomeState()),
        ChangeNotifierProvider<KindCostState>(
          create: (_) => KindCostState(),
        )
      ],
      child: Scaffold(
        body: screen[index_screen],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              AddScreen.getRoute(
                activeIncomeMonthlyId: state.incomeMonthlyCurrentId,
                activeShoppingMonthlyId: state.shoppingMonthlyCurrentId,
              ),
            );
          },
          child: Icon(Icons.add),
          backgroundColor: GreethyColor.kawa_green,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Padding(
            padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index_screen = 0;
                    });
                  },
                  child: Icon(
                    Icons.home,
                    size: 30,
                    color: index_screen == 0 ? GreethyColor.kawa_green : Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index_screen = 1;
                    });
                  },
                  child: Icon(
                    Icons.bar_chart_outlined,
                    size: 30,
                    color: index_screen == 1 ? GreethyColor.kawa_green : Colors.grey,
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index_screen = 2;
                    });
                  },
                  child: Icon(
                    Icons.account_balance_wallet_outlined,
                    size: 30,
                    color: index_screen == 2 ? GreethyColor.kawa_green : Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index_screen = 3;
                    });
                  },
                  child: Icon(
                    Icons.person_outlined,
                    size: 30,
                    color: index_screen == 3 ? GreethyColor.kawa_green : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
