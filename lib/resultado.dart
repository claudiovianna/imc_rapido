import 'package:mobx/mobx.dart';

part 'resultado.g.dart';

class Resultado = _Resultado with _$Resultado;

abstract class _Resultado with Store {

  @observable
  String resultado = "Informe seu Peso e Altura!";

  @action
  void apresentacaoDeResultado(double peso, double altura){
    double imc = peso / (altura * altura);
    if (imc <18.6){
      resultado = "Abaixo do Peso (${imc.toStringAsPrecision(3)})";
    } else if (imc >= 18.6 && imc < 24.9){
      resultado = "Peso Ideal (${imc.toStringAsPrecision(3)})";
    } else if (imc >= 24.9 && imc < 29.9){
      resultado = "Acima do Peso (${imc.toStringAsPrecision(3)})";
    } else if (imc >= 29.9 && imc < 34.9){
      resultado = "Obesidade Grau I (${imc.toStringAsPrecision(3)})";
    } else if (imc >= 34.9 && imc < 39.9){
      resultado = "Obesidade Grau II (${imc.toStringAsPrecision(3)})";
    } else if (imc >= 40){
      resultado = "Obesidade Grau III (${imc.toStringAsPrecision(3)})";
    }

  }

}