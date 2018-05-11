import 'dart:async';
import 'dart:io';

import 'package:dnd_301_final/character_selection.dart';
import 'package:flutter/material.dart';
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

  final List<DropdownMenuItem<String>> raceList = [
    new DropdownMenuItem<String>(child: new Text("Human"), value: "Human",),
    new DropdownMenuItem<String>(child: new Text("Orc"), value: "Orc",),
    new DropdownMenuItem<String>(child: new Text("Gnome"), value: "Gnome",),
    new DropdownMenuItem<String>(child: new Text("Halfling"), value: "Halfling",),
  ];

  final TextEditingController char_name = new TextEditingController();
//  final TextEditingController char_class = new TextEditingController();
//  final TextEditingController char_race = new TextEditingController();
  String newCharName, newCharClass = "Knight",newCharRace = "Human", newCharAssetName, newCharGender = "Male";

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
                        onSaved: (val) => newCharName = val,
                        decoration: new InputDecoration(
                          hintText: 'Type name here',

                        )
                    ),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new Padding(  //padding on top and bottom to space from image box and description
                      padding: new EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                      child: new Text('Race',
                          style: theme.textTheme.title.copyWith(color: Colors.deepOrange)),
                    ),

                    new Row(
                      children: <Widget>[
                        new DropdownButton(items: [
                          new DropdownMenuItem<String>(child: new Text("Human"), value: "Human",),
                          new DropdownMenuItem<String>(child: new Text("Orc"), value: "Orc",),
                          new DropdownMenuItem<String>(child: new Text("Gnome"), value: "Gnome",),
                          new DropdownMenuItem<String>(child: new Text("Halfling"), value: "Halfling",),
                        ], onChanged: (val){newCharRace = val; setState(() {});},
                          value: newCharRace,),

                        new IconButton(icon: new Icon(Icons.info), onPressed: null),
                      ],
                    )

                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new Padding(  //padding on top and bottom to space from image box and description
                      padding: new EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                      child: new Text('Gender',
                          style: theme.textTheme.title.copyWith(color: Colors.deepOrange)),
                    ),
                    new Row(
                      children: <Widget>[
                        new DropdownButton(items: [
                          new DropdownMenuItem<String>(child: new Text("Male"), value: "Male",),
                          new DropdownMenuItem<String>(child: new Text("Female"), value: "Female",),
                        ], onChanged: (val){newCharGender = val; setState(() {});},
                          value: newCharGender,),

                        new IconButton(icon: new Icon(Icons.info), onPressed: null),
                      ],
                    )
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Padding(  //padding on top and bottom to space from image box and description
                      padding: new EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                      child: new Text('Class',
                          style: theme.textTheme.title.copyWith(color: Colors.deepOrange)),
                    ),
                    new DropdownButton<String>(
                      items: <String>['Warlock', 'Druid', 'Knight', 'Paladin'].map((String value) {
                        return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value)
                        );}).toList(),
                      onChanged: (val){newCharClass = val; setState(() {});},
                      value: newCharClass,
                    ),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Padding(  //padding on top and bottom to space from image box and description
                      padding: new EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                      child: new Text('Add Picture',
                          style: theme.textTheme.title.copyWith(color: Colors.deepOrange)),
                    ),
                    new FloatingActionButton(
                        onPressed: getImage,
                        child: new Icon(Icons.add)
                    )
                  ],
                )
                /*new Padding(
                    padding: const EdgeInsets.fromLTRB(7.0,15.0,7.0,16.0),
                    child:
                      new Material(
                        borderRadius: new BorderRadius.circular(30.0),
                        elevation: 5.0,
                        child: new MaterialButton(
                          minWidth: 200.0,
                          height: 22.0,
                          onPressed: getImage,
                          color: Colors.deepOrange,
                            child: new Text('Pick Image', style: new TextStyle(color: Colors.white)),
                        ),
                      )
                ),*/
              ]
                  .map((Widget child) {
                return new Container(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    height: 97.0,
                    child: child
                );
              })
                  .toList()
          )
      ),
    );
  }
}
