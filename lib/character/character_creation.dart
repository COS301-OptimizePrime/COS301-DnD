import 'dart:async';
import 'dart:core';

import 'package:dnd_301_final/app_data.dart';
import 'package:dnd_301_final/character/character_selection.dart';
import 'package:dnd_301_final/character/races_and_classes.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

enum DismissDialogAction {
  cancel,
  discard,
  delete,
  save,
}

bool _saveNeeded = false;

class CreateCharacterDialog extends StatefulWidget {

  LocalCharacter char;

  CreateCharacterDialog({
    this.char
});

  @override
  CreateCharacterDialogState createState() => new CreateCharacterDialogState();
}

class CreateCharacterDialogState extends State<CreateCharacterDialog> {
  final formKey = new GlobalKey<FormState>();

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
                  child: const Text('CONTINUE CREATION'),
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

  Future addNewChar()
  async {

//    formKey.currentState.save();
    LocalCharacter temp = new LocalCharacter(
      title: bit.newCharName,
      charClass: BasicInfoTab.selectedClass,
      charRace: BasicInfoTab.selectedRace,
      charGender: bit.newCharGender,
      strength: bit.stats.str,
      dexterity: bit.stats.dex,
      constitution: bit.stats.con,
      intelligence: bit.stats.intel,
      wisdom: bit.stats.wis,
      charisma: bit.stats.chr,
      background: lit.background,
      personality: lit.personality,
      ideals:  lit.ideals,
      flaws:  lit.flaws,
      bonds: lit.bonds,
      featuresTraits: lit.featuresTraits,
      equipment:  ListToArray(eit.equipment),
      sessionId: ""
    );

    print("New Character ${bit.newCharName = ""} created.");


    await AppData.addNewCharacter(temp);

    setState((){});
  }

  Future<LocalCharacter> updateChar()
  async {
    LocalCharacter temp = new LocalCharacter(
      characterId: widget.char.characterId,
      title: bit.newCharName,
      charClass: BasicInfoTab.selectedClass,
      charRace: BasicInfoTab.selectedRace,
      charGender: bit.newCharGender,
      strength: bit.stats.str,
      dexterity: bit.stats.dex,
      constitution: bit.stats.con,
      intelligence: bit.stats.intel,
      wisdom: bit.stats.wis,
      charisma: bit.stats.chr,
      background: lit.background,
      personality: lit.personality,
      ideals:  lit.ideals,
      flaws:  lit.flaws,
      bonds: lit.bonds,
      featuresTraits: lit.featuresTraits,
      equipment:  ListToArray(eit.equipment),
    );

    print("Updating Character ${bit.newCharName = ""}.");

    widget.char = temp;
    await AppData.updateCharacter(temp);

    return temp;

  }

  List<LocalEquipment> ListToArray(List list)
  {
    List<LocalEquipment> newList = new List(list.length);

    for(int i = 0; i < list.length;i++)
      {
        newList[i]=list[i];
      }

    return newList;
  }

  BasicInfoTab bit;
  LoreInfoTab lit;
  EquipInfoTab eit;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    if(bit==null)
      bit = new BasicInfoTab(widget.char);
    if(lit==null)
      lit = new LoreInfoTab(widget.char);
    if(eit==null)
      eit = new EquipInfoTab(widget.char);

    return new Material(
      child: new Form(
        key: formKey,
        onChanged: (){
          setState(() {
            formKey.currentState.save();
          });
        },
        onWillPop: _onWillPop,
        child: new DefaultTabController(
          length: 3,
          child: new Scaffold(resizeToAvoidBottomPadding: false,
          body: new Builder(builder: (BuildContext context) {return new Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: new AppBar(
                title: const Text('Create Character'),
                actions: <Widget> [
                  new FlatButton(
                      child: new Text('SAVE', style: theme.textTheme.body1.copyWith(color: Colors.white)),
                      onPressed: () {
                        // validate that character has name
                        if (bit.newCharName == null || bit.newCharName.length == 0) {
                          Scaffold.of(context).showSnackBar(new SnackBar(
                            content: new Text("Character needs a name"),
                          ));
                        }
                        else {
                          if(widget.char==null)
                            {
                              addNewChar().whenComplete((){Navigator.pop(context, true);});
                            }
                          else
                            {
                              updateChar().then((char){
                                Navigator.pop(context, char);
                              });
                            }
                        }
                      }
                  )
                ],
              bottom: PreferredSize(
                preferredSize: Size(17.0, 10.0),
                child: Container(child: TabBar(
                tabs: <Widget>[
                  Container(
                    child: Tab(text: 'Basic'), height: 17.0,
                  ),
                  Container(
                    child: Tab(text: 'Lore'), height: 17.0,
                  ),
                  Container(
                    child: Tab(text: 'Equipment'), height: 17.0,
                  ),
                ],
              ))),
            ),
            body: new TabBarView(
              children: [

                bit,
                lit,
                eit,
            ]
            ),
          );}))
        ),
      ),
    );
  }
}

