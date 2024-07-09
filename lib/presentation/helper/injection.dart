/**
 * init use case
 */

import 'package:greethy_application/data/impl/auth_repository_impl.dart';
import 'package:greethy_application/data/impl/body_impl/body_management_impl.dart';
import 'package:greethy_application/data/impl/body_impl/body_specs_impl.dart';
import 'package:greethy_application/data/impl/nutritional_impl/drink_plan_impl.dart';
import 'package:greethy_application/data/impl/nutritional_impl/drink_schedule_group_impl.dart';
import 'package:greethy_application/data/impl/nutritional_impl/eating_plan_impl.dart';
import 'package:greethy_application/data/impl/nutritional_impl/eating_schedule_group_impl.dart';
import 'package:greethy_application/data/impl/nutritional_impl/food_impl.dart';
import 'package:greethy_application/data/impl/nutritional_impl/food_menu_impl.dart';
import 'package:greethy_application/data/impl/nutritional_impl/ingredient_impl.dart';
import 'package:greethy_application/data/impl/nutritional_impl/nutrition_management_impl.dart';
import 'package:greethy_application/data/impl/user_repository_impl.dart';
import 'package:greethy_application/data/source/local/local_storage_user.dart';
import 'package:greethy_application/data/source/network/auth_api.dart';
import 'package:greethy_application/data/source/network/body_api/body_management_api.dart';
import 'package:greethy_application/data/source/network/body_api/body_specs_api.dart';
import 'package:greethy_application/data/source/network/nutritional_api/drink_plan_api.dart';
import 'package:greethy_application/data/source/network/nutritional_api/drink_schedule_group_api.dart';
import 'package:greethy_application/data/source/network/nutritional_api/eating_plan_api.dart';
import 'package:greethy_application/data/source/network/nutritional_api/eating_schedule_group_api.dart';
import 'package:greethy_application/data/source/network/nutritional_api/food_api.dart';
import 'package:greethy_application/data/source/network/nutritional_api/food_menu_api.dart';
import 'package:greethy_application/data/source/network/nutritional_api/ingredient_api.dart';
import 'package:greethy_application/data/source/network/nutritional_api/nutritional_management_api.dart';
import 'package:greethy_application/data/source/network/user_api/user_api.dart';
import 'package:greethy_application/domain/usecase/auth_usercase/get_status_login.dart';
import 'package:greethy_application/domain/usecase/auth_usercase/save_status_login.dart';
import 'package:greethy_application/domain/usecase/auth_usercase/signin.dart';
import 'package:greethy_application/domain/usecase/auth_usercase/signup.dart';
import 'package:greethy_application/domain/usecase/body_usecase/body_management_usecase/get_body_management.dart';
import 'package:greethy_application/domain/usecase/body_usecase/body_management_usecase/post_body_management.dart';
import 'package:greethy_application/domain/usecase/body_usecase/body_management_usecase/put_body_management.dart';
import 'package:greethy_application/domain/usecase/body_usecase/body_specs_usecase/get_body_specs.dart';
import 'package:greethy_application/domain/usecase/body_usecase/body_specs_usecase/post_body_specs.dart';
import 'package:greethy_application/domain/usecase/body_usecase/body_specs_usecase/put_body_specs.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/drink_plan_usecase/get_drink_plan.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/drink_plan_usecase/post_drink_plan.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/drink_plan_usecase/post_increase_water.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/drink_plan_usecase/post_reduce_water.dart';
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
import 'package:greethy_application/domain/usecase/user_usercase/get_user.dart';
import 'package:greethy_application/domain/usecase/user_usercase/put_user.dart';
import 'package:greethy_application/main.dart';

class DependencyInjection {
  static final DependencyInjection _instance = DependencyInjection._internal();

  factory DependencyInjection() => _instance;

  DependencyInjection._internal() {
    init();
  }

  // use case auth
  static late CaseSignIn _CaseSignIn;
  static late CaseGetStatusLogin _CaseGetStatusLogin;
  static late CaseSignUp _CaseSignUp;
  static late CaseSaveStatusLogin _saveStatusLogin;

  // use case user
  static late CaseGetUser _CaseGetUser;
  static late CasePutUser _CasePutUser;

