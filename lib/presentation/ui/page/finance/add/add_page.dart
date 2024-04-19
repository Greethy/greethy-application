import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/state/old_finance_state/income_monthly_state.dart';
import 'package:greethy_application/presentation/state/old_finance_state/shopping_monthly_state.dart';
import 'package:greethy_application/presentation/state/old_finance_state/shopping_state.dart';
import 'package:provider/provider.dart';

import 'package:greethy_application/presentation/theme/theme.dart';
import 'add_pageview_income.dart';
import 'add_pageview_shopping.dart';

class AddScreen extends StatefulWidget {
  AddScreen({Key? key, required this.activeIncomeMonthlyId, required this.activeShoppingMonthlyId}) : super(key: key);

  final String activeIncomeMonthlyId;
  final String activeShoppingMonthlyId;

  static MaterialPageRoute getRoute({required String activeIncomeMonthlyId, required String activeShoppingMonthlyId}) {
    return MaterialPageRoute(
      builder: (_) => MultiProvider(
        providers: [
          ChangeNotifierProvider<ShoppingMonthlyState>(create: (_) => ShoppingMonthlyState(activeShoppingMonthlyId)),
          ChangeNotifierProvider<ShoppingState>(create: (_) => ShoppingState()),
          ChangeNotifierProvider<IncomeMonthlyState>(create: (_) => IncomeMonthlyState(activeIncomeMonthlyId)),
        ],
        child: AddScreen(activeShoppingMonthlyId: activeShoppingMonthlyId, activeIncomeMonthlyId: activeIncomeMonthlyId),
      ),
    );
  }

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  int currentPageIndex = 0;
  late PageController _pageController = PageController(initialPage: currentPageIndex);

  int pageCount = 2;

  String textBanner = "Chi tiêu";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          background_container(context),
          Positioned(
            top: 120,
            child: main_container(),
          ),
        ],
      ),
    );
  }

  Widget main_container() {
    return Container(
      width: MediaQuery.of(context).size.width * 7 / 8,
      height: MediaQuery.of(context).size.height * 7 / 8 - 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: PageView.builder(
          itemCount: pageCount,
          onPageChanged: (value) {
            currentPageIndex = value;
            if (value == 0) {
              setState(() {
                textBanner = "Chi tiêu";
              });
            } else {
              setState(() {
                textBanner = "Thu nhập";
              });
            }
          },
          controller: _pageController,
          itemBuilder: (context, index) {
            if (index == 0) {
              return AddShoppingScreen();
            } else {
              return AddIncomeScreen();
            }
          },
        ),
      ),
    );
  }

  void nextPage() {
    _pageController.animateToPage(
      _pageController.page!.toInt() + 1,
      duration: Duration(milliseconds: 1200),
      curve: Curves.fastOutSlowIn,
    );
  }

  void previousPage() {
    _pageController.animateToPage(
      _pageController.page!.toInt() - 1,
      duration: Duration(milliseconds: 1200),
      curve: Curves.fastOutSlowIn,
    );
  }

  Column background_container(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration(
            color: GreethyColor.kawa_green,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 25),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (currentPageIndex < pageCount - 1) {
                              nextPage();
                            } else {
                              previousPage();
                            }
                          });
                        },
                        child: Text(
                          textBanner,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      currentPageIndex == 0
                          ? Icon(
                              Icons.attach_file_outlined,
                              color: Colors.white,
                            )
                          : Icon(
                              Icons.money,
                              color: Colors.white,
                            ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
