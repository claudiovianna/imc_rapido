// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resultado.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Resultado on _Resultado, Store {
  final _$resultadoAtom = Atom(name: '_Resultado.resultado');

  @override
  String get resultado {
    _$resultadoAtom.context.enforceReadPolicy(_$resultadoAtom);
    _$resultadoAtom.reportObserved();
    return super.resultado;
  }

  @override
  set resultado(String value) {
    _$resultadoAtom.context.conditionallyRunInAction(() {
      super.resultado = value;
      _$resultadoAtom.reportChanged();
    }, _$resultadoAtom, name: '${_$resultadoAtom.name}_set');
  }

  final _$_ResultadoActionController = ActionController(name: '_Resultado');

  @override
  void apresentacaoDeResultado(double peso, double altura) {
    final _$actionInfo = _$_ResultadoActionController.startAction();
    try {
      return super.apresentacaoDeResultado(peso, altura);
    } finally {
      _$_ResultadoActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'resultado: ${resultado.toString()}';
    return '{$string}';
  }
}
