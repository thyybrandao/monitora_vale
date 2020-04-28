import 'package:covidvale/app/modules/home/pages/saude/saude_controller.dart';
import 'package:flutter/material.dart';
import 'package:covidvale/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';

void main(){

  GetIt getIt = GetIt.I;
  getIt.registerSingleton<SaudeController>(SaudeController());

  runApp(ModularApp(module: AppModule()));
}
