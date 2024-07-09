import 'package:greethy_application/domain/entities/nutrition_entities/eating_shedule_group.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/eating_schedule_group_repository.dart';

class CasePutEatingScheduleGroup {
  CasePutEatingScheduleGroup({
    required EatingScheduleGroupRepository repository,
  }) : _repository = repository;

  final EatingScheduleGroupRepository _repository;

  Future<EatingScheduleGroup?> call({
    required EatingScheduleGroup eatingScheduleGroup,
    required String id,
  }) async {
    final EatingScheduleGroup? result = await _repository.putEatingScheduleGroup(eatingScheduleGroup: eatingScheduleGroup, id: id);
    return result;
  }
}
