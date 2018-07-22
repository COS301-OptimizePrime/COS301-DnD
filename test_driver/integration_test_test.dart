import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'utils.dart';

void main() {
  group('login test', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    
    test("load app", () async {
      expect(await widgetExists(driver, find.text('Enter World!')), isTrue);
      expect(await widgetExists(driver, find.text('Google Sign In!')), isTrue);
      expect(await widgetExists(driver, find.text('Register')), isTrue);
    });

    test("register", () async {
      final SerializableFinder button = find.text('Register');

      await driver.waitFor(button);
      await driver.tap(button);

      expect(await widgetExists(driver, find.byValueKey("confirm_txt")), isTrue);
      expect(await widgetExists(driver, find.text("Register New Account")), isTrue);
      expect(await widgetExists(driver, find.text("Login")), isTrue);

      await driver.tap(find.byValueKey("confirm_txt"));
      await driver.enterText("foobar");

      //await driver.tap(find.text("Register New Account"));
      await driver.tap(find.text("Login"));
    });

    test("login", () async {
      final SerializableFinder button = find.text('Enter World!');

      await driver.waitFor(button);
      await driver.tap(button);

      expect(await widgetExists(driver, find.text("Join Game Session")), isTrue);
      expect(await widgetExists(driver, find.text("Create Game Session")), isTrue);
    });
  });
}