import 'package:greethy_application/domain/entities/body_entities/body_specs.dart';

abstract class BodySpecsRepository {
  Future<BodySpecs?> getBodySpecs({
    required String id,
  });

  Future<BodySpecs?> postBodySpecs({
    required BodySpecs bodySpecs,
  });

  Future<BodySpecs?> putBodySpecs({
    required String id,
    required BodySpecs bodySpecs,
  });
}
