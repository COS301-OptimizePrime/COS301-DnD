import 'dart:async';
import 'dart:math';

import 'package:dnd_301_final/app_data.dart';
import 'package:dnd_301_final/backend/server.pb.dart';
import 'package:dnd_301_final/character/character_creation.dart';
import 'package:dnd_301_final/character/character_preview.dart';
import 'package:dnd_301_final/character/races_and_classes.dart';
import 'package:dnd_301_final/journals/monster_journal_new.dart';
import 'package:dnd_301_final/menu.dart';
import 'package:dnd_301_final/session/game_screen.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LocalCharacter {
  LocalCharacter({
    this.characterId,
    this.sessionId,
    this.title,
    this.charClass,
    this.charRace,
    this.charGender,
    this.strength,
    this.dexterity,
    this.constitution,
    this.intelligence,
    this.wisdom,
    this.charisma,
    this.background = '',
    this.personality = '',
    this.ideals = '',
    this.bonds = '',
    this.flaws = '',
    this.featuresTraits = '',
    this.equipment,
    this.xp,
    this.currentHp,
    this.maxHp,
    this.armorValue = 0,
  });

  final String title;
  String characterId;
  String sessionId;
  String sessionName;

  ClassType charClass;
  Race charRace;
  String charGender;
  List<LocalEquipment> equipment;

  int strength;
  int dexterity;
  int constitution;
  int intelligence;
  int wisdom;
  int charisma;

  String background;
  String personality;
  String ideals;
  String bonds;
  String flaws;
  String featuresTraits;

  Race race;
  ClassType classType;

  int xp;
  int currentHp;
  int maxHp;
  int armorValue;

  bool isValid() {
    return (title != null &&
        charClass != null &&
        charRace != null &&
        charGender != null);
  }

//  void set(LocalCharacter other) {
//    title = other.title;
//    characterId = other.characterId;
//    sessionId = other.sessionId;
//    sessionName = other.sessionName;
//
//    charClass = other.charClass;
//    charRace = other.race;
//    charGender = other.charGender;
//    equipment = other.equipment;
//
//    strength  = other.strength;
//    dexterity =  other.dexterity;
//    constitution =  other.constitution;
//    intelligence =  other.intelligence;
//    wisdom =  other.wisdom;
//    charisma =  other.charisma;
//
//    background =  other.background;
//    personality =  other.personality;
//    ideals =  other.ideals;
//    bonds =  other.bonds;
//    flaws =  other.flaws;
//    featuresTraits =  other.featuresTraits;
//
//    race =  other.race;
//    classType =  other.classType;
//  }
}

final List<LocalCharacter> characters = new List();

///the list item that shows all a users characters in character selection
class CharacterItem extends StatelessWidget {
  CharacterItem({Key key, @required this.lightChar})
      : //if it receives a null character object to populate the card, fatal error
        super(key: key);

  static const double height = 160.0; // original value was 366.0
//  LocalCharacter char;
  final LightCharacter lightChar;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context); //copy theme data from parent
    final TextStyle titleStyle = theme.textTheme.headline
        .copyWith(color: Colors.white); //make our title text look nice


//    if (char == null) return Container();

//    SizedBox title = new SizedBox(
//        height: 60.0,
//        child: new Padding(
//          padding: new EdgeInsets.only(left: 16.0),
//          child: new FittedBox(
//            //new box, fitted to remaining space
//            fit: BoxFit.scaleDown,
//            alignment: Alignment.centerLeft, //place box left
//            child: new Text(
//              char.title, //place a Text widget inside - aka our title - which is above our image on the stack
//              style: titleStyle,
//            ),
//          ),
//        ));

    Card card = new Card(
        child: new CharacterLightView(lightChar: lightChar, titleStyle: titleStyle));

    return new SafeArea(
        top: false,
        bottom: false,
        // Allow user to tap card
        child: new GestureDetector(

            ///called when a user taps a character in the character selection screen
            onTap: () {
              if (!CharacterSelection.inPreviewState)
                Navigator.of(context).push(new MaterialPageRoute<DismissDialogAction>(
                    builder: (BuildContext context) {
                  //build a new widget
                  return new CharacterDetailsView.load(lightChar: lightChar);
                }
                )).then((val) {
                  if(val==DismissDialogAction.delete) CharacterSelectionState.updateCharacters(CharacterSelectionState.currentState);
                });
            },
            child: new Container(
                padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                height: height,
                child: card)));
  }
}

