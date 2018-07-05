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
    LocalCharacter temp = new LocalCharacter(
      title: bit.newCharName,
      charClass: bit.selectedClass,
      charRace: bit.selectedRace,
      charGender: bit.newCharGender,
      strength: bit.stats.intel,
      dexterity: bit.stats.dex,
      constitution: bit.stats.con,
      intelligence: bit.stats.intel,
      wisdom: bit.stats.intel,
      charisma: bit.stats.chr,
      background: lit.background,
      personality: lit.personality,
      ideals:  lit.ideals,
      flaws:  lit.flaws,
      bonds: lit.bonds,
      featuresTraits: lit.featuresTraits,
    );

    print("New Character ${bit.newCharName} created.");
//    temp.imageIsFile=true;
    characters.add(temp);

    setState((){});
  }


  BasicInfoTab bit;
  LoreInfoTab lit;
  EquipInfoTab eit;


  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    if(bit==null)
      bit = new BasicInfoTab();
    if(lit==null)
      lit = new LoreInfoTab();
    if(eit==null)
      eit = new EquipInfoTab();

    return new Material(
      child: new Form(
        key: formKey,
        onWillPop: _onWillPop,
        child: new DefaultTabController(
          length: 3,
          child: new Scaffold(
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
//                BasicInfoTab(),
//                BasicInfoTab(popFunc: _onWillPop,),
//                (bit = BasicInfoTab()),
                bit,
                lit,
                eit,
            ]
            ),
          ),
        ),
      ),
    );
  }
}

class BasicInfoTab extends StatefulWidget {

  String newCharName;
  String newCharGender = "Male";
  ClassType selectedClass = typeClasses.elementAt(0);
  RacePreview racePrev = new RacePreview(race: races.elementAt(0));
  ClassPreview classPrev = new ClassPreview(classType: typeClasses.elementAt(0));
  StatsWidgets stats = new StatsWidgets(race: races.elementAt(0),);
  Race selectedRace = races.elementAt(0);

//  final popFunc;
//
//  BasicInfoTab({
//    this.popFunc
//  });

  final TextEditingController char_name = new TextEditingController();

  
  @override
  _BasicInfoTabState createState() => _BasicInfoTabState();
}

class _BasicInfoTabState extends State<BasicInfoTab> {

  @override
  Widget build(BuildContext context) {
    return new Material(
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
                      onSaved: (val) {widget.newCharName = val;},
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
                      widget.selectedRace=val;
                      _saveNeeded = true;
                      setState(() {
                        widget.racePrev=new RacePreview(race: widget.selectedRace,);
                        widget.stats = new StatsWidgets(race: widget.selectedRace);
                      });},
                    value: widget.selectedRace,
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
                  ], onChanged: (val){widget.newCharGender = val; _saveNeeded=true; setState(() {});},
                    value: widget.newCharGender,)
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
                        onChanged: (val){if(val!=null) widget.selectedClass = val; _saveNeeded=true; setState(() {widget.classPrev = new ClassPreview(classType: widget.selectedClass,);});},
                        value: widget.selectedClass,
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

            new Expanded(child: widget.racePrev, flex: 1,),
            new Expanded(child: widget.classPrev, flex: 1,),
            new Expanded(child: widget.stats, flex: 1,),


          ]
      ),
    );
  }
}

class LoreInfoTab extends StatefulWidget {

  String background = 'Those things that happend to me that make me want to do some other things.';
  String personality = 'The best person to ever exist ever';
  String ideals = 'The best ideals a person can have, no seriously, they are the ideal ideals.';
  String bonds = 'Everyone loves me anyway, isnt that fine?';
  String flaws = 'My only flaw is that I\'m flawless';
  String featuresTraits = 'Those extra goodies that make me special <3.';

  @override
  _LoreInfoTabState createState() => _LoreInfoTabState();
}

class _LoreInfoTabState extends State<LoreInfoTab> {

  updateFlaws (String val) => widget.flaws = val;

  updateFeatures (String val) => widget.featuresTraits = val;

  updatePersonality (String val) => widget.personality = val;

  updateIdeals (String val) => widget.ideals = val;

  updateBonds (String val) => widget.bonds = val;

  updateBackground (String val) => widget.background = val;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        child: ListView(
          controller: ScrollController(keepScrollOffset: false),
          padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 10.0),
          children: <Widget>[
              TextBox('Background',widget.background,updateBackground),
              TextBox('Personality',widget.personality ,updatePersonality),
              TextBox('Ideals',widget.ideals ,updateIdeals),
              TextBox('Bonds',widget.bonds,updateBonds),
              TextBox('Flaws',widget.flaws ,updateFlaws),
              TextBox('Features & Traits',widget.featuresTraits,updateFeatures),
          ],
        ),
      ),
    );
  }
}

