import 'package:greethy_application/domain/entities/body_entities/body_specs.dart';
import 'package:greethy_application/domain/repository/body_repository/body_specs_repository.dart';

class CasePutBodySpecs {
  CasePutBodySpecs({
    required BodySpecsRepository repository,
  }) : _repository = repository;

  final BodySpecsRepository _repository;

  Future<BodySpecs?> call({
    required BodySpecs bodySpecs,
    required String id,
  }) async {
    final BodySpecs? result = await _repository.putBodySpecs(bodySpecs: bodySpecs, id: id);
    return result;
  }
}
