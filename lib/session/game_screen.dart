import 'dart:async';

import 'package:dnd_301_final/app_data.dart';
import 'package:dnd_301_final/backend/server.pb.dart';
import 'package:dnd_301_final/character/character_selection.dart';
import 'package:dnd_301_final/journals/monster_journal_new.dart';
import 'package:dnd_301_final/menu.dart';
import 'package:flutter/material.dart';

///To hold the actual game screen logic
class GameScreen extends StatefulWidget {


  final List<PlayerFrame> playerCharacters = new List();
  final bool iAmDungeonMaster;
  final List<Monster> sessionMonsters = new List();
//  final PlayerView pv = PlayerView();
//  final MonstersTab mt = MonstersTab();


  GameScreen() : iAmDungeonMaster = false;
  GameScreen.isDM() : iAmDungeonMaster = true ;

  @override
  _GameScreenState createState() => _GameScreenState(playerCharacters);
}

class _GameScreenState extends State<GameScreen> {

  Timer timer;
  bool busy;

  bool iAmGameMaster = false;
  List<PlayerFrame> playerCharacters;


  _GameScreenState(List<PlayerFrame> list) {
    busy = false;
    playerCharacters = list;

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
        playerCharacters.add(new PlayerFrame(char: char));
      });

//    if(widget.pv.playerCharacters==null || widget.pv.playerCharacters.isEmpty)
//      widget.pv.playerCharacters.addAll(playerCharacters);

//    if(widget.mt.monstersInSession.isEmpty)
//      widget.mt.monstersInSession.addAll();

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

    ///@todo: implement update of PlayerView
//    for (LightCharacter char in AppData.currentSession.charactersInSession) {
//      PlayerFrame pf = playerCharacters.firstWhere((c) =>
//      c.pfs.character.characterId == char.characterId, orElse: () {
//        return null;
//      });
//      LightCharacter c = (pf != null) ? pf.pfs.character : null;
//
//      //character not found in local list
//      if (c == null) {
//        playerCharacters.add(new PlayerFrame(char: char,));
//        needToUpdateView = true;
//      }
//      else if (c.lastUpdated != char.lastUpdated) {
//        //character and local do not match
//        c = char;
//        pf.pfs.update(char);
//        needToUpdateView = true;
//      }

//      print('${char.name} : updated');
//    }

    busy = false;

    try {
      if (needToUpdateView)
        if(this.mounted)setState(() {
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

//  PlayerView pv;
//  MonstersTab mt;

  @override
  Widget build(BuildContext context) {
    if (widget.iAmDungeonMaster) {

//      if(pv ==null)
//        pv = PlayerView.list(playerCharacters);
//
//      if(mt == null)
//        mt = MonstersTab.list(widget.sessionMonsters);

      return new DefaultTabController(length: 2,
          child: Scaffold(
            drawer: Menu(),
            appBar: AppBar(
              title: Text(AppData.currentSession.name),
              bottom: TabBar(
                tabs: [
                  Tab(text: 'Adventurers',),
                  Tab(text: 'Monsters',),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                PlayerView.list(playerCharacters),
                MonstersTab.list(widget.sessionMonsters),
              ],
            ),
          )
      );


//      return Scaffold(
//        drawer: Menu(),
//        appBar: AppBar(
//          title: Text(AppData.currentSession.name),
//        ),
//        body: TabWidget(
//          tabHeadings: <Widget>[
//            Text('Players'),
//            Text('Monsters'),
//          ],
//          tabs: <Widget>[
////            new PlayerView(playerCharacters),
//            pv,
////            Text('why hello there'),
//            mt,
////            new MonstersTab(widget.sessionMonsters)
//          ],
//        ),
//      );
    }
    else
      //if a user
      return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          title: Text(AppData.currentSession.name),
        ),
        body: PlayerView.list(playerCharacters),
      );
  }
}

class PlayerView extends StatelessWidget {

  final List<PlayerFrame> playerCharacters;


  PlayerView() : playerCharacters = new List();
  PlayerView.list(List<PlayerFrame> list): playerCharacters = list;

  @override
  Widget build(BuildContext context) {
    if(playerCharacters==null || playerCharacters.isEmpty)
      return Container(child: null,);

    return Column(
      children: playerCharacters,
    );

//    return Container(
//      child: ListView.builder(
//          padding: kMaterialListPadding,
//          itemCount: playerCharacters.length,
//          itemBuilder: (BuildContext context, int index) {
//            return playerCharacters[index];
//          }),
//    );
  }
}


class PlayerFrame extends StatefulWidget {


  PlayerFrame({this.char});

  final LightCharacter char;

  @override
  _PlayerFrameState createState() => _PlayerFrameState(char);

}

class _PlayerFrameState extends State<PlayerFrame> {

  _PlayerFrameState(LightCharacter c) : character = c;

  LightCharacter character;
//  static bool alternate = true;

  update(LightCharacter c)
  {
    setState(() {
      //update widget
      character = c;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
//      height: AppData.screenHeight/5,
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

class MonstersTab extends StatefulWidget {

  final List<Monster> monstersInSession;

  MonstersTab() : monstersInSession = new List();
  MonstersTab.list(List<Monster> list): monstersInSession = list;

  @override
  MonstersTabState createState() => new MonstersTabState();
}
class MonstersTabState extends State<MonstersTab> {

  MonstersTabState();

  @override
  Widget build(BuildContext context) {

    // TODO: tododoodo

    return new ListView(
        itemExtent: CharacterItem.height,
        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),//adds padding between cards and screen
        children: widget.monstersInSession.map((Monster mon) {  //this goes through all our monsters and makes a card for each
          return new Container(       //this is our 'card'
              margin: const EdgeInsets.only(bottom: 8.0),
              child: new MonsterItem(myMon: mon)  //give our card a monster to use
          );
        }).toList()
    );
  }
}


class TabWidget extends StatefulWidget {

  final List<Widget> tabHeadings;
  final List<Widget> tabs;

  TabWidget({this.tabHeadings,this.tabs});

  @override
  _TabWidgetState createState() => _TabWidgetState(tabHeadings,tabs);
}

class _TabWidgetState extends State<TabWidget> {

  List<FlatButton> tabButtons = new List();
  List<Widget> tabHeadings;
  List<Widget> tabs;

  int last = 0;

  _TabWidgetState(List<Widget> headings, List<Widget> t) {
    tabHeadings = headings;
    tabs = t;

    if (tabButtons.isEmpty) {
      tabButtons.add(FlatButton(
        onPressed: () {
          //track
          update(0);
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.deepOrange, width: 2.0))
          ),
          child: tabHeadings[0],
        ),
      ));

      for (int i = 1; i < tabHeadings.length; i++) {
        tabButtons.add(FlatButton(
          onPressed: () {
            //track
            update(i);
          },
          child: tabHeadings[i],
        ));
      }
    }
  }

  update(int index) {
    int temp = last;
    //last has no value initially
    if (last != index) {
      tabButtons[index] = new FlatButton(onPressed: () {
        update(index);
      }, child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Colors.deepOrange, width: 2.0))
        ),
        child: tabHeadings[index],
      ));

      tabButtons[temp] = new FlatButton(onPressed: () {
        update(temp);
      }, child: Container(
        child: tabHeadings[temp],
      ));

      if(this.mounted)
        setState(() {
        //update view
        last = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: tabButtons.map((b) {
                return Expanded(child: b);
              }).toList(),
            ),
            Expanded(child: tabs[last],)
          ]
      ),
    );
  }
}