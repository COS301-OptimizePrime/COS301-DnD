import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final List<Monster> monstersList = new List<Monster>();

class MonsterJournal extends StatefulWidget {
  static String tag = 'monster-journal';

  static Future loadMonsters() async
  {
    await readFileIntoList();
    print('loaded monsters');
    return;
  }

  static Future readFileIntoList() async {
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
          parseTypes(fields),
          null
      ));
    }
  }

  static bool parseBool(String removeAt) {
    return removeAt.compareTo("NO") == 0;
  }

  static List<monsterType> parseTypes(List<String> fields) {
    List<monsterType> typing = new List<monsterType>();

    for (int i = 0; i < fields.length; i++) {
      if (fields.elementAt(i).compareTo("YES") == 0)
        typing.add(monsterType.values.elementAt(i));
    }

    return typing;
  }

  @override
  _MonsterJournalUpdatedState createState() => _MonsterJournalUpdatedState();
}

class _MonsterJournalUpdatedState extends State<MonsterJournal> {


  @override
  initState() {
    super.initState();
    if (monstersList.isEmpty)
      MonsterJournal.loadMonsters().whenComplete(() {
        if(this.mounted)
          setState(() {
          //update dat list
        });
      });
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

int calcLevel(int xp)
{
if     (xp<300)
return 1;
else if(xp<900)
return 2;
else if(xp<2700)
return 3;
else if(xp<6500)
return 4;
else if(xp<14000)
return 5;
else if(xp<27000)
return 6;
else if(xp<34000)
return 7;
else if(xp<48000)
return 8;
else if(xp<64000)
return 9;
else if(xp<85000)
return 10;
else if(xp<100000)
return 11;
else if(xp<120000)
return 12;
else if(xp<140000)
return 13;
else if(xp<165000)
return 14;
else if(xp<195000)
return 15;
else if(xp<225000)
return 16;
else if(xp<265000)
return 17;
else if(xp<305000)
return 18;
else if(xp<355000)
return 19;
else
return 20;
}

double calcPercentToNextLevel(int level, int xp)
{

  switch (level)
  {
    case 1: return xp/300.0;
    case 2: return xp/900.0;
    case 3: return xp/2700.0;
    case 4: return xp/6500.0;
    case 5: return xp/14000.0;
    case 6: return xp/23000.0;
    case 7: return xp/34000.0;
    case 8: return xp/48000.0;
    case 9: return xp/64000.0;
    case 10: return xp/85000.0;
    case 11: return xp/100000.0;
    case 12: return xp/120000.0;
    case 13: return xp/140000.0;
    case 14: return xp/165000.0;
    case 15: return xp/195000.0;
    case 16: return xp/225000.0;
    case 17: return xp/265000.0;
    case 18: return xp/305000.0;
    case 19: return xp/355000.0;
    default: return 1.0;
  }
}


int calcProf(int lvl)
{
if(lvl<5)
return 2;
else if(lvl<9)
return 3;
else if(lvl<13)
return 4;
else if(lvl<17)
return 5;
else
return 6;
}


int combatRatingToXp(double cr) {
if(cr==0)
return 10;
else if(cr==0.125)
return 25;
else if(cr==0.25)
return 50;
else if(cr==0.5)
return 100;
else if(cr==1)
return 200;
else if(cr==2)
return 450;
else if(cr==3)
return 700;
else if(cr==4)
return 1100;
else if(cr==5)
return 1800;
else if(cr==6)
return 2300;
else if(cr==7)
return 2900;
else if(cr==8)
return 3900;
else if(cr==9)
return 5000;
else if(cr==10)
return 5900;
else if(cr==11)
return 7200;
else if(cr==12)
return 8400;
else if(cr==13)
return 10000;
else if(cr==14)
return 11500;
else if(cr==15)
return 13000;
else if(cr==16)
return 15000;
else if(cr==17)
return 18000;
else if(cr==18)
return 20000;
else if(cr==19)
return 22000;
else if(cr==20)
return 25000;
else if(cr==21)
return 33000;
else if(cr==22)
return 41000;
else if(cr==23)
return 50000;
else if(cr==24)
return 62000;
else if(cr==25)
return 75000;
else if(cr==26)
return 90000;
else if(cr==27)
return 105000;
else if(cr==28)
return 120000;
else if(cr==29)
return 135000;
else
return 155000;

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
  final int xp;

  Monster(this.name, this.type, this.alignment, this.size, this.cr, this.ac,
      this.hp, this.spellcasting, this.atk1, this.atk2, this.typing, this.xp);

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
  final Monster expMonster;
  final bool colorSwap;

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
