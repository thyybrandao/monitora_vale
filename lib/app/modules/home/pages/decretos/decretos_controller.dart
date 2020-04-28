import 'package:mobx/mobx.dart';

part 'decretos_controller.g.dart';

class DecretosController = _DecretosControllerBase with _$DecretosController;

abstract class _DecretosControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
