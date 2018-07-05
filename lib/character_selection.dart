import 'dart:io';
import 'dart:math';

import 'package:dnd_301_final/app_data.dart';
import 'package:dnd_301_final/character_creation.dart';
import 'package:dnd_301_final/character_preview.dart';
import 'package:dnd_301_final/menu.dart';
import 'package:dnd_301_final/races_and_classes.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class LocalCharacter {

  LocalCharacter({
    this.assetName  = 'assets/character_images/mage.jpg',
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
  });

  LocalCharacter.image({
    this.assetName,
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
    imageisFile = true,
  });

  final String assetName;
  final String title;

  final ClassType charClass;
  final Race charRace;
  final String charGender;

  final int strength;
  final int dexterity;
  final int constitution;
  final int intelligence;
  final int wisdom;
  final int charisma;

  final String background;
  final String personality;
  final String ideals;
  final String bonds;
  final String flaws;
  final String featuresTraits;

  bool imageIsFile = false;
  Race race;
  ClassType classType;

  bool isValid(){
    return (title != null && charClass != null && charRace != null && charGender != null);
  }
}

final List<LocalCharacter> characters = <LocalCharacter>[
  new LocalCharacter(
    assetName: 'assets/character_images/knight.jpg',
    title: 'James',
    charClass: typeClasses.elementAt(2),
    charRace: races.elementAt(22),
    charGender: 'Female',
    strength: 6,
    dexterity: 2,
    constitution: 6,
    intelligence: 2,
    wisdom: 2,
    charisma: 2
  ),
  new LocalCharacter(
    assetName: 'assets/character_images/mage.jpg',
    title: 'Dorian',
    charClass: typeClasses.elementAt(6),
    charRace: races.elementAt(22),
    charGender: 'Male',
    strength: 2,
    dexterity: 2,
    constitution: 2,
    intelligence: 5,
    wisdom: 5,
    charisma: 5
  ),
  new LocalCharacter(
    assetName: 'assets/character_images/archer.jpg',
    title: 'Elana',
    charClass: typeClasses.elementAt(8),
    charRace: races.elementAt(19),
    charGender: 'Trap',
    strength: 3,
    dexterity: 5,
    constitution: 2,
    intelligence: 5,
    wisdom: 4,
    charisma: 1
  ),
];

class CharacterItem extends StatelessWidget {
  CharacterItem({ Key key, @required this.char })
      : assert(char !=null), //if it receives a null character object to populate the card, fatal error
        super(key: key);

