import 'package:mobx/mobx.dart';

part 'municipio_controller.g.dart';

class MunicipioController = _MunicipioControllerBase with _$MunicipioController;

abstract class _MunicipioControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
