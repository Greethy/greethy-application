import 'package:greethy_application/domain/entities/nutrition_entities/body_specs.dart';
import 'package:greethy_application/domain/repository/nutritional_repository/body_specs_repository.dart';

class PostBodySpecs {
  PostBodySpecs({
    required BodySpecsRepository repository,
  }) : _repository = repository;

  final BodySpecsRepository _repository;

  Future<BodySpecs?> call({
    required BodySpecs bodySpecs,
  }) async {
    final BodySpecs? user = await _repository.postBodySpecs(bodySpecs: bodySpecs);
    return user;
  }
}
