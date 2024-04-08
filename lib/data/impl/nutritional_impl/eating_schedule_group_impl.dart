import 'package:greethy_application/data/dto/nutrition_dto/eating_shedule_group_dto.dart';
import 'package:greethy_application/data/source/network/nutritional_api/eating_schedule_group_api.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/eating_shedule_group.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/eating_schedule_group_repository.dart';

class EatingScheduleGroupRepositoryImpl implements EatingScheduleGroupRepository {
  final EatingScheduleGroupApi _api;

  EatingScheduleGroupRepositoryImpl({
    required EatingScheduleGroupApi api,
  }) : _api = api;

  @override
  Future<EatingScheduleGroup?> getEatingScheduleGroup({required String id}) async {
    final EatingScheduleGroupDto? fetched = await _api.get(id);
    return fetched == null ? null : fetched.toEatingScheduleGroup();
  }

  @override
  Future<EatingScheduleGroup?> postEatingScheduleGroup({required EatingScheduleGroup eatingScheduleGroup}) async {
    final EatingScheduleGroupDto? fetched = await _api.post(eatingScheduleGroup);
    return fetched == null ? null : fetched.toEatingScheduleGroup();
  }

  @override
  Future<EatingScheduleGroup?> putEatingScheduleGroup({required String id, required EatingScheduleGroup eatingScheduleGroup}) async {
    final EatingScheduleGroupDto? fetched = await _api.put(id, eatingScheduleGroup);
    return fetched == null ? null : fetched.toEatingScheduleGroup();
  }
}
