import 'package:greethy_application/domain/entities/nutrition_entities/eating_shedule_group.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/eating_schedule_group_repository.dart';

class CaseGetEatingScheduleGroup {
  CaseGetEatingScheduleGroup({
    required EatingScheduleGroupRepository repository,
  }) : _repository = repository;

  final EatingScheduleGroupRepository _repository;

  Future<EatingScheduleGroup?> call({
    required String id,
  }) async {
    final EatingScheduleGroup? user = await _repository.getEatingScheduleGroup(id: id);
    return user;
  }
}
