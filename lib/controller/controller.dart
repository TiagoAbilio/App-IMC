import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc/ui/home.dart';
import 'package:imc/ui/result.dart';

class ControllerHome extends GetxController {
  double _altura = 100.0;
  double _increment = 1.0;
  double _peso = 59.0;
  int _idade = 22;
  String _sexo = "";

  String get sexo => _sexo;
  int get idade => _idade;
  double get peso => _peso;
  double get altura => _altura;
  double get increment => _increment;

  alterValue(double value) {
    _altura = value;
    _increment = _altura;
    update(["teste", "altura"]);
  }

  incrementPeso() {
    _peso += 1.0;
    update(["peso"]);
  }

  descrePeso() {
    _peso -= 1.0;
    update(["peso"]);
  }

  incrementIdade() {
    _idade += 1;
    update(["idade"]);
  }

  descrIdade() {
    _idade -= 1;
    update(["idade"]);
  }

  bool hmuder = false;
  bool mmuder = false;

  double _imc = 0.0;
  double get imc => _imc;

  selectSexo(String sexoSelecionado) {
    _sexo = sexoSelecionado;
    print(_sexo);
    if (_sexo == "h") {
      hmuder = true;
      mmuder = false;
    } else {
      hmuder = false;
      mmuder = true;
    }
    update(["sexo"]);
  }

  String _resultsIMC = "";
  String get resultIMC => _resultsIMC;

  calculateIMC() async {
    print("Sexo ${_sexo}\nPeso ${_peso}\nAltura ${_altura}\nIdade ${_idade}");
    _imc = _peso / ((_altura * _altura) / 100) * 100;
    if (_imc < 18.5) {
      print("1");
      _resultsIMC =
          "você tem peso corporal menor do que o normal. Você pode comer um pouco mais";
    } else if (_imc >= 18.5 && _imc <= 24.9) {
      print("2");

      _resultsIMC = "você tem peso corporal normal. Parabens continue assim";
    } else if (_imc >= 25.0 && _imc <= 29.9) {
      print("3");

      _resultsIMC =
          "você tem peso corporal um pouco acima do peso. Cuidado, coma refeições balanciadas";
    } else if (_imc >= 30.0 && _imc <= 39.9) {
      print("4");

      _resultsIMC =
          "você tem peso corporal  acima do peso. Cuidado, coma refeições balanciadas e diminua sua alimentação";
    } else {
      print("5");

      _resultsIMC = "peso corporal acima do normal, procure um medico";
    }
  }

  Future recalculate() async {
    _altura = 100.0;
    _increment = 1.0;
    _peso = 59.0;
    _idade = 22;
    _sexo = "";
    _resultsIMC = "";
    _imc = 0.0;
    hmuder = false;
    mmuder = false;
    return 1;
  }
}
