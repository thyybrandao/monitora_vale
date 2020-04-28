import 'package:mobx/mobx.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  receberNotificacao(){
    OneSignal.shared.init("2ffc4872-8fac-4348-af72-121694ddbf36");
    OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.none);
  }
}
