import 'package:flutter/material.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/food_menu.dart';
import 'package:greethy_application/presentation/state/food_screen_state.dart';
import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/eating_menu_screen/custom_divider_meal_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/eating_menu_screen/food_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/food_menu_screen/custom_divider_food_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/nutrition_home_detail/menu/menu_screen.dart';
import 'package:provider/provider.dart';

class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({
    Key? key,
    required this.foodId,
  }) : super(key: key);

  final String foodId;

  static MaterialPageRoute getRoute({required String foodId}) {
    return MaterialPageRoute(
      builder: (_) => Provider(
        create: (_) => FoodScreenState(foodId: foodId),
        child: ChangeNotifierProvider(
          create: (BuildContext context) => FoodScreenState(foodId: foodId),
          builder: (_, child) => FoodDetailScreen(
            foodId: foodId,
          ),
        ),
      ),
    );
  }

  @override
  _FoodDetailScreenState createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> with TickerProviderStateMixin {
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
    var state = Provider.of<FoodScreenState>(context, listen: false);
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
    var state = Provider.of<FoodScreenState>(context, listen: false);
    listViews = [];

    listViews.add(
      CustomDividerFoodView(
        dividerHeight: 35,
        text: "aaaaaaaaaaaa",
      ),
    );
  }

  Future<bool> getData(FoodScreenState state) async {
    await state.initDatabase();
    addAllListData();
    await Future<dynamic>.delayed(const Duration(milliseconds: 2000));
    return true;
  }

  Widget getMainListViewUI(FoodScreenState state) {
    return Consumer<FoodScreenState>(
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
                            SizedBox(
                              height: 38,
                              width: 38,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_back_ios_sharp,
                                    color: AppTheme.grey,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Home diary',
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
                              ),
                            ),
                            SizedBox(
                              height: 38,
                              width: 38,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                                onTap: () {
                                  print("thả tim");
                                },
                                child: Center(
                                  child: Icon(
                                    Icons.heart_broken,
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
