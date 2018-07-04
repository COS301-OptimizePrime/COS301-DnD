import 'package:flutter_driver/flutter_driver.dart';
import 'dart:async';

Future<bool> widgetExists(FlutterDriver driver, SerializableFinder finder) async {
  try {
    await driver.waitFor(finder);
    return true;
  }
  catch(_) {
    return false;
  }
}