class CharacterLightView extends StatelessWidget {
  const CharacterLightView({
    Key key,
    @required this.lightChar,
    @required this.titleStyle,
//    this.armorValue,
  }) : super(key: key);

  final LightCharacter lightChar;
  final TextStyle titleStyle;
//  final Shield armorValue;

  @override
  Widget build(BuildContext context) {
    int level;
    return new Column(
        //move to crossaxis (aka horizontal as we are vertical)'s start (left)
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ///@todo: add rich text
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(text: TextSpan(
                style: TextStyle(
                  color: ClassType.getClass(lightChar.characterClass).color,
                  fontSize: 23.0
                ),
                text: '${lightChar.name}\n',
                children: <TextSpan>[
                  TextSpan(
                    text: '     ${lightChar.race}   - ',
                    style: TextStyle(color: Colors.white70,fontSize: 13.0),
                  ),
                  TextSpan(
                    text: '  ${lightChar.characterClass}',
                    style: traitsTitleStyle,
                  )
                ]
            )),
          ),
      new Padding(
          padding: new EdgeInsets.only(left: 16.0, right: 16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[

              Container(
                height: 45.0,
                child: ClassIcon.str(lightChar.characterClass)
              ),
              Container(
                  height: 20.0,
                  child: GenderIcon.str(lightChar.gender)
              ),

              Container(
                child: Shield.value(
                  (lightChar.hitpoints.armorClass!=null)? lightChar.hitpoints.armorClass : 0,),
              ) ,
              HpIcon(
                diameter: 60.0,
                maxHp: lightChar.hitpoints.maxHitpoints,
                currentHp: lightChar.hitpoints.currentHitpoints,
                interactable: false,
              ),
              new Column(
                children: <Widget>[
//                  new Text(lightChar.gender),

//                  Text("Lvl: ${level = calcLevel(lightChar.xp)}"),
                  LevelWidget(lightChar.xp),
                  Text("P: ${calcProf(calcLevel(lightChar.xp))}")
//                  new Text((lightChar.sessionId == null)
//                      ? "No Session"
//                      : lightChar.sessionId), //our text widget with our description
                ],
              )
            ],
          ))
    ]);
  }


}

class LevelWidget extends StatelessWidget {

  final int xp;

  LevelWidget(this.xp);

  @override
  Widget build(BuildContext context) {

    int level = calcLevel(xp);
    double percent = calcPercentToNextLevel(level,xp);

    return  Container(
      child: new CircularPercentIndicator(
        radius: 30.0,
        lineWidth: 3.0,
        percent: percent,
        center: Text('$level'),
        backgroundColor: Colors.grey,
        progressColor: Colors.blue,
      ),
    );
  }
}


class ClassIcon extends StatelessWidget {

  final ClassType classType;

  ClassIcon({this.classType});
  ClassIcon.str(String c) : classType = ClassType.getClass(c);

  @override
  Widget build(BuildContext context) {
    var image = Image.asset('assets/class_images/icons/${classType.name.toLowerCase()}-icon.png',color: classType.color,);
    if(image==null)
      return Image.asset('assets/placeholder.jpg',);
    else
      return image;
  }
}


class GenderIcon extends StatelessWidget{

  final bool male;
  GenderIcon({this.male});

  GenderIcon.str(String gender): male = (gender=='Male');

  @override
  Widget build(BuildContext context){

    if(male)
    return Image.asset(
       'assets/icon_assets/male.png',color: Colors.lightBlue,
     );
    else
      return Image.asset(
        'assets/icon_assets/female.png',color: Colors.pinkAccent,
      );
  }
}

