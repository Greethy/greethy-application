import 'package:greethy_application/domain/entities/body_entities/body_management.dart';
import 'package:greethy_application/domain/entities/body_entities/body_specs.dart';
import 'package:greethy_application/domain/usecase/body_usecase/body_management_usecase/get_body_management.dart';
import 'package:greethy_application/domain/usecase/body_usecase/body_specs_usecase/post_body_specs.dart';
import 'package:greethy_application/presentation/helper/injection.dart';
import 'package:greethy_application/presentation/state/appState.dart';

class BodySpecsInputScreenState extends AppState {
  // ---------------------------------------------------------------------------
  // Use cases
  // ---------------------------------------------------------------------------

  final CaseCaseGetBodySpecsManagement _getBodySpecsManagement = DependencyInjection().getBodySpecsManagement;
  final CasePostBodySpecs _postBodySpecs = DependencyInjection().postBodySpecs;

  // ---------------------------------------------------------------------------
  // Properties
  // ---------------------------------------------------------------------------

  // init database status
  bool initData = false;

  // bodySpecsManagement @{
  late BodySpecsManagement? _bodySpecsManagement;

  BodySpecsManagement? get bodySpecsManagement => _bodySpecsManagement;

  late BodySpecs? _bodySpecs;

  BodySpecs? get bodySpecs => _bodySpecs;

  // }@

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  Future<bool> initDatabase() async {
    if (initData == true) {
      return true;
    }

    // get bodySpecsManagement detail

    initData = true;
    return true;
  }

  Future<void> updateBodySpecs(int age, int heght, int weight) async {
    BodySpecs inputBodySpecs = new BodySpecs(age: age, height: heght, weight: weight);
    _bodySpecs = await _postBodySpecs.call(bodySpecs: inputBodySpecs);

    initData = true;
    notifyListeners();
  }
}
