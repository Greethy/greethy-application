import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greethy_application/data/impl/nutritional_impl/body_specs_impl.dart';
import 'package:greethy_application/data/impl/nutritional_impl/nutrition_management_impl.dart';
import 'package:greethy_application/data/source/network/nutritional_api/body_specs_api.dart';
import 'package:greethy_application/data/source/network/nutritional_api/nutritional_management_api.dart';
import 'package:greethy_application/domain/usecase/auth_usercase/signup.dart';
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
import 'package:greethy_application/presentation/state/appState.dart';
import 'package:greethy_application/presentation/state/authState.dart';
import 'package:greethy_application/presentation/state/nutrition_state/body_specs_state.dart';
import 'package:greethy_application/presentation/state/nutrition_state/nutrition_management_state.dart';
import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:greethy_application/presentation/ui/page/common/locator.dart';
import 'package:greethy_application/presentation/ui/page/common/log_debug.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/impl/auth_repository_impl.dart';
import 'data/source/local/local_storage_user.dart';
import 'data/source/network/auth_api.dart';
import 'domain/usecase/auth_usercase/get_status_login.dart';
import 'domain/usecase/auth_usercase/save_status_login.dart';
import 'domain/usecase/auth_usercase/signin.dart';
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

  runApp(AppRoot());
}

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  late SignIn _signIn;
  late GetStatusLogin _getStatusLogin;
  late SignUp _signUp;
  late SaveStatusLogin _saveStatusLogin;

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
    super.initState();
    // Notice:
    //
    // Some state management packages are also D.I. (Dependency Injection)
    // solutions. To avoid polluting this example with unnecessary repetition,
    // we're creating the object instances here and passing them as parameters
    // to each state management's "root" widgets. Then we'll use the library's
    // specific D.I. widget to make the instance accessible to the rest of the
    // widget tree.
    //
    final api = AuthApiImpl();
    final localStorage = LocalStorageUserImpl(sharedPreferences: sharedPref);
    final repo = AuthRepositoryImpl(api: api, localStorage: localStorage);
    _signIn = SignIn(repository: repo);
    _getStatusLogin = GetStatusLogin(repository: repo);
    _signUp = SignUp(repository: repo);
    _saveStatusLogin = SaveStatusLogin(repository: repo);

    final BodySpecsApiImpl bodySpecsApi = BodySpecsApiImpl();
    final BodySpecsRepositoryImpl bodySpecsRepo = BodySpecsRepositoryImpl(api: bodySpecsApi);
    _GetBodySpecs = GetBodySpecs(repository: bodySpecsRepo);
    _PostBodySpecs = PostBodySpecs(repository: bodySpecsRepo);
    _PutBodySpecs = PutBodySpecs(repository: bodySpecsRepo);

    final NutritionManagementApiImpl nutritionManagementApi = NutritionManagementApiImpl();
    final NutritionManagementRepositoryImpl nutritionManagementRepo = NutritionManagementRepositoryImpl(api: nutritionManagementApi, localStorage: localStorage);
    _GetNutritionManagement = GetNutritionManagement(repository: nutritionManagementRepo);
    _PostNutritionManagement = PostNutritionManagement(repository: nutritionManagementRepo);
    _PutNutritionManagement = PutNutritionManagement(repository: nutritionManagementRepo);
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
        Provider.value(value: _signIn),
        Provider.value(value: _getStatusLogin),
        Provider.value(value: _signUp),
        Provider.value(value: _saveStatusLogin),
        ChangeNotifierProvider<AppState>(create: (_) => AppState()),
        ChangeNotifierProvider<AuthState>(create: (_) => AuthState(signIn: _signIn, getStatusLogin: _getStatusLogin, signUp: _signUp, saveStatusLogin: _saveStatusLogin)),
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
        Provider.value(value: _GetNutritionManagement),
        Provider.value(value: _PostNutritionManagement),
        Provider.value(value: _PutNutritionManagement),
        ChangeNotifierProvider<BodySpecsState>(
            create: (_) => BodySpecsState(
                  getBodySpecs: _GetBodySpecs,
                  postBodySpecs: _PostBodySpecs,
                  putBodySpecs: _PutBodySpecs,
                )),
        ChangeNotifierProvider<NutritionManagementState>(
            create: (_) => NutritionManagementState(
                  getNutritionManagement: _GetNutritionManagement,
                  postNutritionManagement: _PostNutritionManagement,
                  putNutritionManagement: _PutNutritionManagement,
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
