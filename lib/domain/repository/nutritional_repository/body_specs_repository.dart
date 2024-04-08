import 'package:greethy_application/domain/entities/nutrition_entities/body_specs.dart';

abstract class BodySpecsRepository {
  Future<BodySpecs?> getBodySpecs({
    required String id,
  });

  Future<BodySpecs?> postBodySpecs({
    required String bodySpecs,
  });

  Future<BodySpecs?> putBodySpecs({
    required String id,
    required BodySpecs bodySpecs,
  });
}
