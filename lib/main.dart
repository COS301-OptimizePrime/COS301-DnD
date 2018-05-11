import 'package:dnd_301_final/app_data.dart';
import 'package:dnd_301_final/character_selection.dart';
import 'package:dnd_301_final/home_page.dart';
import 'package:dnd_301_final/login_page.dart';
import 'package:dnd_301_final/monster_journal.dart';
import 'package:dnd_301_final/session_screen.dart';
import 'package:flutter/material.dart';
import 'package:dnd_301_final/race_viewer.dart';


void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {

  AppData appData = AppData.instance();

  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => new LoginPage(),
    HomePage.tag: (context) => new HomePage(),
    MonsterJournal.tag: (context) => new MonsterJournal(),
    CharacterSelection.tag: (context) => new CharacterSelection(),
    GameSessionDemo.tag: (context) => new GameSessionDemo(null),
    RaceViewer.tag: (context) => new RaceViewer(),

//    HomePage.tsg: (context) => new HomePage();
  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '301 DnD Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
//        primaryColor: Colors.black,
        accentColor: Colors.deepOrange,
        textSelectionHandleColor: Colors.white,
        fontFamily: 'Nunito',
      ),
      home: new LoginPage(),
      routes: routes,
    );
  }
}
