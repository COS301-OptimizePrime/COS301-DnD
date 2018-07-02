import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:dnd_301_final/character_selection.dart';
import 'package:dnd_301_final/races_and_monsters.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

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
  final formKey = new GlobalKey<FormState>();

  File _image;

  Future getImage() async {
    _image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      newCharAssetName = _image.path;
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

  void addNewChar()
  {

    formKey.currentState.save();
    Character temp = new Character(
        assetName: newCharAssetName,
        title: newCharName,
        charClass: newCharClass,
        charRace: newCharRace,
        charGender: newCharGender,
        strength: 1,
        dexterity: 1,
        constitution: 1,
        intelligence: 1,
        wisdom: 1,
        charisma: 1
    );

    print("New Character " + newCharName + " created.");
    temp.imageIsFile=true;
    characters.add(temp);

    setState((){});
  }

  final TextEditingController char_name = new TextEditingController();
//  final TextEditingController char_class = new TextEditingController();
//  final TextEditingController char_race = new TextEditingController();
  String newCharName,newCharRace = "Hobgoblin", newCharAssetName, newCharGender = "Male";
  String newCharClass = "Warlock";
  ClassType selectedClass = typeClasses.elementAt(0);
  RacePreview racePrev = new RacePreview(race: races.elementAt(0));
  ClassPreview classPrev = new ClassPreview(classType: typeClasses.elementAt(0));
  StatsWidgets stats = new StatsWidgets(race: races.elementAt(0),);
  Race selectedRace = races.elementAt(0);


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
                  addNewChar();
                  Navigator.pop(context, DismissDialogAction.save);
                }
            )
          ]
      ),
      body: new Form(
          key: formKey,
          onWillPop: _onWillPop,
          child: new Column(
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new Padding(  //padding on top and bottom to space from image box and description
                      padding: new EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 2.0),
                      child: new Text('Character Name',
                          style: theme.textTheme.title.copyWith(color: Colors.deepOrange)),
                    ),
                    new Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: new TextFormField(
                          controller: char_name,
                          onSaved: (val) => newCharName = val,
                          decoration: new InputDecoration(
                            hintText: 'Type name here',

                          )
                      ),
                    ),
                  ],
                ),


//                new Stack(
//                  children: <Widget>[
//                    new Positioned(
//                      child: new TextFormField(
//                        controller: char_name,
//                        onSaved: (val) => newCharName = val,
//                        decoration: new InputDecoration(
//                          hintText: 'Type name here',
//                        )
//                      ),
//                    ),
//
//                    new Container(
//                      child: new Image(
//                        image: new AssetImage('assets/namebar.png'),
//                        colorBlendMode: BlendMode.difference,
//                      ),
//                    ),
//
//                  ],
//                ),

                new Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Padding(  //padding on top and bottom to space from image box and description
                        padding: new EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                        child: new Text('Race',
                            style: theme.textTheme.title.copyWith(color: Colors.deepOrange)),
                      ),

                      new DropdownButton<Race>(
                        items: races.map((Race race) {
                        return new DropdownMenuItem<Race>(
                        value: race,
                        child: new Text(race.name)
                        );}).toList(),
                        onChanged: (val){newCharRace = val.name; selectedRace=val; setState(() {
                          racePrev=new RacePreview(race: selectedRace,);
                          stats = new StatsWidgets(race: selectedRace);
                        });},
                        value: selectedRace,
                      )
                    ],
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      new Padding(  //padding on top and bottom to space from image box and description
                        padding: new EdgeInsets.symmetric(vertical: 4.0),
                        child: new Text('Gender',
                            style: theme.textTheme.title.copyWith(color: Colors.deepOrange)),
                      ),

                      new DropdownButton(items: [
                        new DropdownMenuItem<String>(child: new Text("Male"), value: "Male",),
                        new DropdownMenuItem<String>(child: new Text("Female"), value: "Female",),
                      ], onChanged: (val){newCharGender = val; setState(() {});},
                        value: newCharGender,)
                    ],
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[

//                      const Expanded(),

                      new Padding(  //padding on top and bottom to space from image box and description
                        padding: new EdgeInsets.symmetric(vertical: 4.0),
                        child: new Text('Class',
                            style: theme.textTheme.title.copyWith(color: Colors.deepOrange)),
                      ),

//                      const Expanded(),

                      new Row(
                        children: <Widget>[
                          new DropdownButton<ClassType>(
                            items: typeClasses.map((ClassType c) {
                              return new DropdownMenuItem<ClassType>(
                                  value: c,
                                  child: new Text(c.name)
                              );}).toList(),
                            isDense: true,
                            onChanged: (val){if(val!=null) selectedClass = val; setState(() {classPrev = new ClassPreview(classType: selectedClass,);});},
                            value: selectedClass,
                          ),

//                          new IconButton(icon: new Icon(Icons.info), onPressed: null),
                        ],
                      )
                    ],
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Divider(
                    height: 20.0,color: Colors.deepOrange,
                  ),
                ),

                ////// Stats Preview

                new Expanded(child: racePrev, flex: 1,),
                new Expanded(child: classPrev, flex: 1,),
                new Expanded(child: stats, flex: 1,),


              ]
           )
      ),
    );
  }
}

final TextStyle title = new TextStyle(
  color: Colors.deepOrange,
  fontSize: 20.0,
  fontWeight: FontWeight.bold
);

final TextStyle descStyle = new TextStyle(
  fontSize: 12.0,
  color: Colors.orange,
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.italic
);

final TextStyle traitsTitleStyle = new TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.red,
  fontSize: 15.0,
);

final TextStyle traitsStyle = new TextStyle(
  fontSize: 12.0,
  color: Colors.white70,
  fontWeight: FontWeight.normal,
);


