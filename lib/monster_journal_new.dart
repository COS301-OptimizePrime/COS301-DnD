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
  initState()
  {
    super.initState();
    if(monstersList.isEmpty)
      readFileIntoList().whenComplete(
          ()
          {
            print('Monsters successfully loaded!');
            print(monstersList.length);

            setState(() {
              //update dat list
            });
          }
      );
  }

  Future readFileIntoList() async
  {

    String data = await rootBundle.loadString('assets/dad_5e_monster_manual.txt');
    ///convert list into monsters
    //first item in list contains our field
    //loop through list and add monsters!

    List<String> list = data.split('\r\n');

    List<String> fields;
    for(int i = 1; i < list.length-1;i++)
    {
      //get
      fields = list.elementAt(i).split('\t');
      print(i);
      monstersList.add(
          new Monster(fields.removeAt(0), fields.removeAt(0), fields.removeAt(0), fields.removeAt(0), double.parse(fields.removeAt(0)), int.parse(fields.removeAt(0)), int.parse(fields.removeAt(0)),
              parseBool(fields.removeAt(0)), fields.removeAt(0), fields.removeAt(0), parseTypes(fields))
      );

    }
  }

  bool parseBool(String removeAt) {
    return removeAt.compareTo("NO")==0;
  }

  List<monsterType> parseTypes(List<String> fields) {

    List<monsterType> typing = new List<monsterType>();

    for(int i = 0; i < fields.length;i++)
    {
      if(fields.elementAt(i).compareTo("YES")==0)
        typing.add(monsterType.values.elementAt(i));
    }

    return typing;
  }

  final TextEditingController monsterController = new TextEditingController();


  MonsterListBody mlb;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar( //AppBars are the bars on top of the view
        centerTitle: true,
        title: TextField(
          controller: monsterController,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search Monster Journal...'
          ),
          onChanged: (searchText) {
            mlb.filter(searchText);
          } ,
        ),
        actions: <Widget>[

        ],
      ),


      body: mlb = new MonsterListBody(),

//
//      body: new ListView(
//        itemExtent: 30.0,
//        padding: const EdgeInsets.all(8.0),
//        children: monstersList.map((Monster m)
//        {
//          return new Container(
//              height: 30.0,
//              child: new Text(m.name,softWrap: false,maxLines: 1,style: new TextStyle(color: Colors.red,),));
//        }).toList(),
//      ),
    );
  }
}

class MonsterListBody extends StatefulWidget {

  static _MonsterListBodyState mlbs;

  filter(String t)
  {
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
  
  update(String t)
  {
    setState(() {
      filter = t;
    });
  }
  
  @override
  Widget build(BuildContext context)
  {
    return new Container(
      
      child: ListView(
        children: monstersList.map(
        (Monster m) {
          if(filter==null || m.name.contains(filter))
            return MonsterItem(myMon: m,);
          else
            return Container();
        }
        ).toList(),
      ),

//      child: ListView.builder(
//      itemCount: monstersList.length-1,
//          itemBuilder: (context, index)
//          {
//            final Monster m = monstersList.elementAt(index);
//
//            if(filter==null || m.name.contains(filter))
//              return new Text(m.name,softWrap: false,maxLines: 1,style: new TextStyle(color: Colors.red,),);
//            else
//              return Container();
//
////            return new Text(monstersList.elementAt(item).name,softWrap: false,maxLines: 1,style: new TextStyle(color: Colors.red,),);
//          }
//      ),
    );
  }
}


enum monsterType
{
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

//  List<String> getTypes()
//  {
//    return
//  }

}



class MonsterItem extends StatelessWidget {

  Monster myMon;

  MonsterItem({
    this.myMon
});

  void displayDetails(BuildContext context) async
  {
    await Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          //build a new widget
          return new Scaffold( //new scaffold
              appBar: new AppBar(
                title: Text(myMon.name.toString()), //title of view
                centerTitle: true,
              ),
             body: MonsterItemView(myMon),
          );
        }
    ));
  }

  @override
  Widget build(BuildContext context) {
//    return new Text(myMon.name,softWrap: false,maxLines: 1,style: new TextStyle(color: Colors.red,),);

    return new GestureDetector(
      onTap: (){displayDetails(context);},
      child: Container(
        height: MediaQuery.of(context).size.height/14,
        child: new Center(child: Text(myMon.name,softWrap: false,maxLines: 1,style: new TextStyle(color: Colors.red, fontSize: 20.0),)),
      ),
    );

  }
}

class MonsterItemView extends StatelessWidget {

  MonsterItemView(Monster m)
  {
    mivMon = m;
  }

  Monster mivMon;

  @override
  Widget build(BuildContext context) {

    return new SizedBox(
      height: MediaQuery.of(context).size.height,
      child: new Center(
        child: new Column(
          children: <Widget>[
            Text(
              'Type: ${mivMon.type}',
            ),
            Text(
              'Allignment: ${mivMon.alignment}',
            ),
            Text(
              'Size: ${mivMon.size}',
            ),
            Text(
              'Challenge Rating: ${mivMon.cr}',
            ),
            Text(
              'Armor Class: ${mivMon.ac}',
            ),
            Text(
              'Hit Points: ${mivMon.hp}',
            ),
            Text(
              'Spell Casting: ${mivMon.spellcasting}',
            ),
            Text(
              'Attack 1: ${mivMon.atk1}',
            ),
            Text(
              'Attack 2: ${mivMon.atk2}',
            ),
          new Expanded(
            child: ListView(
              children: mivMon.typing.map(
                (monsterType mt){
                  return new Center(child: Text(mt.toString()));
                }
              ).toList(),
            ),
          )
          ],
        ),
      ),
    );
  }
}