class BasicInfoTab extends StatefulWidget {

  String newCharName;
  String newCharGender = "Male";
  static ClassType selectedClass = typeClasses.elementAt(0);
  static Race selectedRace = races.elementAt(0);
  RacePreviewRow racePrev;
  ClassPreviewRow classPrev;
  StatsWidgets stats;

  final TextEditingController char_name = new TextEditingController();


  BasicInfoTab(LocalCharacter c)
  {
    if(c!=null)
      {
        newCharName = c.title;
//        newCharGender = "Male";//@TODO: fix when gender is added to server
        selectedClass = c.charClass;
        selectedRace = c.charRace;
        racePrev = new RacePreviewRow(race: selectedRace);
        classPrev = new ClassPreviewRow(classType: selectedClass);
        stats = new StatsWidgets(
          intel: c.intelligence, dex: c.dexterity, str: c.strength, chr: c.charisma, con: c.constitution, wis: c.wisdom,
        );
      }
      else
      {
        newCharGender = "Male";
        racePrev = new RacePreviewRow(race: selectedRace);
        classPrev = new ClassPreviewRow(classType: selectedClass);
        stats = new StatsWidgets();
      }
  }

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
                new Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: new TextField(
                      controller: TextEditingController(text: widget.newCharName),
//                      onChanged: (val){widget.newCharName = val;},
//                      onSaved: (val) {widget.newCharName = val;},
                      onSubmitted: (val){widget.newCharName = val; print('saving name $val'); setState(() {

                      });},
//                      autofocus: true,
                      decoration: new InputDecoration(
                        hintText: 'Type name here',
                      )
                  ),
                ),
              ],
            ),
            new Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text('Race',
                        style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.deepOrange)),
                  new DropdownButton<Race>(
                    isDense: true,
                    items: races.map((Race race) {
                      return new DropdownMenuItem<Race>(
                          value: race,
                          child: new Text(race.name)
                      );}).toList(),
                    onChanged: (val){
//                                newCharRace = val.name;
                      BasicInfoTab.selectedRace=val;
                      _saveNeeded = true;
                      setState(() {
                        widget.racePrev=new RacePreviewRow(race: BasicInfoTab.selectedRace,);
//                        new StatsWidgets(race: widget.selectedRace);
                      });},
                    value: BasicInfoTab.selectedRace,
                  )
                ],
              )
            ),
            new Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                    new Text('Gender',
                        style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.deepOrange)),

                  new DropdownButton(items: [
                    new DropdownMenuItem<String>(child: new Text("Male"), value: "Male",),
                    new DropdownMenuItem<String>(child: new Text("Female"), value: "Female",),
                    new DropdownMenuItem<String>(child: new Text("Apache Helicopter"), value: "Apache Helicopter",),
                  ], isDense: true,onChanged: (val){widget.newCharGender = val; _saveNeeded=true; setState(() {});},
                    value: widget.newCharGender,)
                ],
              )
            ),
            new Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  new Text('Class',
                    style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.deepOrange)),

                  new Row(
                    children: <Widget>[
                      new DropdownButton<ClassType>(
                        items: typeClasses.map((ClassType c) {
                          return new DropdownMenuItem<ClassType>(
                            value: c,
                            child: new Text(c.name)
                          );}).toList(),
                        isDense: true,
                        onChanged: (val){if(val!=null) BasicInfoTab.selectedClass = val; _saveNeeded=true; setState(() {widget.classPrev = new ClassPreviewRow(classType: BasicInfoTab.selectedClass,);});},
                        value: BasicInfoTab.selectedClass,
                      ),

                    ],
                  )
                ],
              )
            ),

            ////// Stats Preview

            new Expanded(child: widget.racePrev, flex: 1,),
            new Expanded(child: widget.classPrev, flex: 1,),
            new Expanded(child: widget.stats, flex: 2,),


          ]
      ),
    );
  }
}

class LoreInfoTab extends StatefulWidget {

  String background;
  String personality;
  String ideals;
  String bonds;
  String flaws;
  String featuresTraits;

  LoreInfoTab(LocalCharacter c)
  {
    if(c!=null)
      {
        background = c.background;
        personality = c.personality;
        ideals = c.ideals;
        bonds = c.bonds;
        flaws = c.flaws;
        featuresTraits = c.featuresTraits;
      }
      else
      {
        background = 'Those things that happend to me that make me want to do some other things.';
        personality = 'The best person to ever exist ever';
        ideals = 'The best ideals a person can have, no seriously, they are the ideal ideals.';
        bonds = 'Everyone loves me anyway, isnt that fine?';
        flaws = 'My only flaw is that I\'m flawless';
        featuresTraits = 'Those extra goodies that make me special <3.';
      }
  }

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
    );
  }
}

