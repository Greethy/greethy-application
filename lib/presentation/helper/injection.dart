/**
 * init use case
 */

import 'package:greethy_application/data/impl/auth_repository_impl.dart';
import 'package:greethy_application/data/impl/body_impl/body_specs_impl.dart';
import 'package:greethy_application/data/impl/nutritional_impl/drink_plan_impl.dart';
import 'package:greethy_application/data/impl/nutritional_impl/drink_schedule_group_impl.dart';
import 'package:greethy_application/data/impl/nutritional_impl/eating_plan_impl.dart';
import 'package:greethy_application/data/impl/nutritional_impl/eating_schedule_group_impl.dart';
import 'package:greethy_application/data/impl/nutritional_impl/food_impl.dart';
import 'package:greethy_application/data/impl/nutritional_impl/food_menu_impl.dart';
import 'package:greethy_application/data/impl/nutritional_impl/ingredient_impl.dart';
import 'package:greethy_application/data/impl/nutritional_impl/nutrition_management_impl.dart';
import 'package:greethy_application/data/source/local/local_storage_user.dart';
import 'package:greethy_application/data/source/network/auth_api.dart';
import 'package:greethy_application/data/source/network/body_api/body_specs_api.dart';
import 'package:greethy_application/data/source/network/nutritional_api/drink_plan_api.dart';
import 'package:greethy_application/data/source/network/nutritional_api/drink_schedule_group_api.dart';
import 'package:greethy_application/data/source/network/nutritional_api/eating_plan_api.dart';
import 'package:greethy_application/data/source/network/nutritional_api/eating_schedule_group_api.dart';
import 'package:greethy_application/data/source/network/nutritional_api/food_api.dart';
import 'package:greethy_application/data/source/network/nutritional_api/food_menu_api.dart';
import 'package:greethy_application/data/source/network/nutritional_api/ingredient_api.dart';
import 'package:greethy_application/data/source/network/nutritional_api/nutritional_management_api.dart';
import 'package:greethy_application/domain/usecase/auth_usercase/get_status_login.dart';
import 'package:greethy_application/domain/usecase/auth_usercase/save_status_login.dart';
import 'package:greethy_application/domain/usecase/auth_usercase/signin.dart';
import 'package:greethy_application/domain/usecase/auth_usercase/signup.dart';
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
import 'package:greethy_application/main.dart';

class DependencyInjection {
  static final DependencyInjection _instance = DependencyInjection._internal();

  factory DependencyInjection() => _instance;

  DependencyInjection._internal() {
    init();
  }

  // use case auth
  static late SignIn _signIn;
  static late GetStatusLogin _getStatusLogin;
  static late SignUp _signUp;
  static late SaveStatusLogin _saveStatusLogin;

  // use case nutrition
  static late GetBodySpecs _GetBodySpecs;
  static late PostBodySpecs _PostBodySpecs;
  static late PutBodySpecs _PutBodySpecs;
  static late GetDrinkPlan _GetDrinkPlan;
  static late PostDrinkPlan _PostDrinkPlan;
  static late PutDrinkPlan _PutDrinkPlan;
  static late PostIncreaseWater _PostIncreaseWater;
  static late PostReduceWater _PostReduceWater;
  static late GetDrinkScheduleGroup _GetDrinkScheduleGroup;
  static late PostDrinkScheduleGroup _PostDrinkScheduleGroup;
  static late PutDrinkScheduleGroup _PutDrinkScheduleGroup;
  static late GetEatingPlan _GetEatingPlan;
  static late PostEatingPlan _PostEatingPlan;
  static late PutEatingPlan _PutEatingPlan;
  static late GetEatingScheduleGroup _GetEatingScheduleGroup;
  static late PostEatingScheduleGroup _PostEatingScheduleGroup;
  static late PutEatingScheduleGroup _PutEatingScheduleGroup;
  static late GetFoodMenu _GetFoodMenu;
  static late PostFoodMenu _PostFoodMenu;
  static late PutFoodMenu _PutFoodMenu;
  static late GetFood _GetFood;
  static late PostFood _PostFood;
  static late PutFood _PutFood;
  static late GetIngredient _GetIngredient;
  static late PostIngredient _PostIngredient;
  static late PutIngredient _PutIngredient;
  static late GetNutritionManagement _GetNutritionManagement;
  static late PostNutritionManagement _PostNutritionManagement;
  static late PutNutritionManagement _PutNutritionManagement;