  // use case body specs
  static late CaseCaseGetBodySpecsManagement _CaseCaseGetBodySpecsManagement;
  static late CaseCasePostBodySpecsManagement _CaseCasePostBodySpecsManagement;
  static late CaseCasePutBodySpecsManagement _CaseCasePutBodySpecsManagement;
  static late CaseGetBodySpecs _CaseGetBodySpecs;
  static late CasePostBodySpecs _CasePostBodySpecs;
  static late CasePutBodySpecs _CasePutBodySpecs;

  // use case nutrition
  static late CaseGetDrinkPlan _CaseGetDrinkPlan;
  static late CasePostDrinkPlan _CasePostDrinkPlan;
  static late CasePutDrinkPlan _CasePutDrinkPlan;
  static late CasePostIncreaseWater _CasePostIncreaseWater;
  static late CasePostReduceWater _CasePostReduceWater;
  static late CaseGetDrinkScheduleGroup _CaseGetDrinkScheduleGroup;
  static late CasePostDrinkScheduleGroup _CasePostDrinkScheduleGroup;
  static late CasePutDrinkScheduleGroup _CasePutDrinkScheduleGroup;
  static late CaseGetEatingPlan _CaseGetEatingPlan;
  static late CasePostEatingPlan _CasePostEatingPlan;
  static late CasePutEatingPlan _CasePutEatingPlan;
  static late CaseGetEatingScheduleGroup _CaseGetEatingScheduleGroup;
  static late CasePostEatingScheduleGroup _CasePostEatingScheduleGroup;
  static late CasePutEatingScheduleGroup _CasePutEatingScheduleGroup;
  static late CaseCaseGetFoodMenu _CaseCaseGetFoodMenu;
  static late CaseCasePostFoodMenu _CaseCasePostFoodMenu;
  static late CaseCasePutFoodMenu _CaseCasePutFoodMenu;
  static late CaseGetFood _CaseGetFood;
  static late CasePostFood _CasePostFood;
  static late CasePutFood _CasePutFood;
  static late CaseGetIngredient _CaseGetIngredient;
  static late CasePostIngredient _CasePostIngredient;
  static late CasePutIngredient _CasePutIngredient;
  static late CaseGetNutritionManagement _CaseGetNutritionManagement;
  static late CasePostNutritionManagement _CasePostNutritionManagement;
  static late CasePutNutritionManagement _CasePutNutritionManagement;

  CaseSignIn get signIn => _CaseSignIn;

  CaseGetStatusLogin get getStatusLogin => _CaseGetStatusLogin;

  CaseSignUp get signUp => _CaseSignUp;

  CaseSaveStatusLogin get saveStatusLogin => _saveStatusLogin;


  CaseGetUser get getUser => _CaseGetUser;

  CasePutUser get putUser => _CasePutUser;


  CaseCaseGetBodySpecsManagement get getBodySpecsManagement => _CaseCaseGetBodySpecsManagement;

  CaseCasePostBodySpecsManagement get postBodySpecsManagement => _CaseCasePostBodySpecsManagement;

  CaseCasePutBodySpecsManagement get putBodySpecsManagement => _CaseCasePutBodySpecsManagement;

  CaseGetBodySpecs get getBodySpecs => _CaseGetBodySpecs;

  CasePostBodySpecs get postBodySpecs => _CasePostBodySpecs;

  CasePutBodySpecs get putBodySpecs => _CasePutBodySpecs;



  CaseGetDrinkPlan get getDrinkPlan => _CaseGetDrinkPlan;

  CasePostDrinkPlan get postDrinkPlan => _CasePostDrinkPlan;

  CasePutDrinkPlan get putDrinkPlan => _CasePutDrinkPlan;

  CasePostIncreaseWater get postIncreaseWater => _CasePostIncreaseWater;

  CasePostReduceWater get postReduceWater => _CasePostReduceWater;

  CaseGetDrinkScheduleGroup get getDrinkScheduleGroup => _CaseGetDrinkScheduleGroup;

  CasePostDrinkScheduleGroup get postDrinkScheduleGroup => _CasePostDrinkScheduleGroup;

  CasePutDrinkScheduleGroup get putDrinkScheduleGroup => _CasePutDrinkScheduleGroup;

