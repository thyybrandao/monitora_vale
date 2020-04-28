import 'package:covidvale/app/modules/home/pages/telefones/telefones_controller.dart';
import 'package:covidvale/app/modules/home/pages/decretos/decretos_controller.dart';
import 'package:covidvale/app/modules/home/pages/municipio/municipio_controller.dart';
import 'package:covidvale/app/modules/home/pages/saude/saude_controller.dart';

import 'package:covidvale/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:covidvale/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TelefonesController()),
        Bind((i) => DecretosController()),
        Bind((i) => MunicipioController()),
        Bind((i) => SaudeController()),
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
