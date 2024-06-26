import 'package:flutter/material.dart';
import 'package:greethy_application/presentation/state/body/body_specs_input_state.dart';
import 'package:greethy_application/presentation/theme/theme.dart';
import 'package:provider/provider.dart';

class BodySpecsInputScreen extends StatefulWidget {
  @override
  _BodySpecsInputScreenState createState() => _BodySpecsInputScreenState();

  static MaterialPageRoute getRoute() {
    return MaterialPageRoute(
      builder: (_) => ChangeNotifierProvider(
        create: (BuildContext context) => BodySpecsInputScreenState(),
        child: BodySpecsInputScreen(),
      ),
    );
  }
}

class _BodySpecsInputScreenState extends State<BodySpecsInputScreen> {
  final _formKey = GlobalKey<FormState>();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BodySpecsInputScreenState>(builder: (context, state, _) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              'Thông tin cơ thể',
              style: TextStyle(color: GreethyColor.kawa_green),
            ),
          ),
        ),
        body: !state.initData
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 40),
                        TextFormField(
                          controller: _ageController,
                          decoration: InputDecoration(labelText: 'Tuổi'),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng nhập tuổi';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Vui lòng nhập một số hợp lệ';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _heightController,
                          decoration: InputDecoration(labelText: 'Chiều cao (cm)'),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng nhập chiều cao';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Vui lòng nhập một số hợp lệ';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _weightController,
                          decoration: InputDecoration(labelText: 'Cân nặng (kg)'),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng nhập cân nặng';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Vui lòng nhập một số hợp lệ';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final int age = int.parse(_ageController.text);
                              final int height = int.parse(_heightController.text);
                              final int weight = int.parse(_weightController.text);

                              state.updateBodySpecs(age, height, weight);

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: GreethyColor.kawa_green,
                                  content: Text(
                                    'Thông tin đã được lưu',
                                  ),
                                ),
                              );
                            }
                          },
                          child: Text(
                            'Lưu thông tin',
                            style: TextStyle(color: GreethyColor.kawa_green, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 5, right: 5),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10),
                        _buildInfoRow('ID', state.bodySpecs!.id.toString()),
                        SizedBox(height: 10),
                        _buildInfoRow('Tuổi', state.bodySpecs!.age.toString()),
                        SizedBox(height: 10),
                        _buildInfoRow('Chiều cao', '${state.bodySpecs!.height} cm'),
                        SizedBox(height: 10),
                        _buildInfoRow('Cân nặng', '${state.bodySpecs!.weight} kg'),
                        SizedBox(height: 10),
                        _buildInfoRow('BMI', '${state.bodySpecs!.bmi!.index} (${state.bodySpecs!.bmi!.status})'),
                        SizedBox(height: 10),
                        _buildInfoRow('Hoạt động PAL', '${state.bodySpecs!.pal!.typeOfActivity} (giá trị: ${state.bodySpecs!.pal!.value})'),
                        SizedBox(height: 10),
                        _buildInfoRow('BMR mỗi kg', state.bodySpecs!.bmr!.bmrPerKg.toString()),
                        SizedBox(height: 10),
                        _buildInfoRow('BMR mỗi ngày', state.bodySpecs!.bmr!.bmrPerDay.toString()),
                        SizedBox(height: 10),
                        _buildInfoRow('Ngày tạo', state.bodySpecs!.createdAt.toString()),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
      );
    });
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: GreethyColor.kawa_green.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          border: Border.all(
            color: GreethyColor.kawa_green,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  '$label: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: GreethyColor.kawa_green,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: GreethyColor.kawa_green.withOpacity(0.8),
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