class ClassPreview extends StatelessWidget {
  const ClassPreview({
    Key key,
    @required this.charClass,
  }) : super(key: key);


  final ClassType charClass;

  @override
  Widget build(BuildContext context) {
    if(charClass==null) return Container();
    return new SizedBox(
      height: 60.0,
      width: 60.0,
      child: new Stack(children: <Widget>[
        new Positioned.fill(
            //add image to bottom of stack
            child: new Image.asset(
          'assets/class_images/' + charClass.name + '.png',
          fit: BoxFit.scaleDown,
        )),
        new Positioned(
          //positioned widgets can be moved within their parent (aka stack)
          bottom: 1.0,
          left: 1.0,
          right: 1.0,
          child: new FittedBox(
              //new box, fitted to remaining space
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft, //place box left
              child: Text(charClass.name)),
        ),
      ]),
    );
  }
}

class RacePreview extends StatelessWidget {
  const RacePreview({
    Key key,
    @required this.race,
  }) : super(key: key);

  final Race race;

  @override
  Widget build(BuildContext context) {
    if(race==null) return Container();
    return new SizedBox(
      height: 60.0,
      width: 60.0,
      child: new Stack(children: <Widget>[
        new Positioned.fill(
            //add image to bottom of stack
            child: new Image.asset(
          'assets/race_images/' + race.getImage() + '.png',
          fit: BoxFit.scaleDown,
        )),
        new Positioned(
          //positioned widgets can be moved within their parent (aka stack)
          bottom: 1.0,
          left: 1.0,
          right: 1.0,
          child: new FittedBox(
              //new box, fitted to remaining space
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft, //place box left
              child: Text(race.name)),
        ),
      ]),
    );
  }
}

class CharacterDetailsView extends StatefulWidget {
//  const CharacterDetailsView({
//    Key key,
//    @required this.char,
//  }) :  lightChar = null, super(key: key);

  CharacterDetailsView ({this.char,this.editable=true,this.deletable=true,this.fullView=true}) : lightChar= null;
  CharacterDetailsView.load({Key key, @required this.lightChar, this.editable = true, this.deletable = true,this.fullView=true}) : char=null;

  final LocalCharacter char;
  final LightCharacter lightChar;
  final bool editable;
  final bool deletable;
  final bool fullView;

  @override
  _CharacterDetailsViewState createState() => _CharacterDetailsViewState(char);
}

class _CharacterDetailsViewState extends State<CharacterDetailsView> {

  _CharacterDetailsViewState(this.char);

  LocalCharacter char;

  Future<LocalCharacter> loadCharacter() async
  {

    final charResponse = await (AppData.getCharacterById(widget.lightChar.characterId));
    //may return null in case of error
    return charResponse;

//    char.set(charResponse);
  }


  @override
  initState()
  {
    super.initState();
    if(char!=null) return;

    loadCharacter().then((c){
      setState(() {
        //update view
        char = c;
      });
    });
  }


  // A detailed view of the character that is called when a character card is tapped

