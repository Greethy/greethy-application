import 'package:flutter/material.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/food_menu.dart';
import 'package:greethy_application/presentation/helper/ui_helper.dart';
import 'package:greethy_application/presentation/state/nutrition/eating_menu_screen_state.dart';
import 'package:greethy_application/presentation/theme/app_colors.dart';
import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/eating_menu_screen/widget/custom_divider_meal_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/eating_menu_screen/widget/food_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/eating_menu_screen/widget/information_owner_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/eating_menu_screen/widget/quote_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/eating_menu_screen/widget/total_nutrition_per_day_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/search_food_screen/search_food_all_menu.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/widget/footnote_view.dart';
import 'package:greethy_application/test_library/test%20restaurant%20ui/nutrition_home_detail/menu/offers/offer_banner_view.dart';
import 'package:intl/intl.dart';
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

  String time = DateFormat('d MMM').format(DateTime.now());

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
            getAppBarUI(state),
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
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
              child: Container(
                width: 10.0,
                height: 140.0,
                color: menuGreen,
              ),
            ),
            UIHelper.horizontalSpaceMedium(),
            Flexible(
              child: Column(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headlineMedium,
                      children: [
                        TextSpan(text: 'Hành trình chăm sóc sức khỏe dinh dưỡng cùng '),
                        TextSpan(text: 'Greethy.', style: TextStyle(color: GreethyColor.kawa_green)),
                      ],
                    ),
                  ),
                  UIHelper.verticalSpaceSmall(),
                  Text(
                    'Chăm sóc sức khỏe dinh dưỡng của bản thân là một yếu tố quan trọng để duy trì sức khỏe tốt và cải thiện chất lượng cuộc sống.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 16.0,
                          color: Colors.grey[800],
                        ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );

    listViews.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 5.0),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, SearchListScreen.getRoute());
                },
                child: Container(
                  height: 170.0,
                  color: menuGreen,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: FractionallySizedBox(
                          widthFactor: 0.7,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Menu',
                                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
                                ),
                                UIHelper.verticalSpaceSmall(),
                                Text(
                                  'Sổ tay ẩm thực dinh dưỡng, đồng hành cùng bạn.',
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 45.0,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        color: darkGreen,
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Tra cứu',
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white, fontSize: 18.0),
                            ),
                            UIHelper.horizontalSpaceSmall(),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 18.0,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -10.0,
              right: -10.0,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/food1.jpg',
                  width: 130.0,
                  height: 130.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    listViews.add(
      OfferBannerView(),
    );

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
          dividerHeight: 40,
          text: "BỮA SÁNG",
          meal: state.breakfast,
          state: state,
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
          dividerHeight: 40,
          text: "BỮA PHỤ SÁNG",
          meal: state.morningSnack,
          state: state,
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
          dividerHeight: 40,
          text: "BỮA TRƯA",
          meal: state.lunch,
          state: state,
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
          dividerHeight: 40,
          text: "BỮA PHỤ CHIỀU",
          meal: state.afternoonSnack,
          state: state,
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
          dividerHeight: 40,
          text: "BỮA TỐI",
          meal: state.dinner,
          state: state,
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

  Widget getAppBarUI(EatingMenuScreenState state) {
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
                      bottomRight: Radius.circular(32.0),
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
                                onTap: () async {
                                  print("mui ten ben trái");

                                  time = DateFormat('d MMM').format(DateTime.now().subtract(Duration(days: 1)));

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Xem thực đơn ngày: ' + time),
                                      backgroundColor: GreethyColor.kawa_green,
                                    ),
                                  );
                                  await state.initDatabase2();
                                  setState(() {
                                    getData(state);
                                  });

                                  // add to test
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => const NutritionHomeManagementScreen(),
                                  //   ),
                                  // );
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
                                    time,
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
