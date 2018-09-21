import 'package:splashscreen/splashscreen.dart';
import 'package:dnd_301_final/login_page.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  static String tag = 'splash-page';
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        title: Text(""),
        seconds: 5,
        navigateAfterSeconds: LoginPage.tag,
        image: new Image.asset('assets/splash.png'),
        styleTextUnderTheLoader: new TextStyle(color:
          Colors.black.withRed(34).withGreen(34).withBlue(34)
        ),
        backgroundColor: Colors.black.withRed(34).withGreen(34).withBlue(34),
        photoSize: 130.0,
        loaderColor: Colors.deepOrange
    );
  }
}