class RacePreview extends StatelessWidget {

final Race race;

RacePreview({
  this.race,
});

  @override
  Widget build(BuildContext context) {

    return new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ///Description
        new Expanded(
          flex: 3,
          child: new Padding(
            padding: const EdgeInsets.only(top: 8.0,left: 8.0),
            child: new RichText(
              softWrap: true,
              text: new TextSpan(
                text: race.name+"\n",
                style: title,
                children: <TextSpan>[
                  ///description
                  new TextSpan(
                    text: race.desc+"\n",
                    style: descStyle,
                  ),

//                      ///traits:
//                      new TextSpan(
//                        text: "Traits:\n",
//                        style: traitsTitleStyle,
//                      ),

                  ///traits list
                  new TextSpan(
                    text: race.getTraits(),
                    style: traitsStyle,
                  )
                ]
              ),
            ),
          ),
        ),

        ///image
        new Expanded(
          flex: 1,
          child: new Image.asset('assets/race_images/'+race.getImage()+'.png',fit: BoxFit.scaleDown,),
        )
      ],
    );
  }
}

class ClassPreview extends StatelessWidget {

  final ClassType classType;

  ClassPreview({
    this.classType,
  });

  @override
  Widget build(BuildContext context) {

    return new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        ///image
        new Expanded(
          flex: 1,
          child: new Image.asset('assets/class_images/'+classType.name+'.png',fit: BoxFit.scaleDown,),
        ),

        ///Description
        new Expanded(
          flex: 3,
          child: new Padding(
            padding: const EdgeInsets.only(top: 8.0,left: 8.0),
            child: new RichText(
              softWrap: true,
              text: new TextSpan(
                  text: classType.name+"\n",
                  style: title,
                  children: <TextSpan>[
                    ///description
                    new TextSpan(
                      text: classType.desc+"\n",
                      style: descStyle,
                    ),

//                      ///traits:
//                      new TextSpan(
//                        text: "Traits:\n",
//                        style: traitsTitleStyle,
//                      ),

                    ///traits list
                    new TextSpan(
                      text: classType.primaryAbility,
                      style: traitsStyle,
                    )
                  ]
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class StatsWidgets extends StatelessWidget {

  final Race race;

  StatsWidgets({
    @required
    this.race,
});

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            flex: 1,
            child: new Column(
              children: <Widget>[
                ///main stats
                new Expanded(child: new Stat.Int(value: race.intelligence)),
                new Expanded(child: new Stat.Str(value: race.strength)),
                new Expanded(child: new Stat.Dex(value: race.dexterity)),
              ],
            ),
          ),
          new Expanded(
            flex: 1,
            child: new Column(
              children: <Widget>[
                ///main stats
                new Expanded(child: new Stat.Wis(value: race.wisdom)),
                new Expanded(child: new Stat.Chr(value: race.charisma)),
                new Expanded(child: new Stat.Con(value: race.constitution)),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class Stat extends StatefulWidget {

  final String iconPath;
  final int value;
  final Color col;


  Stat.Int({
    this.iconPath = 'assets/icon_assets/Intelligence.png',
    @required
    this.value,
    this.col = Colors.lightBlueAccent,
  });

  Stat.Dex({
    this.iconPath = 'assets/icon_assets/Dexterity.png',
    @required
    this.value,
    this.col = Colors.green,
  });

  Stat.Con({
    this.iconPath = 'assets/icon_assets/Constitution.png',
    @required
    this.value,
    this.col = Colors.orange,
  });

  Stat.Str({
    this.iconPath = 'assets/icon_assets/Strength.png',
    @required
    this.value,
    this.col = Colors.red,
  });

  Stat.Wis({
    this.iconPath = 'assets/icon_assets/Wisdom.png',
    @required
    this.value,
    this.col = Colors.brown
  });

  Stat.Chr({
    this.iconPath = 'assets/icon_assets/Charisma.png',
    @required
    this.value,
    this.col = Colors.yellow,
  });


  @override
  _StatState createState() => new _StatState();
}

class _StatState extends State<Stat> {

  int value = 0;
  int calcVal;
  @override
  initState()
  {
    super.initState();
    value = widget.value;
    calcVal = ((value-10)/2).floor();
  }


  add()
  {
    setState(() {
      value+=1;
      calcVal = ((value-10)/2).floor();
    });
  }

  sub()
  {
    setState(() {
      if(value>widget.value)
        value-=1;
      calcVal = ((value-10)/2).floor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: new Row(
        children: <Widget>[
          ///icon
          new Expanded(
            flex: 3,
            child: new Image.asset(widget.iconPath),
          ),


          new Expanded( flex: 2,
              child: new IconButton(icon: new Icon(Icons.remove), onPressed: (){sub();})),

          ///display
//          new Expanded(child: new Text('+'+value.toString()+' ('+calcVal.toString()+')'),flex: 3,),

          new RichText(
            softWrap: false,
            text: new TextSpan(
              text: "+$value ",
              children: <TextSpan>[
                new TextSpan(
                  text: "($calcVal)",
                  style: new TextStyle(color: widget.col)
                )
              ]
            ),
          ),

          new Expanded( flex: 2,
              child: new IconButton(icon: new Icon(Icons.add), onPressed: (){add();})),

          ///buttons
//          new Expanded(flex: 2,
//            child: new Column(
//              children: <Widget>[
//                ///add button
//                new Expanded(child: new IconButton(icon: new Icon(Icons.add), onPressed: () {add();})),
//                new Expanded(child: new IconButton(icon: new Icon(Icons.remove), onPressed: (){sub();}))
//              ],
//            ),
//          )
        ],
      ),
    );
  }
}