  SignIn get signIn => _signIn;

  GetStatusLogin get getStatusLogin => _getStatusLogin;

  SignUp get signUp => _signUp;

  SaveStatusLogin get saveStatusLogin => _saveStatusLogin;

  GetBodySpecs get getBodySpecs => _GetBodySpecs;

  PostBodySpecs get postBodySpecs => _PostBodySpecs;

  PutBodySpecs get putBodySpecs => _PutBodySpecs;

  GetDrinkPlan get getDrinkPlan => _GetDrinkPlan;

  PostDrinkPlan get postDrinkPlan => _PostDrinkPlan;

  PutDrinkPlan get putDrinkPlan => _PutDrinkPlan;

  PostIncreaseWater get postIncreaseWater => _PostIncreaseWater;

  PostReduceWater get postReduceWater => _PostReduceWater;

  GetDrinkScheduleGroup get getDrinkScheduleGroup => _GetDrinkScheduleGroup;

  PostDrinkScheduleGroup get postDrinkScheduleGroup => _PostDrinkScheduleGroup;

  PutDrinkScheduleGroup get putDrinkScheduleGroup => _PutDrinkScheduleGroup;

  GetEatingPlan get getEatingPlan => _GetEatingPlan;

  PostEatingPlan get postEatingPlan => _PostEatingPlan;

  PutEatingPlan get putEatingPlan => _PutEatingPlan;

  GetEatingScheduleGroup get getEatingScheduleGroup => _GetEatingScheduleGroup;

  PostEatingScheduleGroup get postEatingScheduleGroup => _PostEatingScheduleGroup;

  PutEatingScheduleGroup get putEatingScheduleGroup => _PutEatingScheduleGroup;

  GetFoodMenu get getFoodMenu => _GetFoodMenu;

  PostFoodMenu get postFoodMenu => _PostFoodMenu;

  PutFoodMenu get putFoodMenu => _PutFoodMenu;

  GetFood get getFood => _GetFood;

  PostFood get postFood => _PostFood;

  PutFood get putFood => _PutFood;

  GetIngredient get getIngredient => _GetIngredient;

  PostIngredient get postIngredient => _PostIngredient;

  PutIngredient get putIngredient => _PutIngredient;

  GetNutritionManagement get getNutritionManagement => _GetNutritionManagement;

  PostNutritionManagement get postNutritionManagement => _PostNutritionManagement;

  PutNutritionManagement get putNutritionManagement => _PutNutritionManagement;

