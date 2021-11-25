
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_gitaction_golden/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'test_app.dart';

final _devices = [
  Device.phone.copyWith(name: 'phone_portrait'),
  Device(name: 'phone_landscape', size: Device.phone.size.flipped),
  Device.tabletLandscape,
];

void main() {
  var name = 'teste-app';
  testGoldens('teste-goldem-maduro', (WidgetTester tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: _devices)
      ..addScenario(widget: TestApp());
    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, name);
  });

}