  static const double height = 187.0; // original value was 366.0
  final LocalCharacter char;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);//copy theme data from parent
    final TextStyle titleStyle = theme.textTheme.headline.copyWith(color: Colors.white);//make our title text look nice
    final TextStyle descriptionStyle = theme.textTheme.subhead; //give our description a matching style

    SizedBox photoAndTitle;

    if(char.imageIsFile)
    {
      photoAndTitle = new SizedBox(
        height: 133.0, // 184.0 is original height
        child: new Stack(//stacks allow us to place widgets on top of each other
          children: <Widget>[
            new Positioned.fill(//add image to bottom of stack
              child: new Image.file(
                new File(char.assetName),
                fit: BoxFit.cover,//fit image to box
                alignment: Alignment.topCenter,
              ),
            ),
            new Positioned(//positioned widgets can be moved within their parent (aka stack)
              bottom: 16.0,
              left: 16.0,
              right: 16.0,
              child: new FittedBox(//new box, fitted to remaining space
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,//place box left
                child: new Text(char.title,  //place a Text widget inside - aka our title - which is above our image on the stack
                  style: titleStyle,
                ),
              ),
            ),
          ],
        ),
      );
    }
    else
    {
      photoAndTitle = new SizedBox(
        height: 133.0, // 184.0 is original height
        child: new Stack(//stacks allow us to place widgets on top of each other
          children: <Widget>[
            new Positioned.fill(//add image to bottom of stack
              child: new Image.asset(
                char.assetName,
                fit: BoxFit.cover,//fit image to box
                alignment: Alignment.topCenter,
              ),
            ),
            new Positioned(//positioned widgets can be moved within their parent (aka stack)
              bottom: 16.0,
              left: 16.0,
              right: 16.0,
              child: new FittedBox(//new box, fitted to remaining space
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,//place box left
                child: new Text(char.title,  //place a Text widget inside - aka our title - which is above our image on the stack
                  style: titleStyle,
                ),
              ),
            ),
          ],
        ),
      );
    }

    //a box that is of explicit size



    // description
    Expanded description = new Expanded(
      child: new Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0), //padding from Left Top Right Bottom
        child: new DefaultTextStyle( //text widget to pass a text styling down
          softWrap: false,
          overflow: TextOverflow.ellipsis,//when text is too much for a container it should elipse (...)
          style: descriptionStyle,
          child: new Row(  //add a column to allow our text to aign on x(horizontal) axis
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text(char.charRace.name), //our text widget with our description
              new Text(char.charClass.name), //our text widget with our description
              new Text(char.charGender), //our text widget with our description
            ],
          ),
        ),
      ),
    );

    GestureDetector card = new GestureDetector(
      child: new Card(child: new Column(
        //move to crossaxis (aka horizontal as we are vertical)'s start (left)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            photoAndTitle,
            description
          ]
      )),
    );

    SizedBox imageDisplay;

    if(char.imageIsFile)
    {
      imageDisplay  = new SizedBox( //holds our image
          height: 184.0,
          child: new Stack( //this stack is redundant - was originally to place text name over image
              children: <Widget>[
                new Positioned.fill(
                child: new Image.file(
                    new File(char.assetName),
                    fit: BoxFit.fitWidth,//fit image to box
                    alignment: Alignment.topCenter,
                  ),
                )
            ]
          )
      );
    }
    else
    {
     imageDisplay = new SizedBox( //holds our image
          height: 184.0,
          child: new Stack( //this stack is redundant - was originally to place text name over image
              children: <Widget>[
                new Positioned.fill(
                    child: new Image.asset(
                      char.assetName,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    )
                )
              ]
          )
      );
    }

    // A detailed view of the character that is called when a character card is tapped
    ListView detailedView = new ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          imageDisplay,
          new Row( //allows us to place items consecutively on the horizontal
            children: <Widget>[
              new Padding(  //padding on top and bottom to space from image box and description
                padding: new EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                child: new Text(char.title,  //text box with name
                  style: titleStyle,
                  textAlign: TextAlign.left,),//aligned left of row
              ),
              const SizedBox(), //all rows must contain the same amount of columns
              //so we use a 'blank' widget to fill holes in our 'table'
            ],
          ),
          new Row( //allows us to place items consecutively on the horizontal
              children: <Widget>[
                new Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 4.0),
                    child: new Container(
                      key: key,
                      child: new Text('Class:', style: descriptionStyle),//our description
                    )
                ),
                new Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 4.0),
                    child: new Container(
                      key: key,
                      child: new Text(char.charClass.name, style: descriptionStyle),//our description
                    )
                ),
              ]
          ),
          new Row( //allows us to place items consecutively on the horizontal
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 4.0),
                child: new Container(
                  key: key,
                  child: new Text('Race:', style: descriptionStyle),//our description
                )
            ),
              new Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 4.0),
                child: new Container(
                  key: key,
                  child: new Text(char.charRace.name, style: descriptionStyle),//our description
                )
              ),
            ]
          ),
          new Row( //allows us to place items consecutively on the horizontal
              children: <Widget>[
                new Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 4.0),
                    child: new Container(
                      key: key,
                      child: new Text('Gender:', style: descriptionStyle),//our description
                    )
                ),
                new Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 4.0),
                    child: new Container(
                      key: key,
                      child: new Text(char.charGender, style: descriptionStyle),//our description
                    )
                ),
              ]
          ),

         new Text(
           'Stats: ',
           style: titleStyle,
         ),

        new Container(
          height: AppData.screenHeight/4,
          child: new Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  flex: 1,
                  child: new Column(
                    children: <Widget>[
                      ///main stats
                      new Expanded(child: Stat.Int(value: char.intelligence,hasButtons: false,),),
                      new Expanded(child: Stat.Str(value: char.strength,hasButtons: false,),),
                      new Expanded(child: Stat.Dex(value: char.dexterity,hasButtons: false,),),
                    ],
                  ),
                ),
                new Expanded(
                  flex: 1,
                  child: new Column(
                    children: <Widget>[
                      ///main stats
                      new Expanded(child: Stat.Wis(value: char.wisdom,hasButtons: false,),),
                      new Expanded(child: Stat.Chr(value: char.charisma,hasButtons: false,),),
                      new Expanded(child: Stat.Con(value: char.constitution,hasButtons: false,),),
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

        ]
    );

    return new SafeArea(
        top: false,
        bottom: false,
        // Allow user to tap card
        child: new GestureDetector(
            onTap: () {
              if(!CharacterSelection.inPreviewState)
                Navigator.of(context).push(new MaterialPageRoute<Null>(
                builder: (BuildContext context) {
                  //build a new widget
                  return new Scaffold( //new scaffold
                      appBar: new AppBar(
                        title: const Text('Character Details'), //title of view
                      ),
                      body: detailedView
                  );
                }
            ));},
            child: new Container(
                padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                height: height,
                child: card
            )
        )
    );
  }
}

