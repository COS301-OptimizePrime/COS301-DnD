import 'package:flutter/material.dart';
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

  setView(bool createChar) {
    // TODO: get chars and see if in session
    AppData.getUseCharacters().whenComplete((){setState(() {
          //update characters
          print('updating character list');
        });}
    );

    inSession = new List(characters.length);

    List<Widget> characterSelects = new List(inSession.length);

    for (int i = 0; i < characters.length; i++) {
      inSession[i] = characters.elementAt(i).sessionId != session.sessionId;
      characterSelects[i] = new CharacterSelectTile(
        index: i,
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
              if(widget._formKey.currentState.validate()){

                widget._formKey.currentState.save();
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
    );
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
              setView(true);
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
              setView(false);
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

class CharacterSelectTile extends StatelessWidget {
  final int index;
  final bool value;
  final ValueChanged<bool> onChanged;

  CharacterSelectTile({@required this.index, @required this.value, @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return new CheckboxListTile(value: value, onChanged: onChanged);
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

  addCharToSession(BuildContext context) async {
    await (showDialog(context: context,
      builder: (_) => new SimpleDialog(
        children: <Widget>[
          AddCharDialogWidget(session),
        ],
      ),
    ));

    if(characters != null) {
      characters.forEach((char) {
        char.sessionId = session.sessionId;
        AppData.updateCharacter(char);
      });
    }

    setState(() {
      //show new item
    });
  }

  @override
  Widget build(BuildContext context) {
//    LocalCharacter char = new LocalCharacter(
//        title: 'James',
//        charClass: typeClasses.elementAt(2),
//        charRace: races.elementAt(22),
//        charGender: 'Female',
//        strength: 6,
//        dexterity: 2,
//        constitution: 6,
//        intelligence: 2,
//        wisdom: 2,
//        charisma: 2
//    );
//    char.equipment = new List<LocalEquipment>();
//    char.equipment.add(LocalEquipment("Blocker", "Shield", 2));
//    sessionChars.add(char);

    return Scaffold(
      body: new ListView(
          itemExtent: SessionCharacterItem.height,
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),//adds padding between cards and screen
          children: characters.map((LocalCharacter char) {
            int armorClass = 0;

            if (char.sessionId != session.sessionId) {
              return null;
            }

            if (char.equipment != null) {
              char.equipment.forEach(
                      (item) {
                    if (item != null && !item.isWep)
                      armorClass += item.val;
                  }
              );
            }
            // all our characters and makes a card for each
            return new Container(       //this is our 'card'
                margin: const EdgeInsets.only(bottom: 8.0),
                child: new SessionCharacterItem(char: char, armorClass: armorClass)  //give our card a character to use
            );
          }).toList()
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

  AllCharactersTabState(this.session);

  @override
  Widget build(BuildContext context) {
    final List<LocalCharacter> sessionChars = new List();

    // TODO: get session chars

    return new ListView(
        itemExtent: SessionCharacterItem.height,
        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),//adds padding between cards and screen
        children: sessionChars.map((LocalCharacter char) {  //this goes through all our characters and makes a card for each
          return new Container(       //this is our 'card'
              margin: const EdgeInsets.only(bottom: 8.0),
              child: new SessionCharacterItem(char: char)  //give our card a character to use
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