  @override
  Widget build(BuildContext context) {

    if(char==null) return Material(child: Center(child: Text('Just a moment...',style: TextStyle(fontSize: 15.0,fontStyle: FontStyle.normal),softWrap: false,)));

    return new Scaffold(
        //new scaffold
        appBar: (widget.fullView)?
          new AppBar(
          title: const Text('Character Details'), //title of view
          actions: <Widget>[
            (widget.editable)?
            IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator
                      .push(
                          context,
                          new MaterialPageRoute<LocalCharacter>(
                            builder: (BuildContext context) =>
                                new CreateCharacterDialog(
                                  char: char,
                                ),
                            fullscreenDialog: true,
                          ))
                      .then((val) {
                    if (val != null)
                    setState(() {
                      char = val;
                    });
                  });
                })
                : null
          ],
        ) : null,
        body: new ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              Text(
                char.title, //place a Text widget inside - aka our title - which is above our image on the stack
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  RacePreview(
                    race: char.charRace,
                  ),
                  ClassPreview(
                    charClass: char.charClass,
                  ),
                  Container(
                    height: 20.0,
                    child: GenderIcon.str(char.charGender),
                  )
                ],
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: new Divider(
                  color: Theme.of(context).accentColor,
                ),
              ),
              new Text(
                'Stats: ',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              new Container(
                height: AppData.screenHeight / 4,
                child: new Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        flex: 1,
                        child: new Column(
                          children: <Widget>[
                            ///main stats
                            new Expanded(
                              child: Stat.Int(
                                value: char.intelligence,
                                hasButtons: false,
                              ),
                            ),
                            new Expanded(
                              child: Stat.Str(
                                value: char.strength,
                                hasButtons: false,
                              ),
                            ),
                            new Expanded(
                              child: Stat.Dex(
                                value: char.dexterity,
                                hasButtons: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      new Expanded(
                        flex: 1,
                        child: new Column(
                          children: <Widget>[
                            ///main stats
                            new Expanded(
                              child: Stat.Wis(
                                value: char.wisdom,
                                hasButtons: false,
                              ),
                            ),
                            new Expanded(
                              child: Stat.Chr(
                                value: char.charisma,
                                hasButtons: false,
                              ),
                            ),
                            new Expanded(
                              child: Stat.Con(
                                value: char.constitution,
                                hasButtons: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              new Text(char.background),
              new Text(char.personality),
              new Text(char.ideals),
              new Text(char.bonds),
              new Text(char.flaws),
              new Text(char.featuresTraits),
              new Divider(),
              Shield.list(equipmentList: char.equipment),
              Container(
                width: AppData.screenWidth,
                height: AppData.screenHeight / 2,
                child: (char.equipment != null && char.equipment.length > 0)
                    ? EquipmentList(char: char)
                    : new Column(),
              ),
            (widget.deletable)?
              new Center(
                child: new Container(
                  width: AppData.screenWidth / 3,
                  height: AppData.screenHeight / 20,
                  child: new DeleteButton(charId: char.characterId),
                ),
              )
                : Container(width: 0.0,height: 0.0,child: null,)
            ])
    );
  }
}

class EquipmentList extends StatefulWidget {
  final LocalCharacter char;
  final bool addItem;
  final bool shield;
  final double height;

  EquipmentList({
    this.char,
    this.shield = false,
    this.height = 200.0,
  }) : addItem=false;

  EquipmentList.add({
    this.char,
    this.shield=false,
    this.height = 200.0,
  }) : addItem=true;


  static Future<LocalEquipment> addNewItem(BuildContext context) async
  {
    LocalEquipment newItem = await (showDialog(context: context,
      builder: (_) => new SimpleDialog(
        children: <Widget>[
          NewItemDialogWidget(),
        ],
      ),
    ));

    return newItem;
  }


  @override
  _EquipmentListState createState() => _EquipmentListState();
}

class _EquipmentListState extends State<EquipmentList> {
  int index = 0;
  bool busy = false;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        (widget.shield)? Shield.list(equipmentList: widget.char.equipment,diameter: 80.0,) : Container(),
        Container(
          height: widget.height,
          child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: (widget.addItem)? widget.char.equipment.length +1 : widget.char.equipment.length,
              itemBuilder: (context, index) {

                if(index==widget.char.equipment.length)
                  return GestureDetector(
                    onTap: () async{
                      if(busy) return;
                      busy = true;
                      await EquipmentList.addNewItem(context).then((LocalEquipment e) async{
                        widget.char.equipment.add(e);
                        if(widget.addItem)
                          await AppData.updateCharacter(widget.char);

                        setState(() {
                          //update view
                          print('updated char');
                        });
                      });
                      busy = false;
                    },
                    child: Container(
                      child: EquipmentWidget.add(),
                      padding: EdgeInsets.all(5.0),
                    ),
                  );

                final item = widget.char.equipment[index];

                if (item == null) return Container();

                return Dismissible(
                  child: new Container(
                    padding: EdgeInsets.all(5.0),
                    child: EquipmentWidget(
                      item: item,
                    ),
                  ),
                  // Each Dismissible must contain a Key. Keys allow Flutter to
                  // uniquely identify Widgets.
                  key: UniqueKey(),
                  // We also need to provide a function that will tell our app
                  // what to do after an item has been swiped away.
                  onDismissed: (direction) {

                    ///@todo: implement confirm action
                    widget.char.equipment.removeAt(index);

                    AppData.removeEquipment(widget.char, index);

                    setState(() {
                      //redraw list
                    });

                    Scaffold
                        .of(context)
                        .showSnackBar(SnackBar(content: Text("$item deleted")));
                  },
                  background: Container(color: Colors.red),
                );
              }),
        ),
      ],
    );
  }
}

class DeleteButton extends StatefulWidget {
  final String charId;

  DeleteButton({
    this.charId,
  });

  @override
  _DeleteButtonState createState() => _DeleteButtonState();
}

class _DeleteButtonState extends State<DeleteButton> {
  bool confirmDelete = false;

  delete() {
    if (confirmDelete) {
      AppData.deleteCharacter(widget.charId).whenComplete((){Navigator.pop(context,DismissDialogAction.delete);});

    } else {
      setState(() {
        confirmDelete = true;
        message = "Confirm?";
      });
    }
  }

  String message = "Delete";
  @override
  Widget build(BuildContext context) {
    return new FlatButton(
      onPressed: () {
        delete();
      },
      child: new Container(
//                    width: AppData.screenWidth/8,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            Text(message),
            Icon(Icons.delete),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
      color: Colors.redAccent,
    );
  }
}

class CharacterSelection extends StatefulWidget {
  static String tag = 'character-selection';
  static bool inPreviewState = false;

  @override
  CharacterSelectionState createState() => new CharacterSelectionState();
}

class CharacterSelectionState extends State<CharacterSelection>
    with SingleTickerProviderStateMixin {

  static CharacterSelectionState currentState;

  CharacterSelectionState() {
    updateCharacters(this);
  }

  AnimationController controller;
  Animation<double> animation;
  double screenWidthOffset = AppData.screenWidth * 0.75;

  @override
  initState() {
    super.initState();
    currentState = this;
    controller = new AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation =
        new Tween(begin: 0.0, end: screenWidthOffset).animate(controller);
//    controller.forward();
  }

  static Future<Null> updateCharacters(CharacterSelectionState state) async {
    AppData.updateUserLightCharacters().whenComplete(() {
      print('updating character list');
      state.setState(() {
        //update list
        CharacterSelectionState.currentState = state;
      });
    });

    return null;
  }

  Future<Null> refresh() async
  {
    await updateCharacters(this);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double swipeStart;
    double swipeEnd;

    return new Scaffold(
        body: new Stack(
          children: <Widget>[
            new RefreshIndicator(
              onRefresh: refresh,
              child: new ListView(
                  itemExtent: CharacterItem.height,
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  //adds padding between cards and screen
                  children: AppData.lightCharacters.map((LightCharacter char) {
                    //this goes through all our characters and makes a card for each
                    return new Container(
                        //this is our 'card'
                        margin: const EdgeInsets.only(bottom: 8.0),
                        child: new GestureDetector(
                            onHorizontalDragStart: (start) {
                              swipeStart = start.globalPosition.dx;
                            },
                            onHorizontalDragUpdate: (update) {
                              swipeEnd = update.globalPosition.dx;
                            }, //open preview
                            onHorizontalDragEnd: (end) {
                              print('Start: $swipeStart \nEnd: $swipeEnd');
                              if (swipeEnd > swipeStart &&
                                  sqrt(pow((swipeEnd - swipeStart), 2)) < 300) {
                                controller.forward();
                                CharacterSelection.inPreviewState = true;
//                                                                CharacterSwipePreview.char = char;
                                CharacterSwipePreview.setChar(char);
                              }
                              swipeStart = swipeEnd = 0.0;
                            },
                            child: new CharacterItem(
                                lightChar:
                                    char)) //give our card a character to use
                        );
                  }).toList()),
            ),
            new CharacterSwipePreview(
              animation: animation,
              controller: controller,
              screenOffset: screenWidthOffset,
            ),
          ],
        ),
        drawer: new Menu(),
        appBar: new AppBar(
          //AppBars are the bars on top of the view
          title: const Text('Character Selection'),
        ),
        floatingActionButton: new FloatingActionButton(
            child: new Icon(Icons.add),
            onPressed: () {
              Navigator
                  .push(
                      context,
                      new MaterialPageRoute<bool>(
                        builder: (BuildContext context) =>
                            new CreateCharacterDialog(),
                        fullscreenDialog: true,
                      ))
                  .then((val) {
                if (val == true) updateCharacters(this);
              });
            }));
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}

/*
Spell Slots per Spell Level Lvl.

lvl   1 	2 	3 	4 	5 	6 	7 	8 	9 'th tier spell
1st 	2 	— 	— 	— 	— 	— 	— 	— 	—
2nd 	3 	— 	— 	— 	— 	— 	— 	— 	—
3rd 	4 	2 	— 	— 	— 	— 	— 	— 	—
4th 	4 	3 	— 	— 	— 	— 	— 	— 	—
5th 	4 	3 	2 	— 	— 	— 	— 	— 	—
6th 	4 	3 	3 	— 	— 	— 	— 	— 	—
7th 	4 	3 	3 	1 	— 	— 	— 	— 	—
8th 	4 	3 	3 	2 	— 	— 	— 	— 	—
9th 	4 	3 	3 	3 	1 	— 	— 	— 	—
10th 	4 	3 	3 	3 	2 	— 	— 	— 	—
11th 	4 	3 	3 	3 	2 	1 	— 	— 	—
12th 	4 	3 	3 	3 	2 	1 	— 	— 	—
13th 	4 	3 	3 	3 	2 	1 	1 	— 	—
14th 	4 	3 	3 	3 	2 	1 	1 	— 	—
15th 	4 	3 	3 	3 	2 	1 	1 	1 	—
16th 	4 	3 	3 	3 	2 	1 	1 	1 	—
17th 	4 	3 	3 	3 	2 	1 	1 	1 	1
18th 	4 	3 	3 	3 	3 	1 	1 	1 	1
19th 	4 	3 	3 	3 	3 	2 	1 	1 	1
20th 	4 	3 	3 	3 	3 	2 	2 	1 	1
 */


List<int> getSpellSlotsForCharacter(LocalCharacter char) => getSpellSlotsForLevel(calcLevel(char.xp));

List<int> getSpellSlotsForLevel(int level)
{

  assert(level!=null && level>0,'Level <$level> must not be null or less than zero');
  List<int> spells;

  switch(level)
  {
    case 1:
      spells = [2];
      break;
    case 2:
      spells = [3];
      break;
    case 3:
      spells=[4,2];
      break;
    case 4:
      spells=[4,3];
      break;
    case 5:
      spells=[4,3,2];
      break;
    case 6:
      spells=[4,3,3];
      break;
    case 7:
      spells=[4,3,3,1];
      break;
    case 8:
      spells=[4,3,3,2];
      break;
    case 9:
      spells=[4,3,3,3,1];
      break;
    case 10:
      spells=[4,3,3,3,2];
      break;
    case 11:
      spells=[4,3,3,3,2,1];
      break;
    case 12:
      spells=[4,3,3,3,2,1];
      break;
    case 13:
      spells=[4,3,3,3,2,1,1];
      break;
    case 14:
      spells=[4,3,3,3,2,1,1];
      break;
    case 15:
      spells=[4,3,3,3,2,1,1,1];
      break;
    case 16:
      spells=[4,3,3,3,2,1,1,1];
      break;
    case 17:
      spells=[4,3,3,3,2,1,1,1,1];
      break;
    case 18:
      spells=[4,3,3,3,3,1,1,1,1];
      break;
    case 19:
      spells=[4,3,3,3,3,2,1,1,1];
      break;
    case 20:
      spells=[4,3,3,3,3,2,2,1,1];
      break;
  }

  return spells;

}