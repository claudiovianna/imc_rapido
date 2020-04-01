import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:imcrapido/resultado.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //mobx
  Resultado resultado = Resultado();

  //controladores
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  //chave global para o formulário
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _info = "Informe seu peso e altura!";

  //métodos
  void _resetarValores() {
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
      _info = "Informe seu peso e altura!";
      _formKey = GlobalKey<FormState>();
    });
  }

//  void _calcularImc() {
//    setState(() {
//      double peso = double.parse(pesoController.text);
//      double altura = double.parse(alturaController.text);
//      double imc = peso / (altura * altura);
//      if (imc <18.6){
//        _info = "Abaixo do Peso (${imc.toStringAsPrecision(3)})";
//      } else if (imc >= 18.6 && imc < 24.9){
//        _info = "Peso Ideal (${imc.toStringAsPrecision(3)})";
//      } else if (imc >= 24.9 && imc < 29.9){
//        _info = "Acima do Peso (${imc.toStringAsPrecision(3)})";
//      } else if (imc >= 29.9 && imc < 34.9){
//        _info = "Obesidade Grau I (${imc.toStringAsPrecision(3)})";
//      } else if (imc >= 34.9 && imc < 39.9){
//        _info = "Obesidade Grau II (${imc.toStringAsPrecision(3)})";
//      } else if (imc >= 40){
//        _info = "Obesidade Grau III (${imc.toStringAsPrecision(3)})";
//      }
//    });
//  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetarValores,
          )
        ],
      ),
      backgroundColor: Colors.amber[50],
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Form(
          key: _formKey,
          child: Column(
            //alinhando o eixo cruzado ocupando toda alargura da coluna
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 120,
                color: Colors.amber,
              ),
              TextFormField(
                controller: pesoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Peso (Kg)",
                  labelStyle: TextStyle(
                    color: Colors.amber
                  )
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 25
                ),
                // ignore: missing_return
                validator: (value) {
                  if(value.isEmpty){
                    return "Insira seu Peso!";
                  }
                }
              ),
              TextFormField(
                controller: alturaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (metro)",
                    labelStyle: TextStyle(
                        color: Colors.amber
                    )
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 25
                ),
                // ignore: missing_return
                validator: (value) {
                  if(value.isEmpty){
                    return "Insira sua Altura!";
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      if(_formKey.currentState.validate()){
                        resultado.apresentacaoDeResultado(double.parse(pesoController.text), double.parse(alturaController.text));
                      }
                    },
                    child: Text("Calcular",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25
                    ),),
                    color: Colors.amber,

                  ),
                ),
              ),
              Observer(
                builder: (_) {
                  return Text(resultado.resultado,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 25
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}