class TextBox extends StatelessWidget {

  final String heading;
  final String data;
  final Function update;

  TextBox(this.heading, this.data, this.update);

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
          TextFormField(
            onSaved: (val) => update(val),
            maxLines: null,
            initialValue: data,
            style: descStyle,
          )
        ],
      ),
    );
  }
}

class EquipInfoTab extends StatefulWidget {

  final List<Equipment> equipment = List()..add(
    new Equipment('Sword of Girth', "Broadsword", 10,isWep: true),
  )..add(
    new Equipment("Thunderfury", "Blessed Blade of the Windseeker", 20,isWep: true),
  )..add(
    new Equipment("Goldskin", "Breastplate", 5)
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
  final bool isWep;
  final int val;

  Equipment(this.name, this.type, this.val, {this.isWep=false});

}

class EquipmentWidget extends StatelessWidget {

  final Equipment item;

  EquipmentWidget({
    this.item,
});


  @override
  Widget build(BuildContext context) {

    String icon;

    if(item==null)
      return Container(
        height: AppData.screenHeight/15,
        color: Colors.redAccent,
      );
    else
      {
        if(item.isWep)
          icon = 'assets/sword.png';
        else
          icon = 'assets/armor.png';
      }

    return Container(
      child: Row(
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

        new Container(
          width: 20.0,
            child: new Center(child: Image.asset(icon))),
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
  int intel;
  int str;
  int dex;
  int wis;
  int chr;
  int con;

  StatsWidgets({
    @required
    this.race,
});


  updateInt (int val) => intel = val;
  updateStr (int val) => str = val;
  updateDex (int val) => dex = val;
  updateWis (int val) => wis = val;
  updateChr (int val) => chr = val;
  updateCon (int val) => con = val;


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
                new Expanded(child: Stat.Int(value: race.intelligence,update: updateInt,)),
                new Expanded(child: Stat.Str(value: race.strength,update: updateStr,)),
                new Expanded(child: Stat.Dex(value: race.dexterity,update: updateDex,)),
              ],
            ),
          ),
          new Expanded(
            flex: 1,
            child: new Column(
              children: <Widget>[
                ///main stats
                new Expanded(child: Stat.Wis(value: race.wisdom,update: updateWis,)),
                new Expanded(child: Stat.Chr(value: race.charisma, update: updateChr)),
                new Expanded(child: Stat.Con(value: race.constitution, update: updateCon,)),
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
  final bool hasButtons;
  final Function update;


  Stat.Int({
    this.iconPath = 'assets/icon_assets/Intelligence.png',
    @required
    this.value,
    this.col = Colors.lightBlueAccent,
    this.hasButtons = true,
    this.update,
  });

  Stat.Dex({
    this.iconPath = 'assets/icon_assets/Dexterity.png',
    @required
    this.value,
    this.col = Colors.green,
    this.hasButtons = true,
    this.update,
  });

  Stat.Con({
    this.iconPath = 'assets/icon_assets/Constitution.png',
    @required
    this.value,
    this.col = Colors.orange,
    this.hasButtons = true,
    this.update,
  });

  Stat.Str({
    this.iconPath = 'assets/icon_assets/Strength.png',
    @required
    this.value,
    this.col = Colors.red,
    this.hasButtons = true,
    this.update,
  });

  Stat.Wis({
    this.iconPath = 'assets/icon_assets/Wisdom.png',
    @required
    this.value,
    this.col = Colors.brown,
    this.hasButtons = true,
    this.update,
  });

  Stat.Chr({
    this.iconPath = 'assets/icon_assets/Charisma.png',
    @required
    this.value,
    this.col = Colors.yellow,
    this.hasButtons = true,
    this.update,
  });


  @override
  _StatState createState() => new _StatState();
}

class _StatState extends State<Stat> {

  int value = 0;
  int calcVal;

  Widget leftButton = new Container();
  Widget rightButton = new Container();

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

    widget.update(value);
  }

  sub()
  {
    setState(() {
      if(value>widget.value)
        value-=1;
      calcVal = ((value-10)/2).floor();
    });

    widget.update(value);
  }

  @override
  Widget build(BuildContext context) {

    if(widget.hasButtons && leftButton.runtimeType==Container)
      {
        leftButton = new IconButton(icon: new Icon(Icons.remove), onPressed: (){sub();});
        rightButton = new IconButton(icon: new Icon(Icons.add), onPressed: (){add();});
      }


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
              child: leftButton),

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
              child: rightButton),

        ],
      ),
    );
  }
}

