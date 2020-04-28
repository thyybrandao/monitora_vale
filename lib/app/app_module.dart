import 'package:covidvale/app/modules/home/pages/saude/saude_controller.dart';
import 'package:covidvale/app/modules/home/pages/saude/saude_page.dart';
import 'package:covidvale/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:covidvale/app/app_widget.dart';
import 'package:covidvale/app/modules/home/home_module.dart';
import 'modules/home/home_controller.dart';
import 'modules/home/pages/decretos/decretos_controller.dart';
import 'modules/home/pages/decretos/decretos_page.dart';
import 'modules/home/pages/municipio/municipio_controller.dart';
import 'modules/home/pages/municipio/municipio_page.dart';
import 'modules/home/pages/telefones/telefones_controller.dart';
import 'modules/home/pages/telefones/telefones_page.dart';


class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => HomeController()),
        Bind((i) => SaudeController()), 
        Bind((i) => MunicipioController()),
        Bind((i) => DecretosController()),
        Bind((i) => TelefonesController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router("/saude", child: (_, args) => SaudePage()),
        Router("/municipio", child: (_, args) => MunicipioPage()),
        Router("/decreto", child: (_, args) => DecretosPage()),
        Router("/telefone", child: (_, args) => TelefonesPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