class TextBox extends StatelessWidget {

  final String heading;
  String data;
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
          TextField(
            onChanged: (val){data = val; update(val);
//            print('saving $val');
                },
//            onSubmitted: (val){update(val); data = val; print('saving $data');},
            controller: TextEditingController(text: data),
//            onSaved: (val) => update(val),
            maxLines: null,
//            initialValue: data,
          keyboardType: TextInputType.multiline,
            style: descStyle,
          )
        ],
      ),
    );
  }
}

class EquipInfoTab extends StatefulWidget {

  List<LocalEquipment> equipment;

  EquipInfoTab(LocalCharacter c)
  {
    if(c!=null)
      {
        equipment = c.equipment;
      }
    else
      {
        equipment = new List()..add(
          new LocalEquipment('Sword of Girth', "Broadsword", 10,isWep: true),
            )..add(
            new LocalEquipment("Thunderfury", "Blessed Blade of the Windseeker", 20,isWep: true),
          )..add(
          new LocalEquipment("Goldskin", "Breastplate", 5)
          );
      }
  }

  @override
  _EquipInfoTabState createState() => _EquipInfoTabState();
}

class _EquipInfoTabState extends State<EquipInfoTab> {
  Shield shield;
  int armorClass;

  @override
  initState()
  {
    super.initState();

    armorClass = 0;
    widget.equipment.forEach(
        (item){
          if(item!=null && !item.isWep)
            armorClass+=item.val;
        }
    );
    shield = new Shield.value(armorClass);
  }

  newItemDialog(BuildContext context) async
  {

    LocalEquipment newItem = await EquipmentList.addNewItem(context);

    if(newItem!=null) {
      widget.equipment.add(newItem);

      if(!newItem.isWep) {
        armorClass += newItem.val;
        shield = new Shield.value(armorClass);
      }
    }

    setState(() {
      //show new item
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: (){newItemDialog(context);},),
      body: new Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: new Container(
                width: AppData.screenWidth/4,
                height: AppData.screenHeight/8,
                child: this.shield,
              ),
            ),

            ///all items less the equipped items
            new Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: widget.equipment.length,
                itemBuilder: (context, index) {
                  final item = widget.equipment[index];

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
                      setState(() {
                        if (!widget.equipment
                            .elementAt(index)
                            .isWep) {
                          this.armorClass -= widget.equipment
                              .elementAt(index)
                              .val;
                          this.shield = new Shield.value(armorClass);
                        }
                      });
                      widget.equipment.removeAt(index);

                      Scaffold
                          .of(context)
                          .showSnackBar(
                          SnackBar(content: Text("$item deleted")));
                    },
                    background: Container(color: Colors.red),
                  );
                }
              )
            )
          ],
        ),
      ),
    );
  }
}

class Shield extends StatelessWidget {
  int armorClass = 0;
  final List equipmentList;

  Shield.value(this.armorClass) : equipmentList=null;
  Shield.list(this.equipmentList)
  {
    if (equipmentList != null) {
      equipmentList.forEach((item) {
        if (item != null && !item.isWep)
          armorClass += item.val;
      }
      );
    }
    else {
      armorClass = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppData.screenHeight / 8,
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
    );
  }
}

class NewItemDialogWidget extends StatefulWidget {


  @override
  _NewItemDialogWidgetState createState() => _NewItemDialogWidgetState();
}

class _NewItemDialogWidgetState extends State<NewItemDialogWidget> {

  Widget view;

  LocalEquipment item;
  String name;
  String type;
  String value;
  bool isShield;

  final _formKey = new GlobalKey<FormState>();


  setView(bool isShield)
  {
    this.isShield = isShield;

    String itemTypeText = 'ATK:';
    if(isShield)
      itemTypeText='DEF:';

    view = Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Item Name:',style: title,),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0,left: 25.0,right: 25.0),
            child: TextFormField(
              onSaved: (val){
                name=val;
              },
              validator: (val){
                if(val.isEmpty)
                  return 'Please enter a Name.';
              },
            ),
          ),
          Text('Item Type:',style: traitsTitleStyle,),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0,left: 25.0,right: 25.0),
            child: TextFormField(
              onSaved: (val){
                type=val;
              },
              validator: (val){
                if(val.isEmpty)
                  return 'Please enter a Type.';
              },
            ),
          ),
          Text(itemTypeText,style: traitsTitleStyle,),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0,left: 25.0,right: 25.0),
            child: TextFormField(
              onSaved: (val){
                value=val;
              },
              validator: (val){
                if(val.isEmpty)
                  return 'Please enter a Value.';
              },
            ),
          ),

          RaisedButton(
            child: Text('Add new Item.'),
            color: Colors.deepOrange,
            onPressed: () {
              if(_formKey.currentState.validate()){

                _formKey.currentState.save();
                item = new LocalEquipment(name, type, int.parse(value),isWep: !isShield);
                Navigator.pop(context,item);
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

//    print('init state');

    view = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        FlatButton(
          child: Container(
              width: AppData.screenWidth/5,
              height: AppData.screenHeight/5,
              child: Image.asset('assets/armor.png')),
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
              child: Image.asset('assets/sword.png')),
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

class EquipNewItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      //implement tap
      child: Row(
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
      ),
    );
  }
}

