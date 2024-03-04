import 'package:equatable/equatable.dart';
import 'package:greethy_application/domain/entities/nutrition_entities/eating_plan.dart';

class EatingScheduleGroup extends Equatable {
  final String id;
  final EatingPlan eatingPlanId;
  final String createdAt;
  final List<EatingSchedule> eatingSchedule;

  EatingScheduleGroup({
    required this.id,
    required this.eatingPlanId,
    required this.createdAt,
    required this.eatingSchedule,
  });

  @override
  List<Object?> get props => [id, eatingPlanId, createdAt, eatingSchedule];
}

class EatingSchedule extends Equatable {
  final String date;
  final int menuId;

  EatingSchedule({
    required this.date,
    required this.menuId,
  });

  @override
  List<Object?> get props => [date, menuId];
}