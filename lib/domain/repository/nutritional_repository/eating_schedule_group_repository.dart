import 'package:greethy_application/domain/entities/nutrition_entities/eating_shedule_group.dart';

abstract class EatingScheduleGroupRepository {
  Future<EatingScheduleGroup?> getEatingScheduleGroup({
    required String gmail,
    required String password,
    required String type,
  });

  Future<EatingScheduleGroup?> postEatingScheduleGroup({
    required String gmail,
    required String password,
    required String type,
  });

  Future<EatingScheduleGroup?> putEatingScheduleGroup({
    required String gmail,
    required String password,
    required String type,
  });
}