  void init() {
    /// init Auth @{
    final api = AuthApiImpl();
    final localStorage = LocalStorageUserImpl(sharedPreferences: sharedPref);
    final repo = AuthRepositoryImpl(api: api, localStorage: localStorage);
    _signIn = SignIn(repository: repo);
    _getStatusLogin = GetStatusLogin(repository: repo);
    _signUp = SignUp(repository: repo);
    _saveStatusLogin = SaveStatusLogin(repository: repo);

    /// }@

    /// init Nutrition @{
    final BodySpecsApiImpl bodySpecsApi = BodySpecsApiImpl();
    final BodySpecsRepositoryImpl bodySpecsRepo = BodySpecsRepositoryImpl(api: bodySpecsApi);
    _GetBodySpecs = GetBodySpecs(repository: bodySpecsRepo);
    _PostBodySpecs = PostBodySpecs(repository: bodySpecsRepo);
    _PutBodySpecs = PutBodySpecs(repository: bodySpecsRepo);

    final NutritionManagementApiImpl nutritionManagementApi = NutritionManagementApiImpl();
    final NutritionManagementRepositoryImpl nutritionManagementRepo =
        NutritionManagementRepositoryImpl(api: nutritionManagementApi, localStorage: localStorage);
    _GetNutritionManagement = GetNutritionManagement(repository: nutritionManagementRepo);
    _PostNutritionManagement = PostNutritionManagement(repository: nutritionManagementRepo);
    _PutNutritionManagement = PutNutritionManagement(repository: nutritionManagementRepo);

    final DrinkPlanApiImpl dinkPlanApi = DrinkPlanApiImpl();
    final DrinkPlanRepositoryImpl drinkPlanRepo = DrinkPlanRepositoryImpl(api: dinkPlanApi);
    _GetDrinkPlan = GetDrinkPlan(repository: drinkPlanRepo);
    _PostDrinkPlan = PostDrinkPlan(repository: drinkPlanRepo);
    _PutDrinkPlan = PutDrinkPlan(repository: drinkPlanRepo);
    _PostIncreaseWater = PostIncreaseWater(repository: drinkPlanRepo);
    _PostReduceWater = PostReduceWater(repository: drinkPlanRepo);

    final DrinkScheduleGroupApiImpl drinkScheduleGroupApi = DrinkScheduleGroupApiImpl();
    final DrinkScheduleGroupRepositoryImpl drinkScheduleGroupRepo = DrinkScheduleGroupRepositoryImpl(api: drinkScheduleGroupApi);
    _GetDrinkScheduleGroup = GetDrinkScheduleGroup(repository: drinkScheduleGroupRepo);
    _PostDrinkScheduleGroup = PostDrinkScheduleGroup(repository: drinkScheduleGroupRepo);
    _PutDrinkScheduleGroup = PutDrinkScheduleGroup(repository: drinkScheduleGroupRepo);

    final EatingPlanApiImpl eatingPlanApi = EatingPlanApiImpl();
    final EatingPlanRepositoryImpl eatingPlanRepo = EatingPlanRepositoryImpl(api: eatingPlanApi);
    _GetEatingPlan = GetEatingPlan(repository: eatingPlanRepo);
    _PostEatingPlan = PostEatingPlan(repository: eatingPlanRepo);
    _PutEatingPlan = PutEatingPlan(repository: eatingPlanRepo);

    final EatingScheduleGroupApiImpl eatingScheduleGroupApi = EatingScheduleGroupApiImpl();
    final EatingScheduleGroupRepositoryImpl eatingScheduleGroupRepo = EatingScheduleGroupRepositoryImpl(api: eatingScheduleGroupApi);
    _GetEatingScheduleGroup = GetEatingScheduleGroup(repository: eatingScheduleGroupRepo);
    _PostEatingScheduleGroup = PostEatingScheduleGroup(repository: eatingScheduleGroupRepo);
    _PutEatingScheduleGroup = PutEatingScheduleGroup(repository: eatingScheduleGroupRepo);

    final FoodMenuApiImpl foodMenuApi = FoodMenuApiImpl();
    final FoodMenuRepositoryImpl foodMenuRepo = FoodMenuRepositoryImpl(api: foodMenuApi);
    _GetFoodMenu = GetFoodMenu(repository: foodMenuRepo);
    _PostFoodMenu = PostFoodMenu(repository: foodMenuRepo);
    _PutFoodMenu = PutFoodMenu(repository: foodMenuRepo);

    final FoodApiImpl foodApi = FoodApiImpl();
    final FoodRepositoryImpl foodRepo = FoodRepositoryImpl(api: foodApi);
    _GetFood = GetFood(repository: foodRepo);
    _PostFood = PostFood(repository: foodRepo);
    _PutFood = PutFood(repository: foodRepo);

    final IngredientApiImpl ingredientApi = IngredientApiImpl();
    final IngredientRepositoryImpl ingredientRepo = IngredientRepositoryImpl(api: ingredientApi);
    _GetIngredient = GetIngredient(repository: ingredientRepo);
    _PostIngredient = PostIngredient(repository: ingredientRepo);
    _PutIngredient = PutIngredient(repository: ingredientRepo);

    /// }@
  }
}
