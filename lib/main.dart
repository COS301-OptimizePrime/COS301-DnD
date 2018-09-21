import 'package:dnd_301_final/app_data.dart';
import 'package:dnd_301_final/character/character_selection.dart';
import 'package:dnd_301_final/home_page.dart';
import 'package:dnd_301_final/journals/monster_journal_new.dart';
import 'package:dnd_301_final/journals/race_viewer.dart';
import 'package:dnd_301_final/login_page.dart';
import 'package:dnd_301_final/splash.dart';
import 'package:dnd_301_final/session/lobby_screen.dart';
import 'package:flutter/material.dart';


void main() => runApp(new Main());


class Main extends StatelessWidget {

  final AppData appData = AppData.instance();


  final routes = <String, WidgetBuilder>{
    Splash.tag: (context) => new Splash(),
    LoginPage.tag: (context) => new LoginPage(),
    HomePage.tag: (context) => new HomePage(),
    MonsterJournal.tag: (context) => new MonsterJournal(),
    CharacterSelection.tag: (context) => new CharacterSelection(),
    GameSession.tag: (context) => new GameSession(null),
    RaceViewer.tag: (context) => new RaceViewer(),
  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'DnD Game State Manager',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
//        primaryColor: Colors.black,
        accentColor: Colors.deepOrange,
        textSelectionHandleColor: Colors.white,
        fontFamily: 'Nunito',
      ),
      home: new Splash(),
      routes: routes,

    );
  }
}
