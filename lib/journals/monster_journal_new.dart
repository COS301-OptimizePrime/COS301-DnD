import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final List<Monster> monstersList = new List<Monster>();

class MonsterJournal extends StatefulWidget {
  static String tag = 'monster-journal';

  @override
  _MonsterJournalUpdatedState createState() => _MonsterJournalUpdatedState();
}

class _MonsterJournalUpdatedState extends State<MonsterJournal> {
  @override
  initState() {
    super.initState();
    if (monstersList.isEmpty)
      readFileIntoList().whenComplete(() {
        print('${monstersList.length} Monsters successfully loaded!');

        setState(() {
          //update dat list
        });
      });
  }

  Future readFileIntoList() async {
    String data =
        await rootBundle.loadString('assets/dad_5e_monster_manual.txt');

    ///convert list into monsters
    //first item in list contains our field
    //loop through list and add monsters!

    List<String> list = data.split('\r\n');

    List<String> fields;
    for (int i = 1; i < list.length - 1; i++) {
      //get
      fields = list.elementAt(i).split('\t');
//      print(i);
      monstersList.add(new Monster(
          fields.removeAt(0),
          fields.removeAt(0),
          fields.removeAt(0),
          fields.removeAt(0),
          double.parse(fields.removeAt(0)),
          int.parse(fields.removeAt(0)),
          int.parse(fields.removeAt(0)),
          parseBool(fields.removeAt(0)),
          fields.removeAt(0),
          fields.removeAt(0),
          parseTypes(fields)));
    }
  }

  bool parseBool(String removeAt) {
    return removeAt.compareTo("NO") == 0;
  }

  List<monsterType> parseTypes(List<String> fields) {
    List<monsterType> typing = new List<monsterType>();

    for (int i = 0; i < fields.length; i++) {
      if (fields.elementAt(i).compareTo("YES") == 0)
        typing.add(monsterType.values.elementAt(i));
    }

    return typing;
  }

  final TextEditingController monsterController = new TextEditingController();

  MonsterListBody mlb;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        //AppBars are the bars on top of the view
        centerTitle: true,
        title: TextField(
          controller: monsterController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search Monster Journal...'),
          onChanged: (searchText) {
            mlb.filter(searchText);
          },
        ),
        actions: <Widget>[],
      ),
      body: mlb = new MonsterListBody(),
    );
  }
}

class MonsterListBody extends StatefulWidget {
  static _MonsterListBodyState mlbs;
  static bool colorSwap = true;

  filter(String t) {
    mlbs.update(t);
  }

  @override
  _MonsterListBodyState createState() {
    mlbs = new _MonsterListBodyState();
    return mlbs;
  }
}

class _MonsterListBodyState extends State<MonsterListBody> {
  String filter;

  update(String t) {
    setState(() {
      filter = t;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: ListView(
        children: monstersList.map((Monster m) {
          if (filter == null || m.name.contains(filter)) {
            MonsterListBody.colorSwap = !MonsterListBody.colorSwap;
            return ExpandableMonsterItem(
              m,
              MonsterListBody.colorSwap,
            );
          } else
            return Container();
        }).toList(),
      ),
    );
  }
}

enum monsterType {
  ARCTIC,
  COAST,
  DESERT,
  FOREST,
  GRASSLAND,
  HILL,
  MOUNTAIN,
  SWAMP,
  UNDERDARK,
  UNDERWATER,
  URBAN
}

class Monster {
  final String name;
  final String type;
  final String alignment;
  final String size;
  final double cr;
  final int ac;
  final int hp;
  final bool spellcasting;
  final String atk1;
  final String atk2;
  final List<monsterType> typing;

  Monster(this.name, this.type, this.alignment, this.size, this.cr, this.ac,
      this.hp, this.spellcasting, this.atk1, this.atk2, this.typing);

