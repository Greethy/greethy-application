import 'package:flutter/material.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/food_menu.dart';
import 'package:greethy_application/presentation/state/eating_menu_screen_state.dart';
import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/eating_menu_screen/widget/custom_divider_meal_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/eating_menu_screen/widget/food_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/eating_menu_screen/widget/information_owner_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/eating_menu_screen/widget/quote_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/eating_menu_screen/widget/total_nutrition_per_day_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/widget/footnote_view.dart';
import 'package:greethy_application/test_library/test%20restaurant%20ui/nutrition_home_detail/menu/menu_screen.dart';
import 'package:provider/provider.dart';

class MenuDiaryScreen extends StatefulWidget {
  const MenuDiaryScreen({
    Key? key,
    required this.foodMenuId,
  }) : super(key: key);

  final String foodMenuId;

  static MaterialPageRoute getRoute({required String foodMenuId}) {
    return MaterialPageRoute(
      builder: (_) => Provider(
        create: (_) => EatingMenuScreenState(foodMenuId: foodMenuId),
        child: ChangeNotifierProvider(
          create: (BuildContext context) => EatingMenuScreenState(foodMenuId: foodMenuId),
          builder: (_, child) => MenuDiaryScreen(
            foodMenuId: foodMenuId,
          ),
        ),
      ),
    );
  }

  @override
  _MenuDiaryScreenState createState() => _MenuDiaryScreenState();
}

class _MenuDiaryScreenState extends State<MenuDiaryScreen> with TickerProviderStateMixin {
  AnimationController? animationController;

  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;
  final int count = 9;

  @override
  void initState() {
    animationController = AnimationController(duration: const Duration(milliseconds: 600), vsync: this);
    // animation view page
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController!,
      curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn),
    ));

    // scroll listener
    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 && scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<EatingMenuScreenState>(context, listen: false);
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(state),
            getAppBarUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Future<void> addAllListData() async {
    var state = Provider.of<EatingMenuScreenState>(context, listen: false);
    listViews = [];

    listViews.add(
      InformationOwner(
        state: state,
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animationController!,
            curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn),
          ),
        ),
        animationController: animationController!,
      ),
    );

    listViews.add(
      TotalNutritionPerDay(
        titleTxt: "Tổng dinh dưỡng theo ngày",
        state: state,
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animationController!,
            curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn),
          ),
        ),
        animationController: animationController!,
      ),
    );

    if (state.breakfast != null) {
      listViews.add(
        CustomDividerMealView(
          dividerHeight: 35,
          text: "BỮA SÁNG",
          meal: state.breakfast,
        ),
      );

      for (FoodIndex food in state.foodIndexBreakfast) {
        listViews.add(
          FoodView(
            foodInfo: food,
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animationController!,
                curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn),
              ),
            ),
            animationController: animationController!,
          ),
        );
      }
    }

    if (state.morningSnack != null) {
      listViews.add(
        CustomDividerMealView(
          dividerHeight: 35,
          text: "BỮA PHỤ SÁNG",
          meal: state.morningSnack,
        ),
      );

      for (FoodIndex food in state.foodIndexSnackMorning) {
        listViews.add(
          FoodView(
            foodInfo: food,
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animationController!,
                curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn),
              ),
            ),
            animationController: animationController!,
          ),
        );
      }
    }

    if (state.lunch != null) {
      listViews.add(
        CustomDividerMealView(
          dividerHeight: 35,
          text: "BỮA TRƯA",
          meal: state.lunch,
        ),
      );

      for (FoodIndex food in state.foodIndexLunch) {
        listViews.add(
          FoodView(
            foodInfo: food,
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animationController!,
                curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn),
              ),
            ),
            animationController: animationController!,
          ),
        );
      }
    }

    if (state.afternoonSnack != null) {
      listViews.add(
        CustomDividerMealView(
          dividerHeight: 35,
          text: "BỮA PHỤ CHIỀU",
          meal: state.afternoonSnack,
        ),
      );

      for (FoodIndex food in state.foodIndexSnackAfternoon) {
        listViews.add(
          FoodView(
            foodInfo: food,
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animationController!,
                curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn),
              ),
            ),
            animationController: animationController!,
          ),
        );
      }
    }

    if (state.dinner != null) {
      listViews.add(
        CustomDividerMealView(
          dividerHeight: 35,
          text: "BỮA TỐI",
          meal: state.dinner,
        ),
      );

      for (FoodIndex food in state.foodIndexDinner) {
        listViews.add(
          FoodView(
            foodInfo: food,
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animationController!,
                curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn),
              ),
            ),
            animationController: animationController!,
          ),
        );
      }
    }

    listViews.add(
      QuoteScreen(),
    );

    listViews.add(
      FootnoteView(),
    );
  }

  Future<bool> getData(EatingMenuScreenState state) async {
    await state.initDatabase();
    addAllListData();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget getMainListViewUI(EatingMenuScreenState state) {
    return Consumer<EatingMenuScreenState>(
      builder: (context, state, _) {
        return FutureBuilder<bool>(
          future: getData(state),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return ListView.builder(
                controller: scrollController,
                padding: EdgeInsets.only(
                  top: AppBar().preferredSize.height + MediaQuery.of(context).padding.top + 30,
                  bottom: 62 + MediaQuery.of(context).padding.bottom,
                ),
                itemCount: listViews.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  animationController?.forward();
                  return listViews[index];
                },
              );
            }
          },
        );
      },
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: topBarAnimation!,
              child: Transform(
                transform: Matrix4.translationValues(0.0, 30 * (1.0 - topBarAnimation!.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: AppTheme.grey.withOpacity(0.4 * topBarOpacity),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 16 - 8.0 * topBarOpacity,
                          bottom: 12 - 8.0 * topBarOpacity,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Eating Plan',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontName,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 5 + 6 - 6 * topBarOpacity,
                                        letterSpacing: 1.2,
                                        color: GreethyColor.kawa_green,
                                      ),
                                    ),
                                    Text(
                                      'Menu Diary',
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily: AppTheme.fontName,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22 + 6 - 6 * topBarOpacity,
                                        letterSpacing: 1.2,
                                        color: GreethyColor.kawa_green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 38,
                              width: 38,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                                onTap: () {
                                  print("mui ten ben trái");
                                  // add to test
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const NutritionHomeManagementScreen(),
                                    ),
                                  );
                                },
                                child: Center(
                                  child: Icon(
                                    Icons.keyboard_arrow_left,
                                    color: AppTheme.grey,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                              ),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Icon(
                                      Icons.calendar_today,
                                      color: AppTheme.grey,
                                      size: 18,
                                    ),
                                  ),
                                  Text(
                                    '15 May',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: AppTheme.fontName,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      letterSpacing: -0.2,
                                      color: AppTheme.darkerText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 38,
                              width: 38,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                                onTap: () {
                                  print("mui ten ben phải");
                                },
                                child: Center(
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: AppTheme.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