  CaseGetEatingPlan get getEatingPlan => _CaseGetEatingPlan;

  CasePostEatingPlan get postEatingPlan => _CasePostEatingPlan;

  CasePutEatingPlan get putEatingPlan => _CasePutEatingPlan;

  CaseGetEatingScheduleGroup get getEatingScheduleGroup => _CaseGetEatingScheduleGroup;

  CasePostEatingScheduleGroup get postEatingScheduleGroup => _CasePostEatingScheduleGroup;

  CasePutEatingScheduleGroup get putEatingScheduleGroup => _CasePutEatingScheduleGroup;

  CaseCaseGetFoodMenu get getFoodMenu => _CaseCaseGetFoodMenu;

  CaseCasePostFoodMenu get postFoodMenu => _CaseCasePostFoodMenu;

  CaseCasePutFoodMenu get putFoodMenu => _CaseCasePutFoodMenu;

  CaseGetFood get getFood => _CaseGetFood;

  CasePostFood get postFood => _CasePostFood;

  CasePutFood get putFood => _CasePutFood;

  CaseGetIngredient get getIngredient => _CaseGetIngredient;

  CasePostIngredient get postIngredient => _CasePostIngredient;

  CasePutIngredient get putIngredient => _CasePutIngredient;

  CaseGetNutritionManagement get getNutritionManagement => _CaseGetNutritionManagement;

  CasePostNutritionManagement get postNutritionManagement => _CasePostNutritionManagement;

  CasePutNutritionManagement get putNutritionManagement => _CasePutNutritionManagement;

