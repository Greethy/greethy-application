import 'package:flutter/material.dart';
import 'package:greethy_application/data/impl/nutritional_impl/body_specs_impl.dart';
import 'package:greethy_application/data/source/network/nutritional_api/body_specs_api.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/body_specs_usecase/get_body_specs.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/body_specs_usecase/post_body_specs.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/body_specs_usecase/put_body_specs.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/drink_plan_usecase/get_drink_plan.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/drink_plan_usecase/post_drink_plan.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/drink_plan_usecase/put_drink_plan.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/drink_schedule_group_usecase/get_drink_schedule_group.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/drink_schedule_group_usecase/post_drink_schedule_group.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/drink_schedule_group_usecase/put_drink_schedule_group.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/eating_plan_usecase/get_eating_plan.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/eating_plan_usecase/post_eating%20plan.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/eating_plan_usecase/put_eating_plan.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/eating_schedule_group_usecase/get_eating_schedule_group.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/eating_schedule_group_usecase/post_eating_schedule_group.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/eating_schedule_group_usecase/put_eating_schedule_group.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/food_menu_usecase/get_food_menu.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/food_menu_usecase/post_food_menu.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/food_menu_usecase/put_food_menu.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/food_usecase/get_food.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/food_usecase/post_food.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/food_usecase/put_food.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/ingredient_usecase/get_ingredient.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/ingredient_usecase/post_ingredient.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/ingredient_usecase/put_ingredient.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/nutrition_management_usecase/get_nutrition_management.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/nutrition_management_usecase/post_nutrition_management.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/nutrition_management_usecase/put_nutrition_management.dart';
import 'package:greethy_application/presentation/state/nutrition_state/body_specs_state.dart';
import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/body_specs_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/glass_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/meals_list_today_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/nutritional_specs_view.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/water_view.dart';
import 'package:greethy_application/presentation/widgets/title_view.dart';
import 'package:provider/provider.dart';

