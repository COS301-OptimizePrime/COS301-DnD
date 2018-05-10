import 'package:flutter/material.dart';

class GameSessionDemo extends StatelessWidget {
  static String tag = "game-session";

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.deepOrange,
      child: const FlutterLogo(
        size: 200.0,
      ),
    );
  }
}
