import 'package:equatable/equatable.dart';

class BodySpecs extends Equatable {
  final String? id;
  final int? age;
  final int? height;
  final int? weight;
  final Bmi? bmi;
  final Pal? pal;
  final Bmr? bmr;
  final String? createdAt;

  BodySpecs({
    this.id,
    this.age,
    this.height,
    this.weight,
    this.bmi,
    this.pal,
    this.bmr,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        age,
        height,
        weight,
        bmi,
        pal,
        bmr,
        createdAt,
      ];
}

class Bmi extends Equatable {
  final double? index;
  final String? status;

  Bmi({
    this.index,
    this.status,
  });

  @override
  List<Object?> get props => [
        index,
        status,
      ];
}

class Pal extends Equatable {
  final String? typeOfActivity;
  final double? value;

  Pal({
    this.typeOfActivity,
    this.value,
  });

  @override
  List<Object?> get props => [
        typeOfActivity,
        value,
      ];
}

class Bmr extends Equatable {
  final double? bmrPerKg;
  final double? bmrPerDay;

  Bmr({
    this.bmrPerKg,
    this.bmrPerDay,
  });

  @override
  List<Object?> get props => [
        bmrPerKg,
        bmrPerDay,
      ];
}
