import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/state/user/authState.dart';
import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:greethy_application/presentation/ui/page/body_specs/body_specs_input_screen.dart';
import 'package:greethy_application/presentation/ui/page/character/action_navigation_view/action_bar_view.dart';
import 'package:greethy_application/presentation/ui/page/common/splash.dart';
import 'package:greethy_application/presentation/ui/page/finance/finance_management_page.dart';
import 'package:greethy_application/presentation/ui/page/flare_character/ami.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/eating_menu_screen/menu_diary_screen.dart';
import 'package:greethy_application/presentation/ui/page/plays/plays_page.dart';
import 'package:greethy_application/presentation/ui/page/profile/profile_page_screen.dart';
import 'package:greethy_application/zdataDev/tabIcon_data.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController? animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[3].isSelected = true;

    animationController = AnimationController(duration: const Duration(milliseconds: 600), vsync: this);

    // add to tes
    // tabBody = MyNutritionDiaryScreen(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: AppTheme.background,
      //   image: DecorationImage(
      //     image: AssetImage('assets/background.jpg'),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    top: 30,
                    left: 0,
                    right: 0,
                    child: appBar(),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Ami(),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 10,
                    child: actionBar(),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget actionBar() {
    var state = Provider.of<AuthState>(context, listen: false);
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        ActionBarView(
          tabIconsList: tabIconsList,
          // addClick: () {
          //   Navigator.push(context, MaterialPageRoute(builder: (context) => FeedScreen()));
          // },
          changeIndex: (int index) {
            if (index == 0) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                String getFinanceManagement = state.getFinanceManagement();
                Navigator.push(context, FinanceManagementPage.getRoute(financeManagementId: getFinanceManagement));
              });
            } else if (index == 2) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                Navigator.push(context, MenuDiaryScreen.getRoute(foodMenuId: '1'));
              });
            } else if (index == 1) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                // setState(() {
                //   tabBody = TrainingScreen(animationController: animationController);
                // });
              });
            } else if (index == 3) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  // tabBody = NavigationApp();
                });
              });
            }
          },
        ),
      ],
    );
  }

  Widget appBar() {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    size: 30,
                    Icons.info_outline,
                    color: GreethyColor.kawa_green,
                  ),
                  onTap: () {
                    Navigator.push(context, BodySpecsInputScreen.getRoute());
                  },
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'GREETHY',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: '',
                      color: GreethyColor.kawa_green,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    size: 30,
                    Icons.accessibility_new_outlined,
                    color: GreethyColor.kawa_green,
                  ),
                  onTap: () {
                    Navigator.push(context, ProfilePage.getRoute(profileId: ''));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