class MyDiaryScreen extends StatefulWidget {
  const MyDiaryScreen({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;

  @override
  _MyDiaryScreenState createState() => _MyDiaryScreenState();
}

class _MyDiaryScreenState extends State<MyDiaryScreen> with TickerProviderStateMixin {
  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  // init use case
  late GetBodySpecs _GetBodySpecs;
  late PostBodySpecs _PostBodySpecs;
  late PutBodySpecs _PutBodySpecs;
  late GetDrinkPlan _GetDrinkPlan;
  late PostDrinkPlan _PostDrinkPlan;
  late PutDrinkPlan _PutDrinkPlan;
  late GetDrinkScheduleGroup _GetDrinkScheduleGroup;
  late PostDrinkScheduleGroup _PostDrinkScheduleGroup;
  late PutDrinkScheduleGroup _PutDrinkScheduleGroup;
  late GetEatingPlan _GetEatingPlan;
  late PostEatingPlan _PostEatingPla;
  late PutEatingPlan _PutEatingPlan;
  late GetEatingScheduleGroup _GetEatingScheduleGroup;
  late PostEatingScheduleGroup _PostEatingScheduleGroup;
  late PutEatingScheduleGroup _PutEatingScheduleGroup;
  late GetFoodMenu _GetFoodMenu;
  late PostFoodMenu _PostFoodMenu;
  late PutFoodMenu _PutFoodMenu;
  late GetFood _GetFood;
  late PostFood _PostFood;
  late PutFood _PutFood;
  late GetIngredient _GetIngredient;
  late PostIngredient _PostIngredient;
  late PutIngredient _PutIngredient;
  late GetNutritionManagement _GetNutritionManagement;
  late PostNutritionManagement _PostNutritionManagement;
  late PutNutritionManagement _PutNutritionManagement;

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: widget.animationController!,
      curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn),
    ));
    addAllListData();

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

    final BodySpecsApiImpl bodySpecsApi = BodySpecsApiImpl();
    final BodySpecsRepositoryImpl bodySpecsRepo = BodySpecsRepositoryImpl(api: bodySpecsApi);
    _GetBodySpecs = GetBodySpecs(repository: bodySpecsRepo);
    _PostBodySpecs = PostBodySpecs(repository: bodySpecsRepo);
    _PutBodySpecs = PutBodySpecs(repository: bodySpecsRepo);
  }

  void addAllListData() {
    const int count = 9;
    listViews.add(
      TitleView(
        titleTxt: 'Nutritional Specs',
        subTxt: 'Details',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: widget.animationController!,
          curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn),
        )),
        animationController: widget.animationController!,
      ),
    );
    listViews.add(
      NutritionalSpecsView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: widget.animationController!,
          curve: Interval((1 / count) * 1, 1.0, curve: Curves.fastOutSlowIn),
        )),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      TitleView(
        titleTxt: 'Meals today',
        subTxt: 'Customize',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: widget.animationController!,
          curve: Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn),
        )),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      MealsListTodayView(
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: widget.animationController!,
          curve: Interval((1 / count) * 3, 1.0, curve: Curves.fastOutSlowIn),
        )),
        mainScreenAnimationController: widget.animationController,
      ),
    );

    listViews.add(
      TitleView(
        titleTxt: 'Body Specs',
        subTxt: 'Today',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: widget.animationController!,
          curve: Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn),
        )),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      BodySpecsView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: widget.animationController!,
          curve: Interval((1 / count) * 5, 1.0, curve: Curves.fastOutSlowIn),
        )),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      TitleView(
        titleTxt: 'Water',
        subTxt: 'Aqua SmartBottle',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: widget.animationController!,
          curve: Interval((1 / count) * 6, 1.0, curve: Curves.fastOutSlowIn),
        )),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      WaterView(
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: widget.animationController!,
          curve: Interval((1 / count) * 7, 1.0, curve: Curves.fastOutSlowIn),
        )),
        mainScreenAnimationController: widget.animationController!,
      ),
    );
    listViews.add(
      GlassView(
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve: Interval((1 / count) * 8, 1.0, curve: Curves.fastOutSlowIn),
          )),
          animationController: widget.animationController!),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      /// Register provider for app
      providers: [
        Provider.value(value: _GetBodySpecs),
        Provider.value(value: _PostBodySpecs),
        Provider.value(value: _PutBodySpecs),
        // Provider.value(value: _GetDrinkPlan),
        // Provider.value(value: _PostDrinkPlan),
        // Provider.value(value: _PutDrinkPlan),
        // Provider.value(value: _GetDrinkScheduleGroup),
        // Provider.value(value: _PostDrinkScheduleGroup),
        // Provider.value(value: _PutDrinkScheduleGroup),
        // Provider.value(value: _GetEatingPlan),
        // Provider.value(value: _PostEatingPla),
        // Provider.value(value: _PutEatingPlan),
        // Provider.value(value: _GetEatingScheduleGroup),
        // Provider.value(value: _PostEatingScheduleGroup),
        // Provider.value(value: _PutEatingScheduleGroup),
        // Provider.value(value: _GetFoodMenu),
        // Provider.value(value: _PostFoodMenu),
        // Provider.value(value: _PutFoodMenu),
        // Provider.value(value: _GetFood),
        // Provider.value(value: _PostFood),
        // Provider.value(value: _PutFood),
        // Provider.value(value: _GetIngredient),
        // Provider.value(value: _PostIngredient),
        // Provider.value(value: _PutIngredient),
        // Provider.value(value: _GetNutritionManagement),
        // Provider.value(value: _PostNutritionManagement),
        // Provider.value(value: _PutNutritionManagement),
        ChangeNotifierProvider<BodySpecsState>(
            create: (_) => BodySpecsState(
                  getBodySpecs: _GetBodySpecs,
                  postBodySpecs: _PostBodySpecs,
                  putBodySpecs: _PutBodySpecs,
                )),
      ],
      child: Container(
        color: AppTheme.background,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: <Widget>[
              getMainListViewUI(),
              getAppBarUI(),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height + MediaQuery.of(context).padding.top + 24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController?.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController!,
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
                                child: Text(
                                  'Dinh dưỡng',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontName,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22 + 6 - 6 * topBarOpacity,
                                    letterSpacing: 1.2,
                                    color: AppTheme.darkerText,
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
                                  print("lam lich hoat dong");
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
                                onTap: () {},
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
