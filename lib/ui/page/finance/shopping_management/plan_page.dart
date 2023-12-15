import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../data/add_date.dart';
import '../../../theme/theme.dart';
import '../local_widget/calender.dart';
import 'bar_chart_month.dart';

class PlanManagementPage extends StatefulWidget {
  const PlanManagementPage() : super();

  @override
  State<PlanManagementPage> createState() => _PlanManagementPageState();
}

class _PlanManagementPageState extends State<PlanManagementPage> {
  var history;
  final box = Hive.box<Add_data>('data');
  final List<String> day = ['Monday', "Tuesday", "Wednesday", "Thursday", 'friday', 'saturday', 'sunday'];

  PageController _pageController = PageController();
  int currentPageIndex = 0;
  int pageCount = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: GreethyColor.kawa_green),
        title: Container(
          padding: EdgeInsetsDirectional.all(5),
          child: Text(
            'SỔ THU CHI',
            style: TextStyle(
              color: GreethyColor.kawa_green,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                if (currentPageIndex < pageCount - 1) {
                  nextPage();
                } else {
                  previousPage();
                }
              });
            },
            child: Container(
              color: GreethyColor.white,
              child: Center(
                child: Text(
                  'Change',
                  style: TextStyle(
                    color: GreethyColor.kawa_green,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: PageView.builder(
        itemCount: pageCount,
        onPageChanged: (value) {
          currentPageIndex = value;
        },
        controller: _pageController,
        itemBuilder: (context, index) {
          if (index == 0) {
            return FinanceCalendar();
          } else {
            return BarChart4();
          }
        },
      ),
    );
  }

  void nextPage() {
    _pageController.animateToPage(_pageController.page!.toInt() + 1, duration: Duration(milliseconds: 1200), curve: Curves.fastOutSlowIn);
  }

  void previousPage() {
    _pageController.animateToPage(_pageController.page!.toInt() - 1, duration: Duration(milliseconds: 1200), curve: Curves.fastOutSlowIn);
  }

  Widget getList(Add_data history, int index) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          history.delete();
        },
        child: get(index, history));
  }

  ListTile get(int index, Add_data history) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset('images/${history.name}.png', height: 40),
      ),
      title: Text(
        history.name,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        '${day[history.datetime.weekday - 1]}  ${history.datetime.year}-${history.datetime.day}-${history.datetime.month}',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.red,
        ),
      ),
      trailing: Text(
        history.amount,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 19,
          color: history.IN == 'Income' ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
