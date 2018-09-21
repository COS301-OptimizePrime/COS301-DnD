import 'package:dnd_301_final/app_data.dart';
import 'package:dnd_301_final/character/races_and_classes.dart';
import 'package:flutter/material.dart';

//final List<Monster> monstersList = new List<Monster>();

class RaceViewer extends StatefulWidget {
  static String tag = 'race-journal';

  @override
  _RaceViewerUpdatedState createState() => _RaceViewerUpdatedState();
}

class _RaceViewerUpdatedState extends State<RaceViewer> {



  final TextEditingController monsterController = new TextEditingController();

  RaceViewerBody mlb;

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
              hintText: 'Search Race Journal...'),
          onChanged: (searchText) {
            mlb.filter(searchText);
          },
        ),
        actions: <Widget>[],
      ),
      body: mlb = new RaceViewerBody(),
    );
  }
}

class RaceViewerBody extends StatefulWidget {
  static _RaceViewerBodyState mlbs;
  static bool colorSwap = true;

  filter(String t) {
    mlbs.update(t);
  }

  @override
  _RaceViewerBodyState createState() {
    mlbs = new _RaceViewerBodyState();
    return mlbs;
  }
}

class _RaceViewerBodyState extends State<RaceViewerBody> {
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
        children: races.map((Race r) {
          if (filter == null || r.name.contains(filter)) {
            RaceViewerBody.colorSwap = !RaceViewerBody.colorSwap;
            return ExpandableRaceItem(
              r,
              RaceViewerBody.colorSwap,
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

class ExpandableRaceItem extends StatefulWidget {
  Race race;
  bool colorSwap;

  ExpandableRaceItem(this.race, this.colorSwap);

  @override
  _ExpandableRaceItemState createState() =>
      new _ExpandableRaceItemState();
}

class _ExpandableRaceItemState extends State<ExpandableRaceItem> {
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
                widget.race.name,
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
          child: RaceItemView(race: widget.race));
    }
  }
}

class RaceItemView extends StatelessWidget {
  RaceItemView({
    this.race,
  });

  final Race race;

  @override
  Widget build(BuildContext context) {
    return new Container(
//      height: MediaQuery.of(context).size.height/4,
      child: Column(
        children: <Widget>[
          Text(race.name,textScaleFactor: 2.0,style: TextStyle(fontWeight: FontWeight.bold),),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                    new Container(
                      height: AppData.screenHeight/6,
                      child: Image.asset('assets/race_images/${race.getImage()}.png',fit: BoxFit.scaleDown,),
                    ),
//                Expanded(child: Container(),),

                  //traits n stuff
                  Container(width: AppData.screenWidth/3,
                      child: Text(race.desc,textAlign: TextAlign.center,)
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
