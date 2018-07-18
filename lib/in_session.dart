import 'package:flutter/material.dart';
import 'package:dnd_301_final/backend/server.pb.dart';
import 'package:dnd_301_final/character_selection.dart';
import 'package:dnd_301_final/monster_journal.dart';

// The screen that players see when session is initiated
// Dungeon Master and normal players see different screens
class InSession extends StatefulWidget {
  static String tag = 'in-session';
  final Session session;
  final bool isDM;

  InSession(this.session, this.isDM);

  @override
  InSessionState createState() =>
      new InSessionState(this.session, this.isDM);
}

class InSessionState extends State<InSession> {
  final Session session;
  final bool isDM;

  InSessionState(this.session, this.isDM);

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: new AppBar(
            title: Text(this.session.name),
            actions: <Widget>[
              (isDM) ? Image.asset('assets/icon_assets/dm_icon.png') : Text("")
            ],
            bottom: TabBar(
                // tabs differ for DM and NP
                tabs: (isDM)
                    ? <Widget>[
                        // DM tabs
                        Tab(text: "Characters"),
                        Tab(text: "Monsters"),
                      ]
                    : <Widget>[
                        // NP tabs
                        Tab(text: "Characters"),
                        Tab(text: "Party"),
                      ]),
          ),
          body: new TabBarView(
              children: (isDM) ? [
                AllCharactersTab(session),
                MonstersTab(session),
              ]
              : [ // NP tabs
                CharactersTab(session),
                PartyTab(session),
              ]
          ),
        ));
  }
}

class PartyTab extends StatefulWidget {
  final Session session;

  PartyTab(this.session);

  @override
  PartyTabState createState() => new PartyTabState(this.session);
}

// Normal player Tabs:
class PartyTabState extends State<PartyTab> {
  final Session session;

  PartyTabState(this.session);

  @override
  Widget build(BuildContext context) {
    List<String> _items = <String>[];

    for (User user in session.users) {
      _items.add(user.name);
    }

    return new ListView.builder(
        shrinkWrap: true,
        padding: kMaterialListPadding,
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          final String item = _items[index];
          return new ListTile(
            leading: new CircleAvatar(
              backgroundImage: new AssetImage('assets/placeholder.jpg'),
            ),
            title: new Text('$item'),
            subtitle: const Text(
                ''),
          );
        });
  }
}

class CharactersTab extends StatefulWidget {
  final Session session;

  CharactersTab(this.session);

  @override
  CharactersTabState createState() => new CharactersTabState(this.session);
}

class CharactersTabState extends State<CharactersTab> {
  final Session session;

  CharactersTabState(this.session);

  @override
  Widget build(BuildContext context) {
    final List<LocalCharacter> sessionChars = new List();

    // TODO: get session chars of player

    return new ListView(
        itemExtent: CharacterItem.height,
        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),//adds padding between cards and screen
        children: sessionChars.map((LocalCharacter char) {  //this goes through all our characters and makes a card for each
          return new Container(       //this is our 'card'
              margin: const EdgeInsets.only(bottom: 8.0),
              child: new CharacterItem(char: char)  //give our card a character to use
          );
        }).toList()
    );
  }
}

// DM tabs:
class AllCharactersTab extends StatefulWidget {
  final Session session;

  AllCharactersTab(this.session);

  @override
  AllCharactersTabState createState() => new AllCharactersTabState(this.session);
}

class AllCharactersTabState extends State<AllCharactersTab> {
  final Session session;

  AllCharactersTabState(this.session);

  @override
  Widget build(BuildContext context) {
    final List<LocalCharacter> sessionChars = new List();

    // TODO: get session chars

    return new ListView(
        itemExtent: CharacterItem.height,
        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),//adds padding between cards and screen
        children: sessionChars.map((LocalCharacter char) {  //this goes through all our characters and makes a card for each
          return new Container(       //this is our 'card'
              margin: const EdgeInsets.only(bottom: 8.0),
              child: new CharacterItem(char: char)  //give our card a character to use
          );
        }).toList()
    );
  }
}

class MonstersTab extends StatefulWidget {
  final Session session;

  MonstersTab(this.session);

  @override
  MonstersTabState createState() => new MonstersTabState(this.session);
}

class MonstersTabState extends State<MonstersTab> {
  final Session session;

  MonstersTabState(this.session);

  @override
  Widget build(BuildContext context) {
    final List<Monster> sessionMonsters = new List();

    // TODO: get session monsters

    return new ListView(
        itemExtent: CharacterItem.height,
        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),//adds padding between cards and screen
        children: sessionMonsters.map((Monster mon) {  //this goes through all our monsters and makes a card for each
          return new Container(       //this is our 'card'
              margin: const EdgeInsets.only(bottom: 8.0),
              child: new MonsterItem(mon: mon)  //give our card a monster to use
          );
        }).toList()
    );
  }
}