import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:dnd_301_final/app_data.dart';
import 'package:dnd_301_final/character_selection.dart';
import 'package:dnd_301_final/races_and_classes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

enum DismissDialogAction {
  cancel,
  discard,
  save,
}

bool _saveNeeded = false;
final Key scafKey = new Key('scaffold_lore');

class FullScreenDialog extends StatefulWidget {
  @override
  FullScreenDialogState createState() => new FullScreenDialogState();
}

class FullScreenDialogState extends State<FullScreenDialog> {
  final formKey = new GlobalKey<FormState>();

  File _image;

  Future getImage() async {
    _image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
//      newCharAssetName = _image.path;
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
                'Discard new character?',
                style: dialogTextStyle
            ),

            actions: <Widget>[
              new FlatButton(
                  child: const Text('GO BACK!'),
                  onPressed: () {
                    Navigator.of(context).pop(false); // Pops the confirmation dialog but not the page.
                  }
              ),
              new FlatButton(
                  child: const Text('DISCARD!'),
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
//        assetName: newCharAssetName,
//        title: newCharName,
//        charClass: newCharClass,
//        charRace: newCharRace,
//        charGender: newCharGender,
        strength: 1,
        dexterity: 1,
        constitution: 1,
        intelligence: 1,
        wisdom: 1,
        charisma: 1
    );

//    print("New Character " + newCharName + " created.");
    temp.imageIsFile=true;
    characters.add(temp);

    setState((){});
  }




  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return new Material(
      child: new DefaultTabController(
        length: 3,
        child: new Scaffold(
          key: scafKey,
          resizeToAvoidBottomPadding: true,
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
              ],
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: 'Basic',),
                Tab(text: 'Lore',),
                Tab(text: 'Equipment',),
              ],
            ),
          ),
          body: new TabBarView(
            children: [
              BasicInfoTab(popFunc: _onWillPop,),
              LoreInfoTab(),
              EquipInfoTab(),
          ]
          ),
        ),
      ),
    );
  }
}

class BasicInfoTab extends StatefulWidget {

  final popFunc;

  BasicInfoTab({
    this.popFunc
  });

  final TextEditingController char_name = new TextEditingController();

  
  @override
  _BasicInfoTabState createState() => _BasicInfoTabState();
}

class _BasicInfoTabState extends State<BasicInfoTab> {

  String newCharName;
  String newCharGender = "Male";
  ClassType selectedClass = typeClasses.elementAt(0);
  RacePreview racePrev = new RacePreview(race: races.elementAt(0));
  ClassPreview classPrev = new ClassPreview(classType: typeClasses.elementAt(0));
  StatsWidgets stats = new StatsWidgets(race: races.elementAt(0),);
  Race selectedRace = races.elementAt(0);
  
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Form(
//          key: formKey,
          onWillPop: widget.popFunc,
          child: new Column(
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new Padding(  //padding on top and bottom to space from image box and description
                      padding: new EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 2.0),
                      child: new Text('Character Name',
                          style: Theme.of(context).textTheme.title.copyWith(color: Colors.deepOrange)),
                    ),
                    new Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: new TextFormField(
                          controller: widget.char_name,
                          onSaved: (val) {newCharName = val; _saveNeeded=true;},
                          decoration: new InputDecoration(
                            hintText: 'Type name here',
                          )
                      ),
                    ),
                  ],
                ),

                new Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Padding(  //padding on top and bottom to space from image box and description
                        padding: new EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
                        child: new Text('Race',
                            style: Theme.of(context).textTheme.title.copyWith(color: Colors.deepOrange)),
                      ),

                      new DropdownButton<Race>(
                        items: races.map((Race race) {
                          return new DropdownMenuItem<Race>(
                              value: race,
                              child: new Text(race.name)
                          );}).toList(),
                        onChanged: (val){
//                                newCharRace = val.name;
                          selectedRace=val;
                          _saveNeeded = true;
                          setState(() {
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
                            style: Theme.of(context).textTheme.title.copyWith(color: Colors.deepOrange)),
                      ),

                      new DropdownButton(items: [
                        new DropdownMenuItem<String>(child: new Text("Male"), value: "Male",),
                        new DropdownMenuItem<String>(child: new Text("Female"), value: "Female",),
                      ], onChanged: (val){newCharGender = val; _saveNeeded=true; setState(() {});},
                        value: newCharGender,)
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
                        child: new Text('Class',
                            style: Theme.of(context).textTheme.title.copyWith(color: Colors.deepOrange)),
                      ),

                      new Row(
                        children: <Widget>[
                          new DropdownButton<ClassType>(
                            items: typeClasses.map((ClassType c) {
                              return new DropdownMenuItem<ClassType>(
                                  value: c,
                                  child: new Text(c.name)
                              );}).toList(),
                            isDense: true,
                            onChanged: (val){if(val!=null) selectedClass = val; _saveNeeded=true; setState(() {classPrev = new ClassPreview(classType: selectedClass,);});},
                            value: selectedClass,
                          ),

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

class LoreInfoTab extends StatefulWidget {
  @override
  _LoreInfoTabState createState() => _LoreInfoTabState();
}

class _LoreInfoTabState extends State<LoreInfoTab> {

  String personality;
  String ideals;
  String bonds;
  String flaws;
  String featuresTraits;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        child: ListView(
          controller: ScrollController(keepScrollOffset: false),
          padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 10.0),
          children: <Widget>[
              TextBox('Personality','The best person to ever exist ever'),
              TextBox('Ideals','The best ideals a person can have, no seriously, they are the ideal ideals.'),
              TextBox('Bonds','Everyone loves me anyway, isnt that fine?'),
              TextBox('Flaws','My only flaw is that I\'m flawless' ),
              TextBox('Features & Traits','Those extra goodies that make me special <3.'),
          ],
        ),
      ),
    );
  }
}