class LocalEquipment
{
  final String name;
  final String type;
  final bool isWep;
  final int val;

  LocalEquipment(this.name, this.type, this.val, {this.isWep=false});

  @override
  String toString() => name;

}

class EquipmentWidget extends StatelessWidget {

  final LocalEquipment item;

  EquipmentWidget({
    this.item,
});

  EquipmentWidget.add() : item=null;

  @override
  Widget build(BuildContext context) {

    String name;
    String type;
    String val;
    String icon;


    if(item == null) {
        name = "New Item";
        type = "Click here to add a new Item";
        val = "";
      }
      else{
      name = item.name;
      type = item.type;
      val = item.val.toString();

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
                text: "$name\n",
                style: traitsTitleStyle,
                children: <TextSpan>[
                  TextSpan(
                    text: type,
                    style: descStyle,
                  )
                ]
            ),
          ),

          Expanded(child: Container()),

          Row(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: new Center(child: Text(val)),
              ),
              new Container(
                  width: 20.0,
                  child: (icon!=null)? new Center(child: Image.asset(icon)) : Icon(Icons.add,color: Colors.green,)
              ),
            ],
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


class RacePreviewRow extends StatelessWidget {

final Race race;

RacePreviewRow({
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

class ClassPreviewRow extends StatelessWidget {

  final ClassType classType;

  ClassPreviewRow({
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

  int intel;
  int str;
  int dex;
  int wis;
  int chr;
  int con;

  StatsWidgets({
    this.intel = 0,
    this.str = 0,
    this.dex = 0,
    this.wis = 0,
    this.chr = 0,
    this.con = 0,
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
                new Expanded(child: Stat.Int(value: intel,update: updateInt,)),
                new Expanded(child: Stat.Str(value: str, update: updateStr)),
                new Expanded(child: Stat.Dex(value: dex, update: updateDex,)),
              ],
            ),
          ),
          new Expanded(
            flex: 1,
            child: new Column(
              children: <Widget>[
                ///main stats
                new Expanded(child: Stat.Wis(value: wis,update: updateWis,)),
                new Expanded(child: Stat.Chr(value: chr, update: updateChr)),
                new Expanded(child: Stat.Con(value: con, update: updateCon,)),
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
  final String name;
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
    this.name = 'Int',
  });

  Stat.Dex({
    this.iconPath = 'assets/icon_assets/Dexterity.png',
    @required
    this.value,
    this.col = Colors.green,
    this.hasButtons = true,
    this.update,
    this.name = 'Dex',
  });

  Stat.Con({
    this.iconPath = 'assets/icon_assets/Constitution.png',
    @required
    this.value,
    this.col = Colors.orange,
    this.hasButtons = true,
    this.update,
    this.name = 'Con',
  });

  Stat.Str({
    this.iconPath = 'assets/icon_assets/Strength.png',
    @required
    this.value,
    this.col = Colors.red,
    this.hasButtons = true,
    this.update,
    this.name = 'Str',
  });

  Stat.Wis({
    this.iconPath = 'assets/icon_assets/Wisdom.png',
    @required
    this.value,
    this.col = Colors.brown,
    this.hasButtons = true,
    this.update,
    this.name = 'Wis',
  });

  Stat.Chr({
    this.iconPath = 'assets/icon_assets/Charisma.png',
    @required
    this.value,
    this.col = Colors.yellow,
    this.hasButtons = true,
    this.update,
    this.name = 'Chr',
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
        leftButton = new IconButton(icon: new Icon(Icons.remove), onPressed: (){sub();},iconSize: 12.0,);
        rightButton = new IconButton(icon: new Icon(Icons.add), onPressed: (){add();},iconSize: 12.0,);
      }
      else if(!widget.hasButtons && leftButton.runtimeType==IconButton){
      leftButton = Container();
      rightButton = Container();
    }


    return new Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: new Row(
        children: <Widget>[
          ///icon
          new Expanded(
            flex: 3,
            child: Stack(
              children: <Widget>[
                new Image.asset(widget.iconPath),
                Positioned(
                  top: 10.0,
                  left: 10.0,
                  child: Text(widget.iconPath.split('/')[2].substring(0,3))
                ),
              ]
            )
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