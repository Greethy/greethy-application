import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/state/nutrition/food_screen_state.dart';
import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/eating_menu_screen/widget/quote_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/food_screen/widget/cooking_instructions_food_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/food_screen/widget/cooking_recipe_table_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/food_screen/widget/custom_divider_food_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/food_screen/widget/custom_divider_kcal_total_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/food_screen/widget/custom_divider_nutrition_detail_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/food_screen/widget/nutrition_table_detail_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/food_screen/widget/food_img_list_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/food_screen/widget/unit_conversion_table_of_ingredients_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/food_screen/widget/youtube_video_widget.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/widget/custom_divider_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/widget/footnote_view.dart';
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
    var state = Provider.of<FoodScreenState>(context, listen: false);
    listViews = [];

    listViews.add(
      CustomDividerFoodView(
        dividerHeight: 40,
        state: state,
      ),
    );

    listViews.add(
      FoodImageListView(
        state: state,
      ),
    );

    listViews.add(
      CustomDividerNutritionDetailView(
        dividerHeight: 40,
        state: state,
      ),
    );

    listViews.add(
      NutritionFoodTable(
        state: state,
      ),
    );

    listViews.add(
      CustomDividerKcalTotalView(
        dividerHeight: 40,
        state: state,
      ),
    );

    listViews.add(
      IngredientsFoodTable(
        state: state,
      ),
    );

    listViews.add(
      UnitConversionTableOfIngredientsView(
        dividerHeight: 40,
      ),
    );

    listViews.add(
      CustomDividerView(
        dividerHeight: 40,
        text: "HƯỚNG DẪN THỰC HIỆN",
      ),
    );

    listViews.add(
      CookingInstructionsFoodView(
        state: state,
      ),
    );

    listViews.add(
      CustomDividerView(
        dividerHeight: 40,
        text: "VIDEO HƯỚNG DẪN",
      ),
    );

    listViews.add(
      YouTubeVideoWidget(
        state: state,
      ),
    );

    listViews.add(
      QuoteScreen(),
    );

    listViews.add(
      FootnoteView(),
    );
  }

  Future<bool> getData(FoodScreenState state) async {
    await state.initDatabase();
    addAllListData();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
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

  Widget getAppBarUI(FoodScreenState state) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animationController!,
          child: Transform(
            transform: Matrix4.translationValues(0.0, 30 * (1.0 - animationController!.value), 0.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: GreethyColor.kawa_green,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: SafeArea(child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                          color: AppTheme.white,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "GREETHY FOOD",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
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
                          color: AppTheme.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),)

            ),
          ),
        );
      },
    );
  }
}
