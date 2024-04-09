import 'package:greethy_application/domain/entities/nutrition_entities/eating_shedule_group.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/eating_schedule_group_usecase/get_eating_schedule_group.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/eating_schedule_group_usecase/post_eating_schedule_group.dart';
import 'package:greethy_application/domain/usecase/nutrition_usercase/eating_schedule_group_usecase/put_eating_schedule_group.dart';

import '../appState.dart';

class EatingScheduleGroupState extends AppState {
  EatingScheduleGroupState({
    required GetEatingScheduleGroup getEatingScheduleGroup,
    required PostEatingScheduleGroup postEatingScheduleGroup,
    required PutEatingScheduleGroup putEatingScheduleGroup,
  })  : _getEatingScheduleGroup = getEatingScheduleGroup,
        _postEatingScheduleGroup = postEatingScheduleGroup,
        _putEatingScheduleGroup = putEatingScheduleGroup;

  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------

  final GetEatingScheduleGroup _getEatingScheduleGroup;
  final PostEatingScheduleGroup _postEatingScheduleGroup;
  final PutEatingScheduleGroup _putEatingScheduleGroup;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  late EatingScheduleGroup? _eatingScheduleGroup;

  EatingScheduleGroup? get eatingScheduleGroup => _eatingScheduleGroup;

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  /// get body specs
  Future<void> getEatingScheduleGroupMySelf(String id) async {
    isBusy = true;
    _eatingScheduleGroup = await _getEatingScheduleGroup.call(id: id);
    isBusy = false;
  }

  /// post body specs
  Future<void> postEatingScheduleGroupMySelf(EatingScheduleGroup eatingScheduleGroup) async {
    isBusy = true;
    _eatingScheduleGroup = await _postEatingScheduleGroup.call(eatingScheduleGroup: eatingScheduleGroup);
    isBusy = false;
  }

  /// put body specs
  Future<void> putEatingScheduleGroupMySelf(String id, EatingScheduleGroup eatingScheduleGroup) async {
    isBusy = true;
    _eatingScheduleGroup = await _putEatingScheduleGroup.call(id: id, eatingScheduleGroup: eatingScheduleGroup);
    isBusy = false;
  }
}
