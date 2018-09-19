import 'dart:async';

import 'package:dnd_301_final/app_data.dart';
import 'package:dnd_301_final/backend/server.pb.dart';
import 'package:dnd_301_final/character/character_selection.dart';
import 'package:dnd_301_final/menu.dart';
import 'package:flutter/material.dart';

///To hold the actual game screen logic
class GameScreen extends StatefulWidget {

  final _GameScreenState gss;
  final List<PlayerFrame> playerCharacters = new List();
  final bool iAmDungeonMaster;

  GameScreen(bool dm): iAmDungeonMaster = dm;

  @override
  _GameScreenState createState() => _GameScreenState(playerCharacters);
}

class _GameScreenState extends State<GameScreen> {

  Timer timer;
  bool busy;

//  bool waitingOnOthers = true;
  bool iAmGameMaster = false;
  List<PlayerFrame> playerCharacters;

  _GameScreenState(List<PlayerFrame> list) {
    busy = false;
    playerCharacters = list;
    iAmGameMaster =
        AppData.currentSession.dungeonMaster.uid == AppData.user.uid;

    init().whenComplete(() {
      setState(() {
        timer = new Timer.periodic(
            const Duration(seconds: AppData.pollRate), (Timer t) => _update());
      });
    });
  }

  Future init() async
  {
    if (AppData.currentSession.charactersInSession.isEmpty)
      AppData.currentSession.charactersInSession.addAll(
          await AppData.getGameCharacters(AppData.currentSession.sessionId));

    if (playerCharacters.isEmpty)
      AppData.currentSession.charactersInSession.forEach((char) {
        playerCharacters.add(new PlayerFrame(char));
      });

    return;
  }


  _update() async
  {
    if (busy) return;
    busy = true;

    if (AppData.currentSession == null) {
      print('AppData.currentSession is null!');
      return;
    }

    LightSession response = await AppData.getLightSessionById(
        AppData.currentSession.sessionId);
    if (timer == null) {
      busy = false;
      return;
    }

    if (response == null) {
      print('response is null');
      busy = false;
      return;
    }

    bool needToUpdateView = false;

    //check if session has changed - and fetch full object if necessary
    if (AppData.currentSession.lastUpdated != response.lastUpdated) {
      //important - full session server call
      Session tempSession = await AppData.getSessionById(
          AppData.currentSession.sessionId);
      needToUpdateView = true;

      if (AppData.currentSession.status != tempSession.status) {
        print('Status: ${tempSession.status}');
        if (tempSession.status == "FAILED") print(
            'Status Message: ${tempSession.statusMessage}');
      }

      if (AppData.currentSession.state != tempSession.state) {
        print('State: ${tempSession.state}');
      }

      if (AppData.currentSession.users.length != tempSession.users.length) {
        print('Number of users: ${tempSession.users.length}');
      }

      //update full session object
      AppData.currentSession = tempSession;
    }

    for (LightCharacter char in AppData.currentSession.charactersInSession) {
      PlayerFrame pf = playerCharacters.firstWhere((c) =>
      c.pfs.character.characterId == char.characterId, orElse: () {
        return null;
      });
      LightCharacter c = (pf != null) ? pf.pfs.character : null;

      //character not found in local list
      if (c == null) {
        playerCharacters.add(new PlayerFrame(char));
        needToUpdateView = true;
      }
      else if (c.lastUpdated != char.lastUpdated) {
        //character and local do not match
        c = char;
        pf.pfs.update(char);
        needToUpdateView = true;
      }

      print('${char.name} : updated');
    }

    busy = false;

    try {
      if (needToUpdateView)
        setState(() {
          // _items = _items;
          print('updating view');
        });
    }
    catch (Exception) {
      print(
          'setState called on null - an update was called on a deleted state');
    }
  }


  @override
  void dispose() {
    super.dispose();
    if (timer != null)
      timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Widget currentView;

    if (iAmGameMaster) {
      currentView = Container(
        child: Center(
          child: Text('I am DungeonMaster ...'),
        ),
      );
    }
//    else if(waitingOnOthers)
//      currentView = Container(
//        child: Center(
//          child: Text('Party is forming!'),
//        ),
//      );
    else
      //if a user has a character in this session
      currentView = Container(
        child: ListView.builder(
            padding: kMaterialListPadding,
            itemCount: playerCharacters.length,
            itemBuilder: (BuildContext context, int index) {
              return playerCharacters[index];
            }),
      );

    return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          title: Text(AppData.currentSession.name),
        ),
        body: currentView
    );
  }
}


class PlayerFrame extends StatefulWidget {


  PlayerFrame(LightCharacter c) : pfs = _PlayerFrameState(c);

  final _PlayerFrameState pfs;

  @override
  _PlayerFrameState createState() => pfs;

}

class _PlayerFrameState extends State<PlayerFrame> {

  _PlayerFrameState(LightCharacter c) : character = c;

  LightCharacter character;
//  static bool alternate = true;

  update(LightCharacter c)
  {
    character = c;
    setState(() {
      //update widget
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppData.screenHeight/5,
      child: CharacterLightView(lightChar: character,titleStyle: null,),
//      child: Row(
//        children: <Widget>[
//          ///player image
//          Container(
//            width: AppData.screenWidth/9,
//            child: null,
//              //@todo add player image
//          ),
//
//          ///player details
//          Column(
//            children: <Widget>[
//              ///player name and class/race
//
//
//              ///player xp bar
////              PlayerXpBar(),
//            ],
//          )
//        ],
//      ),
    );
  }
}
