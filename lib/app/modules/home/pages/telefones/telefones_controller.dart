import 'package:mobx/mobx.dart';

part 'telefones_controller.g.dart';

class TelefonesController = _TelefonesControllerBase with _$TelefonesController;

abstract class _TelefonesControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
