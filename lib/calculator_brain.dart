import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.weight, required this.height});

  final int height;
  final int weight;
  double _bmi= 0;

  double calculateBMI(){
    _bmi = weight/ pow(height/100,2);
    return _bmi;
  }

  String getResult() {
    if (_bmi >= 25)
      return "Overweight";
    else if (_bmi > 18)
      return "Normal";
    else
      return "Underweight";
  }

  String getInterpretation(){

    if(_bmi >= 25)
      return "You have a higher than normal body weight. Try to exercise more.";
    else if(_bmi > 18)
      return "You have normal body weight. Good Job!";
    else
      return "You have a lower than normal body weight. Try balancing nutrition.";
  }
}