  void init() {
    /// init Auth @{
    final api = AuthApiImpl();
    final localStorage = LocalStorageUserImpl(sharedPreferences: sharedPref);
    final repo = AuthRepositoryImpl(api: api, localStorage: localStorage);
    _CaseSignIn = CaseSignIn(repository: repo);
    _CaseGetStatusLogin = CaseGetStatusLogin(repository: repo);
    _CaseSignUp = CaseSignUp(repository: repo);
    _saveStatusLogin = CaseSaveStatusLogin(repository: repo);

    /// }@

    /// init Body Specs @{
    final UserApiImpl userApi = UserApiImpl();
    final UserRepositoryImpl userRepo = UserRepositoryImpl(api: userApi, localStorage: localStorage);
    _CaseGetUser = CaseGetUser(repository: userRepo);
    _CasePutUser = CasePutUser(repository: userRepo);

    /// }@

    /// init Body Specs @{
    final BodySpecsApiImpl bodySpecsApi = BodySpecsApiImpl();
    final BodySpecsRepositoryImpl bodySpecsRepo = BodySpecsRepositoryImpl(api: bodySpecsApi);
    _CaseGetBodySpecs = CaseGetBodySpecs(repository: bodySpecsRepo);
    _CasePostBodySpecs = CasePostBodySpecs(repository: bodySpecsRepo);
    _CasePutBodySpecs = CasePutBodySpecs(repository: bodySpecsRepo);

    final BodySpecsManagementApiImpl bodySpecsManagementApi = BodySpecsManagementApiImpl();
    final BodySpecsManagementRepositoryImpl bodySpecsManagementRepo = BodySpecsManagementRepositoryImpl(
      api: bodySpecsManagementApi,
      localStorage: localStorage,
    );
    _CaseCaseGetBodySpecsManagement = CaseCaseGetBodySpecsManagement(repository: bodySpecsManagementRepo);
    _CaseCasePostBodySpecsManagement = CaseCasePostBodySpecsManagement(repository: bodySpecsManagementRepo);
    _CaseCasePutBodySpecsManagement = CaseCasePutBodySpecsManagement(repository: bodySpecsManagementRepo);

    /// }@

    /// init Nutrition @{
    final NutritionManagementApiImpl nutritionManagementApi = NutritionManagementApiImpl();
    final NutritionManagementRepositoryImpl nutritionManagementRepo = NutritionManagementRepositoryImpl(
      api: nutritionManagementApi,
      localStorage: localStorage,
    );
    _CaseGetNutritionManagement = CaseGetNutritionManagement(repository: nutritionManagementRepo);
    _CasePostNutritionManagement = CasePostNutritionManagement(repository: nutritionManagementRepo);
    _CasePutNutritionManagement = CasePutNutritionManagement(repository: nutritionManagementRepo);

    final DrinkPlanApiImpl dinkPlanApi = DrinkPlanApiImpl();
    final DrinkPlanRepositoryImpl drinkPlanRepo = DrinkPlanRepositoryImpl(api: dinkPlanApi);
    _CaseGetDrinkPlan = CaseGetDrinkPlan(repository: drinkPlanRepo);
    _CasePostDrinkPlan = CasePostDrinkPlan(repository: drinkPlanRepo);
    _CasePutDrinkPlan = CasePutDrinkPlan(repository: drinkPlanRepo);
    _CasePostIncreaseWater = CasePostIncreaseWater(repository: drinkPlanRepo);
    _CasePostReduceWater = CasePostReduceWater(repository: drinkPlanRepo);

    final DrinkScheduleGroupApiImpl drinkScheduleGroupApi = DrinkScheduleGroupApiImpl();
    final DrinkScheduleGroupRepositoryImpl drinkScheduleGroupRepo = DrinkScheduleGroupRepositoryImpl(api: drinkScheduleGroupApi);
    _CaseGetDrinkScheduleGroup = CaseGetDrinkScheduleGroup(repository: drinkScheduleGroupRepo);
    _CasePostDrinkScheduleGroup = CasePostDrinkScheduleGroup(repository: drinkScheduleGroupRepo);
    _CasePutDrinkScheduleGroup = CasePutDrinkScheduleGroup(repository: drinkScheduleGroupRepo);

    final EatingPlanApiImpl eatingPlanApi = EatingPlanApiImpl();
    final EatingPlanRepositoryImpl eatingPlanRepo = EatingPlanRepositoryImpl(api: eatingPlanApi);
    _CaseGetEatingPlan = CaseGetEatingPlan(repository: eatingPlanRepo);
    _CasePostEatingPlan = CasePostEatingPlan(repository: eatingPlanRepo);
    _CasePutEatingPlan = CasePutEatingPlan(repository: eatingPlanRepo);

    final EatingScheduleGroupApiImpl eatingScheduleGroupApi = EatingScheduleGroupApiImpl();
    final EatingScheduleGroupRepositoryImpl eatingScheduleGroupRepo = EatingScheduleGroupRepositoryImpl(api: eatingScheduleGroupApi);
    _CaseGetEatingScheduleGroup = CaseGetEatingScheduleGroup(repository: eatingScheduleGroupRepo);
    _CasePostEatingScheduleGroup = CasePostEatingScheduleGroup(repository: eatingScheduleGroupRepo);
    _CasePutEatingScheduleGroup = CasePutEatingScheduleGroup(repository: eatingScheduleGroupRepo);

    final FoodMenuApiImpl foodMenuApi = FoodMenuApiImpl();
    final FoodMenuRepositoryImpl foodMenuRepo = FoodMenuRepositoryImpl(api: foodMenuApi);
    _CaseCaseGetFoodMenu = CaseCaseGetFoodMenu(repository: foodMenuRepo);
    _CaseCasePostFoodMenu = CaseCasePostFoodMenu(repository: foodMenuRepo);
    _CaseCasePutFoodMenu = CaseCasePutFoodMenu(repository: foodMenuRepo);

    final FoodApiImpl foodApi = FoodApiImpl();
    final FoodRepositoryImpl foodRepo = FoodRepositoryImpl(api: foodApi);
    _CaseGetFood = CaseGetFood(repository: foodRepo);
    _CasePostFood = CasePostFood(repository: foodRepo);
    _CasePutFood = CasePutFood(repository: foodRepo);

    final IngredientApiImpl ingredientApi = IngredientApiImpl();
    final IngredientRepositoryImpl ingredientRepo = IngredientRepositoryImpl(api: ingredientApi);
    _CaseGetIngredient = CaseGetIngredient(repository: ingredientRepo);
    _CasePostIngredient = CasePostIngredient(repository: ingredientRepo);
    _CasePutIngredient = CasePutIngredient(repository: ingredientRepo);

    /// }@
  }
}
