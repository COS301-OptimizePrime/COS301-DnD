import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dnd_301_final/menu.dart';
import 'package:dnd_301_final/login_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

enum DismissDialogAction {
  cancel,
  discard,
  save,
}

class FullScreenDialog extends StatefulWidget {
  @override
  FullScreenDialogState createState() => new FullScreenDialogState();
}

class FullScreenDialogState extends State<FullScreenDialog> {
  bool _saveNeeded = false;

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  Future<bool> _onWillPop() async {
    if (!_saveNeeded)
      return true;

    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle = theme.textTheme.subhead.copyWith(color: theme.textTheme.caption.color);

    return await showDialog<bool>(
        context: context,
        child: new AlertDialog(
            content: new Text(
                'Discard new event?',
                style: dialogTextStyle
            ),
            actions: <Widget>[
              new FlatButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    Navigator.of(context).pop(false); // Pops the confirmation dialog but not the page.
                  }
              ),
              new FlatButton(
                  child: const Text('DISCARD'),
                  onPressed: () {
                    Navigator.of(context).pop(true); // Returning true to _onWillPop will pop again.
                  }
              )
            ]
        )
    ) ?? false;
  }

  final TextEditingController char_name = new TextEditingController();
  final TextEditingController char_class = new TextEditingController();
  final TextEditingController char_race = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return new Scaffold(
      appBar: new AppBar(
          title: const Text('Create Character'),
          actions: <Widget> [
            new FlatButton(
                child: new Text('SAVE', style: theme.textTheme.body1.copyWith(color: Colors.white)),
                onPressed: () {
                  Navigator.pop(context, DismissDialogAction.save);
                }
            )
          ]
      ),
      body: new Form(
          onWillPop: _onWillPop,
          child: new ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new Padding(  //padding on top and bottom to space from image box and description
                      padding: new EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                      child: new Text('Character Name',
                          style: theme.textTheme.title.copyWith(color: Colors.deepOrange)),
                    ),
                    new TextFormField(
                        controller: char_name,
                        decoration: new InputDecoration(
                          hintText: 'Type name here',
                        )
                    ),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new Padding(  //padding on top and bottom to space from image box and description
                      padding: new EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                      child: new Text('Character Class',
                          style: theme.textTheme.title.copyWith(color: Colors.deepOrange)),
                    ),
                    new TextFormField(
                        controller:char_class,
                        decoration: new InputDecoration(
                          hintText: 'Type class here',
                        )
                    ),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new Padding(  //padding on top and bottom to space from image box and description
                      padding: new EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                      child: new Text('Race',
                          style: theme.textTheme.title.copyWith(color: Colors.deepOrange)),
                    ),
                    new TextFormField(
                        controller: char_race,
                        decoration: new InputDecoration(
                          hintText: 'Type race here',
                        )
                    ),
                  ],
                ),
                new RaisedButton(
                  onPressed: getImage,
                  child: new Text('Pick Image'),
                ),
              ]
                  .map((Widget child) {
                return new Container(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    height: 96.0,
                    child: child
                );
              })
                  .toList()
          )
      ),
    );
  }
}

class Character {
  const Character({
    this.assetName,
    this.title,
    this.charClass,
    this.charRace,
  });

  final String assetName;
  final String title;
  final String charClass;
  final String charRace;

  bool get isValid => assetName != null && title != null && charClass != null && charRace != null;
}

final List<Character> characters = <Character>[
  const Character(
    assetName: 'character_images/knight.jpg',
    title: 'Sir',
    charClass: 'Knight',
    charRace: 'Human',
  ),
  const Character(
    assetName: 'character_images/mage.jpg',
    title: 'Dorian',
    charClass: 'Mage',
    charRace: 'Human',
  ),
  const Character(
    assetName: 'character_images/archer.jpg',
    title: 'Elana',
    charClass: 'Archer',
    charRace: 'Elf',
  ),
];

