import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dnd_301_final/backend/server.pb.dart';
import 'package:dnd_301_final/character_selection.dart';
import 'package:dnd_301_final/character_creation.dart';
import 'package:dnd_301_final/monster_journal.dart';
import 'package:dnd_301_final/app_data.dart';

class SessionCharacterItem extends StatelessWidget {
  SessionCharacterItem({ Key key, @required this.char , this.armorClass})
      : assert(char != null),
  //if it receives a null character object to populate the card, fatal error
        super(key: key);

  static const double height = 160.0; // original value was 366.0
  final LocalCharacter char;
  int armorClass;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context); //copy theme data from parent
    final TextStyle titleStyle = theme.textTheme.headline.copyWith(
        color: Colors.white); //make our titl
    SizedBox title;

    title = new SizedBox(
        height: 60.0,
        child: new Padding(
          padding: new EdgeInsets.only(left: 16.0),
          child: new FittedBox( //new box, fitted to remaining space
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft, //place box left
            child: new Text(char.title,
              //place a Text widget inside - aka our title - which is above our image on the stack
              style: titleStyle,
            ),
          ),
        )
    );

    SizedBox racePreview = new SizedBox(
      height: 60.0,
      width: 60.0,
      child: new Stack(
          children: <Widget>[
            new Positioned.fill( //add image to bottom of stack
                child: new Image.asset(
                  'assets/race_images/' + char.charRace.getImage() + '.png',
                  fit: BoxFit.scaleDown,)
            ),
            new Positioned( //positioned widgets can be moved within their parent (aka stack)
              bottom: 1.0,
              left: 1.0,
              right: 1.0,
              child: new FittedBox( //new box, fitted to remaining space
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft, //place box left
                  child: Text(char.charRace.name)
              ),
            ),
          ]
      ),
    );

    SizedBox classPreview = new SizedBox(
      height: 60.0,
      width: 60.0,
      child: new Stack(
          children: <Widget>[
            new Positioned.fill( //add image to bottom of stack
                child: new Image.asset(
                  'assets/class_images/' + char.charClass.name + '.png',
                  fit: BoxFit.scaleDown,)
            ),
            new Positioned( //positioned widgets can be moved within their parent (aka stack)
              bottom: 1.0,
              left: 1.0,
              right: 1.0,
              child: new FittedBox( //new box, fitted to remaining space
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft, //place box left
                  child: Text(char.charClass.name)
              ),
            ),
          ]
      ),
    );

    Card card = new Card(child: new Column(
        //move to crossaxis (aka horizontal as we are vertical)'s start (left)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            title,
            new Padding(
                padding: new EdgeInsets.only(left: 16.0, right: 16.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    racePreview,
                    classPreview,
//                    profeciecy,
                    Container(width: 60.0, child: new Shield(armorClass)),
                  ],
                )
            )
          ]
      ),
    );

    return new SafeArea(
        top: false,
        bottom: false,
        child: new Container(
            padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
            height: height,
            child: card
        )
    );
  }
}

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
  List<Widget> sessionChars;

  PartyTabState(this.session) {
    //TODO:get party chars


    sessionChars = new List();
    characters.forEach((char) {
      int armorClass = 0;

      if (char.sessionId == session.sessionId) {
        if (char.equipment != null) {
          char.equipment.forEach(
                  (item) {
                if (item != null && !item.isWep)
                  armorClass += item.val;
              }
          );
        }
        // all our characters and makes a card for each
        sessionChars.add(new Container( //this is our 'card'
            margin: const EdgeInsets.only(bottom: 8.0),
            child: new SessionCharacterItem(char: char,
                armorClass: armorClass) //give our card a character to use
        ));
      }
    });
  }

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
          return Column(
            children: [
              new ListTile(
                leading: new CircleAvatar(
                  backgroundImage: new AssetImage('assets/placeholder.jpg'),
                ),
                title: new Text('$item'),
                subtitle: const Text(''),
              ),
              // users chars
              Column(
                children: sessionChars
              )
            ]
          );
        });
  }
}

class AddCharDialogWidget extends StatefulWidget {

  final _formKey = GlobalKey<FormState>();
  final Session session;

  AddCharDialogWidget(this.session);

  @override
  AddCharDialogWidgetState createState() => AddCharDialogWidgetState(session);
}

class AddCharDialogWidgetState extends State<AddCharDialogWidget> {

  Widget view;

  List<bool> inSession;
  String type;
  String value;
  bool createChar;
  final Session session;
  
  AddCharDialogWidgetState(this.session);

  Future<Null> updateCharacters() async {
    characters.clear();
    AppData.updateUserCharacters().whenComplete(
            (){
          print('updating character list');
          setState(() {
            //update list
          });
        }
    );

    return null;
  }

