import 'package:greethy_application/domain/entities/nutrition_entities/eating_shedule_group.dart';

abstract class EatingScheduleGroupRepository {
  Future<EatingScheduleGroup?> getEatingScheduleGroup({
    required String id,
  });

  Future<EatingScheduleGroup?> postEatingScheduleGroup({
    required EatingScheduleGroup eatingScheduleGroup,
  });

  Future<EatingScheduleGroup?> putEatingScheduleGroup({
    required String id,
    required EatingScheduleGroup eatingScheduleGroup,
  });
}
