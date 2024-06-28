import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greethy_application/presentation/helper/injection.dart';
import 'package:greethy_application/presentation/state/appState.dart';
import 'package:greethy_application/presentation/state/authState.dart';
import 'package:greethy_application/presentation/state/nutrition/nutrition_home_screen_state.dart';
import 'package:greethy_application/presentation/state/old_nutrition_state/body_specs_state.dart';
import 'package:greethy_application/presentation/state/old_nutrition_state/drink_plan_state.dart';
import 'package:greethy_application/presentation/state/old_nutrition_state/drink_schedule_group_state.dart';
import 'package:greethy_application/presentation/state/old_nutrition_state/eating_plan_state.dart';
import 'package:greethy_application/presentation/state/old_nutrition_state/eating_schedule_group_state.dart';
import 'package:greethy_application/presentation/state/old_nutrition_state/food_menu_state.dart';
import 'package:greethy_application/presentation/state/old_nutrition_state/food_state.dart';
import 'package:greethy_application/presentation/state/old_nutrition_state/ingredient_state.dart';
import 'package:greethy_application/presentation/state/old_nutrition_state/nutrition_management_state.dart';
import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:greethy_application/presentation/ui/page/common/locator.dart';
import 'package:greethy_application/presentation/ui/page/common/log_debug.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'presentation/ui/page/common/routes.dart';
import 'zdataDev/add_date.dart';

late SharedPreferences sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Greethy_LogDebug("main", "start register dependencies here after start");
  setupDependencies();
  Greethy_LogDebug("main", "start plash screen");
  await initializeDateFormatting('vi_VN');
  await Hive.initFlutter();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>('dataDev');
  sharedPref = await SharedPreferences.getInstance();
  DependencyInjection().init();
  runApp(AppRoot());
}

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return MultiProvider(
      /// Register provider for app
      providers: [
        /// provider of auth
        Provider.value(value: DependencyInjection().signIn),
        Provider.value(value: DependencyInjection().getStatusLogin),
        Provider.value(value: DependencyInjection().signUp),
        Provider.value(value: DependencyInjection().saveStatusLogin),
        ChangeNotifierProvider<AppState>(create: (_) => AppState()),
        ChangeNotifierProvider<AuthState>(
            create: (_) => AuthState(
                  signIn: DependencyInjection().signIn,
                  getStatusLogin: DependencyInjection().getStatusLogin,
                  signUp: DependencyInjection().signUp,
                  saveStatusLogin: DependencyInjection().saveStatusLogin,
                )),

        /// provider of nutrition
        ChangeNotifierProvider<BodySpecsState>(
            create: (_) => BodySpecsState(
                  getBodySpecs: DependencyInjection().getBodySpecs,
                  postBodySpecs: DependencyInjection().postBodySpecs,
                  putBodySpecs: DependencyInjection().putBodySpecs,
                )),
        ChangeNotifierProvider<NutritionManagementState>(
            create: (_) => NutritionManagementState(
                  getNutritionManagement: DependencyInjection().getNutritionManagement,
                  postNutritionManagement: DependencyInjection().postNutritionManagement,
                  putNutritionManagement: DependencyInjection().putNutritionManagement,
                )),
        ChangeNotifierProvider<DrinkPlanState>(
            create: (_) => DrinkPlanState(
                  getDrinkPlan: DependencyInjection().getDrinkPlan,
                  postDrinkPlan: DependencyInjection().postDrinkPlan,
                  putDrinkPlan: DependencyInjection().putDrinkPlan,
                )),
        ChangeNotifierProvider<DrinkScheduleGroupState>(
            create: (_) => DrinkScheduleGroupState(
                  getDrinkScheduleGroup: DependencyInjection().getDrinkScheduleGroup,
                  postDrinkScheduleGroup: DependencyInjection().postDrinkScheduleGroup,
                  putDrinkScheduleGroup: DependencyInjection().putDrinkScheduleGroup,
                )),
        ChangeNotifierProvider<EatingPlanState>(
            create: (_) => EatingPlanState(
                  getEatingPlan: DependencyInjection().getEatingPlan,
                  postEatingPlan: DependencyInjection().postEatingPlan,
                  putEatingPlan: DependencyInjection().putEatingPlan,
                )),
        ChangeNotifierProvider<EatingScheduleGroupState>(
            create: (_) => EatingScheduleGroupState(
                  getEatingScheduleGroup: DependencyInjection().getEatingScheduleGroup,
                  postEatingScheduleGroup: DependencyInjection().postEatingScheduleGroup,
                  putEatingScheduleGroup: DependencyInjection().putEatingScheduleGroup,
                )),
        ChangeNotifierProvider<FoodMenuState>(
            create: (_) => FoodMenuState(
                  getFoodMenu: DependencyInjection().getFoodMenu,
                  postFoodMenu: DependencyInjection().postFoodMenu,
                  putFoodMenu: DependencyInjection().putFoodMenu,
                )),
        ChangeNotifierProvider<FoodState>(
            create: (_) => FoodState(
                  getFood: DependencyInjection().getFood,
                  postFood: DependencyInjection().postFood,
                  putFood: DependencyInjection().putFood,
                )),
        ChangeNotifierProvider<IngredientState>(
            create: (_) => IngredientState(
                  getIngredient: DependencyInjection().getIngredient,
                  postIngredient: DependencyInjection().postIngredient,
                  putIngredient: DependencyInjection().putIngredient,
                )),
        ChangeNotifierProvider<NutritionHomeScreenState>(
            create: (_) => NutritionHomeScreenState(
                  getNutritionManagement: DependencyInjection().getNutritionManagement,
                  postNutritionManagement: DependencyInjection().postNutritionManagement,
                  putNutritionManagement: DependencyInjection().putNutritionManagement,
                  getBodySpecs: DependencyInjection().getBodySpecs,
                  getDrinkPlan: DependencyInjection().getDrinkPlan,
                  postDrinkPlan: DependencyInjection().postDrinkPlan,
                  postIncreaseWater: DependencyInjection().postIncreaseWater,
                  postReduceWater: DependencyInjection().postReduceWater,
                  getEatingPlan: DependencyInjection().getEatingPlan,
                  getEatingScheduleGroup: DependencyInjection().getEatingScheduleGroup,
                  getDrinkScheduleGroup: DependencyInjection().getDrinkScheduleGroup,
                  getFoodMenu: DependencyInjection().getFoodMenu,
                  getFood: DependencyInjection().getFood,
                )),
      ],
      child: MaterialApp(
        title: 'Welcome Greethy',
        theme: AppTheme.appTheme.copyWith(
          textTheme: GoogleFonts.mulishTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
        routes: Routes.route(),
        onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
        onUnknownRoute: (settings) => Routes.onUnknownRoute(settings),
        initialRoute: "SplashPage",
      ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