  setView(bool createChar) {
    if (createChar) {
      Navigator.push(
          context, new MaterialPageRoute<DismissDialogAction>(
        builder: (BuildContext context) => new CreateCharacterDialog(),
        fullscreenDialog: true,
      )).then((val) {
        if (val == DismissDialogAction.save) updateCharacters();
      });
    }
    else {
      inSession = new List(characters.length);
      List<Widget> characterSelects = new List(characters.length);

      for (int i = 0; i < characters.length; i++) {
        inSession[i] = (characters
            .elementAt(i)
            .sessionId == session.sessionId);
        characterSelects[i] = new  CheckboxListTile(
          title: Text(characters.elementAt(i).title),
          value: inSession[i],
          onChanged: (bool value) {
            setState(() {
              inSession[i] = value;
            });
          },
        );
      }

      this.createChar = createChar;

      view = Form(
        key: widget._formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // characters
            Container(
              height: AppData.screenHeight / 2,
              child: ListView(
                children: characterSelects,
              ),
            ),

            RaisedButton(
              child: Text('Add Selected Characters.'),
              color: Colors.deepOrange,
              onPressed: () {
                if (widget._formKey.currentState.validate()) {
                  widget._formKey.currentState.save();

                  if(characters != null) {
                    for (int i = 0; i < characters.length; i++) {
                      if (inSession[i]) {
                        characters[i].sessionId = session.sessionId;
                        print("adding ${characters[i].title} to session ${session.sessionId}");
                        AppData.updateCharacter(characters[i]);
                      }
                    }
                  }

                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    print('init state');

    view = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FlatButton(
          child: Container(
              width: AppData.screenWidth/5,
              height: AppData.screenHeight/5,
              child: Icon(Icons.file_upload)
          ),
          onPressed: (){
            setState(() {
              setView(false);
            });
          },
        ),
        FlatButton(
          child: Container(
              width: AppData.screenWidth/5,
              height: AppData.screenHeight/5,
              child: Icon(Icons.add_circle_outline)
          ),
          onPressed: (){
            setState(() {
              setView(true);
            });
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return view;
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
  List<Widget> sessionChars;

  CharactersTabState(this.session) {
    characters.clear();

    // get user chars
    AppData.getUseCharacters().whenComplete(
            () {
          setState(() {
            //update characters
            print('updating character list');
          });
        }
    );

    sessionChars = new List();
    characters.forEach((char) {
      int armorClass = 0;

      if (char.sessionId == session.sessionId) {
        if (char.equipment != null) {
          char.equipment.forEach(
                  (item) {
                if (item != null && !item.isWep)
                  armorClass += item.val;
              }
          );
        }
        // all our characters and makes a card for each
        sessionChars.add(new Container( //this is our 'card'
            margin: const EdgeInsets.only(bottom: 8.0),
            child: new SessionCharacterItem(char: char,
                armorClass: armorClass) //give our card a character to use
        ));
      }
    });
  }

  addCharToSession(BuildContext context) async {
    await (showDialog(context: context,
      builder: (_) => new SimpleDialog(
        children: <Widget>[
          AddCharDialogWidget(session),
        ],
      ),
    ));

    setState(() {
      sessionChars = new List();
      characters.forEach((char) {
        int armorClass = 0;

        if (char.sessionId == session.sessionId) {
          if (char.equipment != null) {
            char.equipment.forEach(
                    (item) {
                  if (item != null && !item.isWep)
                    armorClass += item.val;
                }
            );
          }
          // all our characters and makes a card for each
          sessionChars.add(new Container( //this is our 'card'
              margin: const EdgeInsets.only(bottom: 8.0),
              child: new SessionCharacterItem(char: char,
                  armorClass: armorClass) //give our card a character to use
          ));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
          itemExtent: SessionCharacterItem.height,
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),//adds padding between cards and screen
          children: sessionChars
      ),
      floatingActionButton: new FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {addCharToSession(context);}
      ),
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
  List<Widget> sessionChars;

  AllCharactersTabState(this.session) {
    sessionChars = new List();
    characters.forEach((char) {
      int armorClass = 0;

      if (char.sessionId == session.sessionId) {
        if (char.equipment != null) {
          char.equipment.forEach(
                  (item) {
                if (item != null && !item.isWep)
                  armorClass += item.val;
              }
          );
        }
        // all our characters and makes a card for each
        sessionChars.add(new Container( //this is our 'card'
            margin: const EdgeInsets.only(bottom: 8.0),
            child: new SessionCharacterItem(char: char,
                armorClass: armorClass) //give our card a character to use
        ));
      }
    });
  }

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
          return Column(
              children: [
                new ListTile(
                  leading: new CircleAvatar(
                    backgroundImage: new AssetImage('assets/placeholder.jpg'),
                  ),
                  title: new Text('$item'),
                  subtitle: const Text(''),
                ),
                // users chars
                Column(
                    children: sessionChars
                )
              ]
          );
        });
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