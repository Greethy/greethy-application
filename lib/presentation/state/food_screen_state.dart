import 'package:greethy_application/domain/entities/nutrition_entities/drink_shedule_group.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/eating_plan.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/eating_shedule_group.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/food.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/food_menu.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/nutrition_management.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/eating_plan_usecase/get_eating_plan.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/eating_schedule_group_usecase/get_eating_schedule_group.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/food_menu_usecase/get_food_menu.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/food_usecase/get_food.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/nutrition_management_usecase/get_nutrition_management.dart';
import 'package:greethy_application/presentation/helper/injection.dart';
import 'package:greethy_application/presentation/state/appState.dart';
import 'package:greethy_application/presentation/ui/page/nutritional/nutrition_home_screen/widget/meals_card.dart';

class FoodScreenState extends AppState {
  FoodScreenState({
    required String foodId,
  }) : _foodId = foodId {
    // initDatabase();
  }

  // ---------------------------------------------------------------------------
  // required
  // ---------------------------------------------------------------------------

  final String _foodId;

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------
  
  final GetFood _getFood = DependencyInjection().getFood;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  // init database status
  bool initData = false;
  

  // food menu @{

  late Food? _food;

  Food? get food => _food;
  

  // }@

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  /// init data
  Future<bool> initDatabase() async {
    print( "chunhthandhe " + initData.toString());
    if (initData == true) {
      return true;
    }

    // get food detail
    _food = await _getFood.call(id: _foodId);

    print( "chunhthandhe " + _food.toString());


    initData = true;
    isBusy = false;
    return true;
  }
}
