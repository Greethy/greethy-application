import 'package:greethy_application/domain/entities/nutrition_entities/drink_shedule_group.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/drink_schedule_group_usecase/get_drink_schedule_group.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/drink_schedule_group_usecase/post_drink_schedule_group.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/drink_schedule_group_usecase/put_drink_schedule_group.dart';

import '../appState.dart';

class DrinkScheduleGroupState extends AppState {
  DrinkScheduleGroupState({
    required GetDrinkScheduleGroup getDrinkScheduleGroup,
    required PostDrinkScheduleGroup postDrinkScheduleGroup,
    required PutDrinkScheduleGroup putDrinkScheduleGroup,
  })  : _getDrinkScheduleGroup = getDrinkScheduleGroup,
        _postDrinkScheduleGroup = postDrinkScheduleGroup,
        _putDrinkScheduleGroup = putDrinkScheduleGroup;

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------

  final GetDrinkScheduleGroup _getDrinkScheduleGroup;
  final PostDrinkScheduleGroup _postDrinkScheduleGroup;
  final PutDrinkScheduleGroup _putDrinkScheduleGroup;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  late DrinkScheduleGroup? _drinkScheduleGroup;

  DrinkScheduleGroup? get collectiveModel => _drinkScheduleGroup;

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  /// get body specs
  Future<void> getDrinkScheduleGroupMySelf(String id) async {
    isBusy = true;
    _drinkScheduleGroup = await _getDrinkScheduleGroup.call(id: id);
    isBusy = false;
  }

  /// post body specs
  Future<void> postDrinkScheduleGroupMySelf(DrinkScheduleGroup drinkScheduleGroup) async {
    isBusy = true;
    _drinkScheduleGroup = await _postDrinkScheduleGroup.call(drinkScheduleGroup: drinkScheduleGroup);
    isBusy = false;
  }

  /// put body specs
  Future<void> putDrinkScheduleGroupMySelf(String id, DrinkScheduleGroup drinkScheduleGroup) async {
    isBusy = true;
    _drinkScheduleGroup = await _putDrinkScheduleGroup.call(id: id, drinkScheduleGroup: drinkScheduleGroup);
    isBusy = false;
  }
}
