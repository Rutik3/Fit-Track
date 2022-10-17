import 'dart:math';
import 'bmi_bmr.dart';

double bMR = 0;

class CalculatorBrain {
  final Gender? gender;
  final int age;
  final int height;
  final int weight;
  late double _bmi;
  late double _bmr;

  CalculatorBrain(
      {required this.weight,
      required this.height,
      required this.age,
      required this.gender});

  String calculateBMR() {
    if (gender == Gender.male) {
      _bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5;
      _bmr = _bmr * 1.2;
      bMR = double.parse(_bmr.toStringAsFixed(1));
      return _bmr.toStringAsFixed(1);
    } else {
      _bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161;
      _bmr = _bmr * 1.2;
      bMR = double.parse(_bmr.toStringAsFixed(1));
      return _bmr.toStringAsFixed(1);
    }
  }

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }
}
