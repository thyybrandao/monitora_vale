import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:covidvale/app/modules/saude/saude_controller.dart';
import 'package:covidvale/app/modules/saude/saude_module.dart';

void main() {
  initModule(SaudeModule());
  // SaudeController saude;
  //
  setUp(() {
    //     saude = SaudeModule.to.get<SaudeController>();
  });

  group('SaudeController Test', () {
    //   test("First Test", () {
    //     expect(saude, isInstanceOf<SaudeController>());
    //   });

    //   test("Set Value", () {
    //     expect(saude.value, equals(0));
    //     saude.increment();
    //     expect(saude.value, equals(1));
    //   });
  });
}
