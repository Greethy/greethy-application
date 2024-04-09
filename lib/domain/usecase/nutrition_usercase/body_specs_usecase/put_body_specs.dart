import 'package:greethy_application/domain/entities/nutrition_entities/body_specs.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/body_specs_repository.dart';

class PutBodySpecs {
  PutBodySpecs({
    required BodySpecsRepository repository,
  }) : _repository = repository;

  final BodySpecsRepository _repository;

  Future<BodySpecs?> call({
    required BodySpecs bodySpecs,
    required String id,
  }) async {
    final BodySpecs? user = await _repository.putBodySpecs(bodySpecs: bodySpecs, id: id);
    return user;
  }
}
