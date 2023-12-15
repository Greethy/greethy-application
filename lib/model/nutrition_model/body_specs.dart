class BodySpecsModel {
  final int id;
  final int age;
  final int height;
  final int weight;
  final Bmi bmi;
  final Pal pal;
  final Bmr bmr;
  final String createdAt;

  BodySpecsModel({
    required this.id,
    required this.age,
    required this.height,
    required this.weight,
    required this.bmi,
    required this.pal,
    required this.bmr,
    required this.createdAt,
  });

  factory BodySpecsModel.fromJson(Map<String, dynamic> json) {
    return BodySpecsModel(
      id: json['id'],
      age: json['age'],
      height: json['height'],
      weight: json['weight'],
      bmi: Bmi.fromJson(json['bmi']),
      pal: Pal.fromJson(json['pal']),
      bmr: Bmr.fromJson(json['bmr']),
      createdAt: json['create_at'],
    );
  }
}

class Bmi {
  final double index;
  final String status;

  Bmi({
    required this.index,
    required this.status,
  });

  factory Bmi.fromJson(Map<String, dynamic> json) {
    return Bmi(
      index: json['index'],
      status: json['status'],
    );
  }
}

class Pal {
  final String typeOfActivity;
  final double value;

  Pal({
    required this.typeOfActivity,
    required this.value,
  });

  factory Pal.fromJson(Map<String, dynamic> json) {
    return Pal(
      typeOfActivity: json['typeOfActivity'],
      value: json['value'],
    );
  }
}

class Bmr {
  final int bmrPerKg;
  final int bmrPerDay;

  Bmr({
    required this.bmrPerKg,
    required this.bmrPerDay,
  });

  factory Bmr.fromJson(Map<String, dynamic> json) {
    return Bmr(
      bmrPerKg: json['bmrPerKg'],
      bmrPerDay: json['bmrPerDay'],
    );
  }
}