import 'package:greethy_application/domain/entities/nutrition_entities/body_specs.dart';

abstract class BodySpecsRepository {
  Future<BodySpecs?> getBodySpecs({
    required String gmail,
    required String password,
    required String type,
  });

  Future<BodySpecs?> postBodySpecs({
    required String gmail,
    required String password,
    required String type,
  });

  Future<BodySpecs?> putBodySpecs({
    required String gmail,
    required String password,
    required String type,
  });
}