class CharacterItem extends StatelessWidget {
  CharacterItem({ Key key, @required this.char })
      : assert(char != null && char.isValid), //if it receives a null character object to populate the card, fatal error
        super(key: key);

  static const double height = 187.0; // original value was 366.0
  final Character char;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);//copy theme data from parent
    final TextStyle titleStyle = theme.textTheme.headline.copyWith(color: Colors.white);//make our title text look nice
    final TextStyle descriptionStyle = theme.textTheme.subhead; //give our description a matching style

    //a box that is of explicit size
    SizedBox photoAndTitle = new SizedBox(
      height: 136.0, // 184.0 is original height
      child: new Stack(//stacks allow us to place widgets on top of each other
        children: <Widget>[
          new Positioned.fill(//add image to bottom of stack
            child: new Image.asset(
              char.assetName,
              fit: BoxFit.cover,//fit image to box
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


    // description
    Expanded description = new Expanded(
      child: new Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0), //padding from Left Top Right Bottom
        child: new DefaultTextStyle( //text widget to pass a text styling down
          softWrap: false,
          overflow: TextOverflow.ellipsis,//when text is too much for a container it should elipse (...)
          style: descriptionStyle,
          child: new Column(  //add a column to allow our text to aign on x(horizontal) axis
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(char.charClass, //our text widget with our description
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis //overflow
              )
            ],
          ),
        ),
      ),
    );

    Card card = new Card(child: new Column(
      //move to crossaxis (aka horizontal as we are vertical)'s start (left)
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          photoAndTitle,
          description
        ]
    ));

    // A detailed view of the character that is called when a character card is tapped
    ListView detailedView = new ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          new SizedBox( //holds our image
              height: 184.0,
              child: new Stack( //this stack is redundant - was originally to place text name over image
                  children: <Widget>[
                    new Positioned.fill(
                        child: new Image.asset(
                          char.assetName,
                          fit: BoxFit.fitHeight,
                        )
                    )
                  ]
              )
          ),
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
                      child: new Text(char.charClass, style: descriptionStyle),//our description
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
                  child: new Text(char.charRace, style: descriptionStyle),//our description
                )
              ),
            ]
          )
        ]
    );

    return new SafeArea(
        top: false,
        bottom: false,
        // Allow user to tap card
        child: new GestureDetector(
            onTap: () {Navigator.of(context).push(new MaterialPageRoute<Null>(
                builder: (BuildContext context) {
                  //build a new widget
                  return new Scaffold( //new scaffold
                      appBar: new AppBar(
                        title: const Text('Character Stats'), //title of view
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

class CharacterSelection extends StatelessWidget {
  static String tag = 'character-selection';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'DnD 301 Use Case Demo',
        theme: new ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.grey,
            accentColor: Colors.deepOrange
        ),
        home: new Scaffold(
            body: new ListView(
                itemExtent: CharacterItem.height,
                padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),//adds padding between cards and screen
                children: characters.map((Character char) {  //this goes through all our characters and makes a card for each
                  return new Container(       //this is our 'card'
                      margin: const EdgeInsets.only(bottom: 8.0),
                      child: new CharacterItem(char: char)  //give our card a character to use
                  );
                }).toList()
            ),
            drawer: new Menu(),
            appBar: new AppBar( //AppBars are the bars on top of the view
                title: const Text('Character Selection'),
                actions: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.symmetric(vertical: 16.0),
                    child: new Material(
                      borderRadius: new BorderRadius.circular(30.0),
                      elevation: 5.0,
                      child: new MaterialButton(
                        minWidth: 100.0,
                        height: 42.0,
                        onPressed: () async {
                          GoogleSignIn _googleSignIn = new GoogleSignIn();
                          FirebaseAuth.instance.signOut();
                          await _googleSignIn.signOut();
                          Navigator.pop(context);
                        },
                        color: Colors.deepOrange,
                        child: new Text('Sign Out!', style: new TextStyle(color: Colors.white)),
                      ),
                    ),
                  )
                ]
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
        )
    );
  }
}