import 'package:greethy_application/data/dto/body_dto/body_specs_dto.dart';
import 'package:greethy_application/data/source/network/body_api/body_specs_api.dart';
import 'package:greethy_application/domain/entities/body_entities/body_specs.dart';
import 'package:greethy_application/domain/repository/body_repository/body_specs_repository.dart';

class BodySpecsRepositoryImpl implements BodySpecsRepository {
  final BodySpecsApi _api;

  BodySpecsRepositoryImpl({
    required BodySpecsApi api,
  }) : _api = api;

  @override
  Future<BodySpecs?> getBodySpecs({required String id}) async {
    final BodySpecsDto? fetched = await _api.get(id);
    return fetched == null ? null : fetched.toBodySpecs();
  }

  @override
  Future<BodySpecs?> postBodySpecs({required BodySpecs bodySpecs}) async {
    final BodySpecsDto? fetched = await _api.post(bodySpecs);
    return fetched == null ? null : fetched.toBodySpecs();
  }

  @override
  Future<BodySpecs?> putBodySpecs({required String id, required BodySpecs bodySpecs}) async {
    final BodySpecsDto? fetched = await _api.put(id, bodySpecs);
    return fetched == null ? null : fetched.toBodySpecs();
  }
}
