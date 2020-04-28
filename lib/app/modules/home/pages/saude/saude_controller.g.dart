// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saude_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SaudeController on _SaudeControllerBase, Store {
  final _$cidadeAtom = Atom(name: '_SaudeControllerBase.cidade');

  @override
  String get cidade {
    _$cidadeAtom.context.enforceReadPolicy(_$cidadeAtom);
    _$cidadeAtom.reportObserved();
    return super.cidade;
  }

  @override
  set cidade(String value) {
    _$cidadeAtom.context.conditionallyRunInAction(() {
      super.cidade = value;
      _$cidadeAtom.reportChanged();
    }, _$cidadeAtom, name: '${_$cidadeAtom.name}_set');
  }

  final _$titulocidadeAtom = Atom(name: '_SaudeControllerBase.titulocidade');

  @override
  String get titulocidade {
    _$titulocidadeAtom.context.enforceReadPolicy(_$titulocidadeAtom);
    _$titulocidadeAtom.reportObserved();
    return super.titulocidade;
  }

  @override
  set titulocidade(String value) {
    _$titulocidadeAtom.context.conditionallyRunInAction(() {
      super.titulocidade = value;
      _$titulocidadeAtom.reportChanged();
    }, _$titulocidadeAtom, name: '${_$titulocidadeAtom.name}_set');
  }

  final _$_SaudeControllerBaseActionController =
      ActionController(name: '_SaudeControllerBase');

  @override
  void mudaCidade(String value) {
    final _$actionInfo = _$_SaudeControllerBaseActionController.startAction();
    try {
      return super.mudaCidade(value);
    } finally {
      _$_SaudeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String mudatitulo(String value) {
    final _$actionInfo = _$_SaudeControllerBaseActionController.startAction();
    try {
      return super.mudatitulo(value);
    } finally {
      _$_SaudeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Stream<dynamic> pegaCidade(String cidade) {
    final _$actionInfo = _$_SaudeControllerBaseActionController.startAction();
    try {
      return super.pegaCidade(cidade);
    } finally {
      _$_SaudeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'cidade: ${cidade.toString()},titulocidade: ${titulocidade.toString()}';
    return '{$string}';
  }
}