class EquipInfoTab extends StatefulWidget {

  final List<Equipment> equipment = List()..add(
    new Equipment('Sword of Girth', "Broadsword", 10),
  )..add(
    new Equipment("Thunderfury", "Blessed Blade of the Windseeker", 20)
  );

//  EquipInfoTab({
//   this.equipment,
//});

  @override
  _EquipInfoTabState createState() => _EquipInfoTabState();
}

class _EquipInfoTabState extends State<EquipInfoTab> {

  int armorClass;

  @override
  initState()
  {
    super.initState();

    armorClass = 0;
    widget.equipment.forEach(
        (item){
          if(item!=null)
            armorClass+=item.val;
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: new Container(
              width: AppData.screenWidth/4,
              height: AppData.screenHeight/8,
              child: Stack(
                children: <Widget>[
                  new Center(child: Image.asset('assets/shield.png',color: Colors.deepOrange,)),

                  Center(
                    child: Text(
                      '$armorClass',
                      style: const TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),

          new Expanded(
            child: ListView(
              padding: EdgeInsets.all(8.0),
              children: widget.equipment.map(
                (e)
                {
                    return new Container(
                      padding: EdgeInsets.all(5.0),
                      child: EquipmentWidget(
                        item: e,
                      ),
                    );
                }
              ).toList(growable: true)..add(
                new Container(
                  padding: EdgeInsets.all(5.0),
                  child: EquipNewItem(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EquipNewItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RichText(
          text: TextSpan(
              text: "Add new item\n",
              style: traitsTitleStyle,
              children: <TextSpan>[
                TextSpan(
                  text: "click here",
                  style: descStyle,
                )
              ]
          ),
        ),

        Expanded(child: new Container(),),

        new Center(child: Icon(Icons.add,color: Colors.green,))
      ],
    );
  }
}


class Equipment
{
  final String name;
  final String type;
  final int val;

  Equipment(this.name, this.type, this.val);

}

class EquipmentWidget extends StatelessWidget {

  final Equipment item;


  EquipmentWidget({
    this.item,
});

  @override
  Widget build(BuildContext context) {

    if(item==null)
      return Container(
        height: AppData.screenHeight/15,
        color: Colors.redAccent,
      );

    return Container(
      child: Row(
//        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          RichText(
            text: TextSpan(
              text: "${item.name}\n",
              style: traitsTitleStyle,
              children: <TextSpan>[
                TextSpan(
                  text: item.type,
                  style: descStyle,
                )
              ]
            ),
          ),


        Expanded(child: Container()),
//          new Container(child: Image.asset('assets/shield.png'))
        new Center(child: Icon(Icons.beach_access))
        ],
      ),
    );
  }
}



class TextBox extends StatelessWidget {

  final String heading;
  final String data;


  TextBox(this.heading, this.data);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            heading,
            style: title,
          ),
//        Text(data,style: descStyle,),
          TextFormField(
            maxLines: null,
            initialValue: data,
            style: descStyle,
          )
        ],
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
  fontWeight: FontWeight.normal,
  color: Colors.redAccent,
  fontSize: 13.0,
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
                  text: "${classType.name}\n",
                  style: title,
                  children: <TextSpan>[
                    ///description
                    new TextSpan(
                      text: classType.desc,
                      style: descStyle,
                    ),

//                      ///traits:
//                      new TextSpan(
//                        text: "Traits:\n",
//                        style: traitsTitleStyle,
//                      ),

                    ///primary ability
                    new TextSpan(
                      text: '\nPrimary: ',
                      style: traitsTitleStyle,
                    ),
                    new TextSpan(
                      text: classType.primaryAbility,
                      style: traitsStyle,
                    ),

                    ///Saving throws
                    new TextSpan(
                      text: '\nSaving Throws: ',
                      style: traitsTitleStyle,
                    ),
                    new TextSpan(
                      text: classType.saves,
                      style: traitsStyle,
                    ),

                    ///hitdie
                    new TextSpan(
                      text: '\nHitDie: ',
                      style: traitsTitleStyle,
                    ),
                    new TextSpan(
                      text: 'd${classType.hitDie.toString()}',
                      style: traitsStyle,
                    ),

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

          ///left - minus - button
          new Expanded( flex: 2,
              child: new IconButton(icon: new Icon(Icons.remove), onPressed: (){sub();})),

          ///display text
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


          ///right - add - button
          new Expanded( flex: 2,
              child: new IconButton(icon: new Icon(Icons.add), onPressed: (){add();})),

        ],
      ),
    );
  }
}