  List<String> getTypes() {
    List<String> types = new List();
    typing.forEach((monsterType mt) {
      switch (mt) {
        case monsterType.ARCTIC:
          types.add('Arctic');
          break;
        case monsterType.COAST:
          types.add('Coast');
          break;
        case monsterType.DESERT:
          types.add('Desert');
          break;
        case monsterType.FOREST:
          types.add('Forest');
          break;
        case monsterType.GRASSLAND:
          types.add('Grassland');
          break;
        case monsterType.HILL:
          types.add('Hill');
          break;
        case monsterType.MOUNTAIN:
          types.add('Mountain');
          break;
        case monsterType.SWAMP:
          types.add('Swamp');
          break;
        case monsterType.UNDERDARK:
          types.add('Underdark');
          break;
        case monsterType.UNDERWATER:
          types.add('Underwater');
          break;
        case monsterType.URBAN:
          types.add('Urban');
          break;
      }
    });

    return types;
  }
}

String formatStringList(List<String> myList) {
  String tempString = '';

  if (myList.length > 0) tempString = myList.elementAt(0);
  else return 'None';

  for (int i = 1; i < myList.length; i++) {
    tempString += ', ' + myList.elementAt(i);
  }

  return tempString;
}

class ExpandableMonsterItem extends StatefulWidget {
  Monster expMonster;
  bool colorSwap;

  ExpandableMonsterItem(this.expMonster, this.colorSwap);

  @override
  _ExpandableMonsterItemState createState() =>
      new _ExpandableMonsterItemState();
}

class _ExpandableMonsterItemState extends State<ExpandableMonsterItem> {
  bool tapped = false;
  Widget viewM;

  void displayDetails() {
    setState(() {
      tapped = !tapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (tapped != true) {
      TextStyle textStyle;
      if (widget.colorSwap)
        textStyle = new TextStyle(color: Colors.red, fontSize: 20.0);
      else
        textStyle = new TextStyle(color: Colors.deepOrange, fontSize: 20.0);

      return new GestureDetector(
        onTap: () {
          displayDetails();
        },
        child: Container(
          height: MediaQuery.of(context).size.height / 14,
          width: double.infinity,
          child: new Center(
              child: Text(
            widget.expMonster.name,
            softWrap: false,
            maxLines: 1,
            style: textStyle,
          )),
        ),
      );
    } else {
      return new GestureDetector(
          onTap: () {
            displayDetails();
          },
          child: MonsterItemView(widget.expMonster));
    }
  }
}

class MonsterItem extends StatelessWidget {
  Monster myMon;
  bool colorSwap;

  MonsterItem({this.myMon, this.colorSwap});

  void displayDetails(BuildContext context) async {
    await Navigator
        .of(context)
        .push(new MaterialPageRoute<Null>(builder: (BuildContext context) {
      //build a new widget
      return new Scaffold(
        //new scaffold
        appBar: new AppBar(
          title: new Text((myMon.name.toString()),
              style: TextStyle(color: Colors.red)),
          centerTitle: true,
        ),
        body: MonsterItemView(myMon),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle;
    if (colorSwap)
      textStyle = new TextStyle(color: Colors.red, fontSize: 20.0);
    else
      textStyle = new TextStyle(color: Colors.deepOrange, fontSize: 20.0);

    return new GestureDetector(
      onTap: () {
        displayDetails(context);
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 14,
        child: new Center(
            child: Text(
          myMon.name,
          softWrap: false,
          maxLines: 1,
          style: textStyle,
        )),
      ),
    );
  }
}

class MonsterItemView extends StatelessWidget {
  MonsterItemView(Monster m) {
    mivMon = m;
  }

  Monster mivMon;

  @override
  Widget build(BuildContext context) {
    return new Container(
//      height: MediaQuery.of(context).size.height/4,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          children: (<Widget>[
            new Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: new Center(
                child: Text(
                  '${mivMon.name}',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Text(
                    'Type: ${mivMon.type}',
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                new Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: Text(
                    'Allignment: ${mivMon.alignment}',
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Text(
                    'Size: ${mivMon.size}',
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                new Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: Text(
                    'Challenge Rating: ${mivMon.cr}',
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Text(
                    'Armor Class: ${mivMon.ac}',
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                new Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: Text(
                    'Hit Points: ${mivMon.hp}',
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Text(
                    'Attack 1: ${mivMon.atk1}',
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                new Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: Text(
                    'Attack 2: ${mivMon.atk2}',
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Text(
                    'Types: ${formatStringList(mivMon.getTypes())}',
                    maxLines: 2,
                  ),
                ),],
            ),
            Row(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Text(
                    'Spell Casting: ${mivMon.spellcasting}',
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