class CharacterSelection extends StatefulWidget {
  static String tag = 'character-selection';
  static bool inPreviewState = false;

  @override
  CharacterSelectionState createState() => new CharacterSelectionState();
}

class CharacterSelectionState extends State<CharacterSelection> with SingleTickerProviderStateMixin
{

  AnimationController controller;
  Animation<double> animation;
  double screenWidthOffset = AppData.screenWidth*0.75;

  @override
  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation = new Tween(begin: 0.0, end: screenWidthOffset).animate(controller);
//    controller.forward();
  }

  @override
  Widget build(BuildContext context) {

    //setup for animation
//    CharacterSwipePreview.screenOffset = MediaQuery.of(context).size.width*-0.75;
//    controller = new AnimationController(
//        duration: const Duration(milliseconds: 200), vsync: this);
//    animation = new Tween(begin: 0.0, end: MediaQuery.of(context).size.width*0.75).animate(controller);
////    controller.forward();


    double swipeStart;
    double swipeEnd;


    return new Scaffold(
            body: new Stack(
              children: <Widget>[
                new ListView(
                    itemExtent: CharacterItem.height,
                    padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),//adds padding between cards and screen
                    children: characters.map((LocalCharacter char) {  //this goes through all our characters and makes a card for each
                      return new Container(       //this is our 'card'
                          margin: const EdgeInsets.only(bottom: 8.0),
                          child: new GestureDetector(
                              onHorizontalDragStart: (start){swipeStart=start.globalPosition.dx;},
                              onHorizontalDragUpdate: (update){swipeEnd=update.globalPosition.dx;},//open preview
                              onHorizontalDragEnd: (end){
                                                            print('Start: $swipeStart \nEnd: $swipeEnd');
                                                            if( swipeEnd>swipeStart && sqrt(pow((swipeEnd-swipeStart),2)) < 300) {
                                                              controller.forward();
                                                              CharacterSelection.inPreviewState=true;
                                                              CharacterSwipePreview.char = char;
                                                            }
                                                            swipeStart = swipeEnd = 0.0;
                              },
                              child: new CharacterItem(char: char))  //give our card a character to use
                      );
                    }).toList()
                ),
                new CharacterSwipePreview(animation: animation,controller: controller, screenOffset: screenWidthOffset,),
              ],
            ),
            drawer: new Menu(),
            appBar: new AppBar( //AppBars are the bars on top of the view
                title: const Text('Character Selection'),
            ),
            floatingActionButton: new FloatingActionButton(
                child: new Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                      context, new MaterialPageRoute<DismissDialogAction>(
                    builder: (
                        BuildContext context) => new FullScreenDialog(),
                    fullscreenDialog: true,
                  ));
                }
            )
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }

}
