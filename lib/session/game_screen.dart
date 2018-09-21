import 'dart:async';

import 'package:dnd_301_final/app_data.dart';
import 'package:dnd_301_final/backend/server.pb.dart';
import 'package:dnd_301_final/character/character_selection.dart';
import 'package:dnd_301_final/journals/monster_journal_new.dart';
import 'package:dnd_301_final/menu.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';
//import 'package:draggable_scrollbar/draggable_scrollbar.dart';

///To hold the actual game screen logic
class GameScreen extends StatefulWidget {


  final List<PlayerFrame> playerCharacters = new List();
  final bool iAmDungeonMaster;
  final List<Monster> sessionMonsters = new List();
//  final PlayerView pv = PlayerView();
//  final MonstersTab mt = MonstersTab();


  GameScreen() : iAmDungeonMaster = false;
  GameScreen.isDM() : iAmDungeonMaster = true ;

  @override
  _GameScreenState createState() => _GameScreenState(playerCharacters);
}

class _GameScreenState extends State<GameScreen> {

  Timer timer;
  bool busy;

  bool iAmGameMaster = false;
  List<PlayerFrame> playerCharacters;


  _GameScreenState(List<PlayerFrame> list) {
    busy = false;
    playerCharacters = list;

    init().whenComplete(() {
      setState(() {
        timer = new Timer.periodic(
            const Duration(seconds: AppData.pollRate), (Timer t) => _update());
      });
    });
  }

  Future init() async
  {
    if (AppData.currentSession.charactersInSession.isEmpty)
      AppData.currentSession.charactersInSession.addAll(
          await AppData.getGameCharacters(AppData.currentSession.sessionId));

    if (playerCharacters.isEmpty)
      AppData.currentSession.charactersInSession.forEach((char) {
        playerCharacters.add(new PlayerFrame(char: char));
      });

//    if(widget.pv.playerCharacters==null || widget.pv.playerCharacters.isEmpty)
//      widget.pv.playerCharacters.addAll(playerCharacters);

//    if(widget.mt.monstersInSession.isEmpty)
//      widget.mt.monstersInSession.addAll();

    return;
  }


  _update() async
  {
    if (busy) return;
    busy = true;

    if (AppData.currentSession == null) {
      print('AppData.currentSession is null!');
      return;
    }

    LightSession response = await AppData.getLightSessionById(
        AppData.currentSession.sessionId);
    if (timer == null) {
      busy = false;
      return;
    }

    if (response == null) {
      print('response is null');
      busy = false;
      return;
    }

    bool needToUpdateView = false;

    //check if session has changed - and fetch full object if necessary
    if (AppData.currentSession.lastUpdated != response.lastUpdated) {
      //important - full session server call
      Session tempSession = await AppData.getSessionById(
      AppData.currentSession.sessionId);
      needToUpdateView = true;

      if (AppData.currentSession.status != tempSession.status) {
        print('Status: ${tempSession.status}');
        if (tempSession.status == "FAILED") print(
            'Status Message: ${tempSession.statusMessage}');
      }

      if (AppData.currentSession.state != tempSession.state) {
        print('State: ${tempSession.state}');
      }

      if (AppData.currentSession.users.length != tempSession.users.length) {
        print('Number of users: ${tempSession.users.length}');
      }

      //update full session object
      AppData.currentSession = tempSession;
    }

    ///@todo: implement update of PlayerView
//    for (LightCharacter char in AppData.currentSession.charactersInSession) {
//      PlayerFrame pf = playerCharacters.firstWhere((c) =>
//      c.pfs.character.characterId == char.characterId, orElse: () {
//        return null;
//      });
//      LightCharacter c = (pf != null) ? pf.pfs.character : null;
//
//      //character not found in local list
//      if (c == null) {
//        playerCharacters.add(new PlayerFrame(char: char,));
//        needToUpdateView = true;
//      }
//      else if (c.lastUpdated != char.lastUpdated) {
//        //character and local do not match
//        c = char;
//        pf.pfs.update(char);
//        needToUpdateView = true;
//      }

//      print('${char.name} : updated');
//    }

    busy = false;

    try {
      if (needToUpdateView)
        if(this.mounted)setState(() {
          // _items = _items;
          print('updating view');
        });
    }
    catch (Exception) {
      print(
          'setState called on null - an update was called on a deleted state');
    }
  }


  @override
  void dispose() {
    super.dispose();
    if (timer != null)
      timer.cancel();
  }

//  PlayerView pv;
//  MonstersTab mt;

  @override
  Widget build(BuildContext context) {
    if (widget.iAmDungeonMaster) {

//      if(pv ==null)
//        pv = PlayerView.list(playerCharacters);
//
//      if(mt == null)
//        mt = MonstersTab.list(widget.sessionMonsters);

      return new DefaultTabController(length: 2,
          child: Scaffold(
            drawer: Menu(),
            appBar: AppBar(
              title: Text(AppData.currentSession.name),
              bottom: TabBar(
                tabs: [
                  Tab(text: 'Adventurers',),
                  Tab(text: 'Monsters',),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                PlayerView.list(playerCharacters),
                MonstersTab.list(widget.sessionMonsters),
              ],
            ),
          )
      );


//      return Scaffold(
//        drawer: Menu(),
//        appBar: AppBar(
//          title: Text(AppData.currentSession.name),
//        ),
//        body: TabWidget(
//          tabHeadings: <Widget>[
//            Text('Players'),
//            Text('Monsters'),
//          ],
//          tabs: <Widget>[
////            new PlayerView(playerCharacters),
//            pv,
////            Text('why hello there'),
//            mt,
////            new MonstersTab(widget.sessionMonsters)
//          ],
//        ),
//      );
    }
    else
      //if a user
      return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          title: Text(AppData.currentSession.name),
        ),
        body: PlayerView.list(playerCharacters),
      );
  }
}

class PlayerView extends StatelessWidget {

  final List<PlayerFrame> playerCharacters;


  PlayerView() : playerCharacters = new List();
  PlayerView.list(List<PlayerFrame> list): playerCharacters = list;

  @override
  Widget build(BuildContext context) {
    if(playerCharacters==null || playerCharacters.isEmpty)
      return Container(child: null,);

    return Column(
      children: playerCharacters,
    );

//    return Container(
//      child: ListView.builder(
//          padding: kMaterialListPadding,
//          itemCount: playerCharacters.length,
//          itemBuilder: (BuildContext context, int index) {
//            return playerCharacters[index];
//          }),
//    );
  }
}


class PlayerFrame extends StatefulWidget {


  PlayerFrame({this.char});

  final LightCharacter char;

  @override
  _PlayerFrameState createState() => _PlayerFrameState(char);

}

class _PlayerFrameState extends State<PlayerFrame> {

  _PlayerFrameState(LightCharacter c) : character = c;

  LightCharacter character;
//  static bool alternate = true;

  update(LightCharacter c)
  {
    setState(() {
      //update widget
      character = c;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
//      height: AppData.screenHeight/5,
      child: CharacterLightView(lightChar: character,titleStyle: null,),
//      child: Row(
//        children: <Widget>[
//          ///player image
//          Container(
//            width: AppData.screenWidth/9,
//            child: null,
//              //@todo add player image
//          ),
//
//          ///player details
//          Column(
//            children: <Widget>[
//              ///player name and class/race
//
//
//              ///player xp bar
////              PlayerXpBar(),
//            ],
//          )
//        ],
//      ),
    );
  }
}

class MonstersTab extends StatefulWidget {

  final List<Monster> monstersInSession;
  final List<MonsterListItem> markedForReclaim = new List();

  MonstersTab() : monstersInSession = new List();
  MonstersTab.list(List<Monster> list) : monstersInSession = new List();



  @override
  MonstersTabState createState() => new MonstersTabState();
}
class MonstersTabState extends State<MonstersTab> {

  final List<MonsterListItem> monstersToAdd = new List();

  MonstersTabState()
  {
    if (monstersList.isEmpty)
      MonsterJournal.loadMonsters().whenComplete(() {
        if(this.mounted)
          setState(() {
          //update dat list
        });
      });

//    monstersToAdd.add(AddMonsterListItem(update: addMonsterToList,));

  }

  addMonsters(List<MonsterListItem> list)
  {
    List<Monster> temp = list.map((mli){return mli.monster;}).toList();
    widget.monstersInSession.addAll(
        temp
    );

    setState(() {
      //update view
    });
  }

  bool addingMonster = false;
  ScrollController myScrollController = new ScrollController();
  AddMonsterListItem addListTile;


  deleteItemFromList(int id)
  {
    monstersToAdd.removeWhere((mli)=>mli.id == id);
  }

  addMonsterToList(MonsterListItem mli)
  {
    setState(() {
      //update view
      monstersToAdd.insert(0,mli);
    });
  }

  List<MonsterListItem> monsters = new List();
  List<MonsterListItem> reclaimList;
  markForXpReclaim(int index)
  {
    if(reclaimList==null)
      reclaimList = new List();

    reclaimList.add(
      monsters.elementAt(index)
    );
  }

  killMonstersAndGetXp()
  {

    int total = 0;

    //go through reclaimList and remove every monster from monsters list
    //and sum the xp
    reclaimList.forEach((mli){
      total+=mli.monster.xp;
      int index = monsters.indexOf(mli);
      widget.monstersInSession.removeAt(index);
    });

    reclaimList.clear();

    print('=========================>  XP: $total   <=======================');

    int xp = AppData.currentSession.charactersInSession.length;
    xp = total~/xp;
    AppData.currentSession.charactersInSession.forEach((c){
      c.xp+=xp;
    });

    setState(() {
      print('=========================>  XP: $total   <=======================');
    });


    ///@todo: Get that yummy xp to the server vaults!
//    AppData.distributeXP(total).whenComplete((){
//      if(this.mounted)
//      setState(() {
//        print('=========================>  XP: $total   <=======================');
//      });
//    });

  }


  @override
  Widget build(BuildContext context) {


    if(!addingMonster)
      {
        monsters.clear();

        return Scaffold(
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.deepOrange,width: 3.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text('Name',style: TextStyle(fontSize: 20.0,color: Colors.red),),
                    ),

                    Text('CR:'),

                    Text('XP'),
                    Text('Killed'),

                  ],
                ),
              ),
              Expanded(
                child: new ListView.builder(
                  padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),//adds padding between cards and screen
                  itemCount: widget.monstersInSession.length,
                  itemBuilder: (BuildContext context, int index){
                    monsters.add(MonsterListItem((){markForXpReclaim(index);},monster: widget.monstersInSession[index],));
                    return monsters.last;
                  },
//                children: widget.monstersInSession.map((m){
//                  return MonsterListItem(markForXpReclaim, monster: m,);
//                }).toList()
                ),
              ),
            ],
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: FloatingActionButton(
                  backgroundColor: Colors.purple,
                  heroTag: null,
                  onPressed: (){
                    killMonstersAndGetXp();
                  },
                  child: Icon(Icons.all_inclusive),
                ),
              ),
              FloatingActionButton(
                onPressed: (){
                  setState(() {
                    addingMonster=true;
                  });
                },
                child: Icon(Icons.add),
              ),
            ],
          ),
        );
      }

    else///adding monsters
      {
        bool colorswap = false;
        int itemExtent =3+22-2;//padding + container height - delta
        if(addListTile==null)
          addListTile = AddMonsterListItem(update: addMonsterToList,deleteListItem: deleteItemFromList,);

        return Scaffold(
          resizeToAvoidBottomPadding: false,
//          body: DraggableScrollbar.rrect(
//            controller: myScrollController,
//            labelTextBuilder: (offset) => Text('${monstersList.elementAt((offset/itemExtent).round()).name[0].toUpperCase()}',style: TextStyle(color: Colors.black),),
//            child: ListView(
//                controller: myScrollController,
//                padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),//adds padding between cards and screen
//                children: monstersList.map((Monster mon) {  //this goes through all our monsters and makes a card for each
//                  colorswap = !colorswap;
//                  return new GestureDetector(
//                    child: Center(child: Container(padding: EdgeInsets.symmetric(vertical: 3.0),height: 22.0,child: Text(mon.name,style: TextStyle(fontSize: 20.0,color: (colorswap)? Colors.deepOrange : Colors.red),))),
//                  );
//                }).toList()
//            ),
//          ),
          body: Container(
            child: Column(
              children: <Widget>[
                //Add Monsters
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Monsters:',style: TextStyle(fontSize: 25.0,color: Colors.deepOrange),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text('Name',style: TextStyle(fontSize: 20.0,color: Colors.red),),
                    ),

                    Text('CR:'),

                    Text('XP'),
                    Text('DELETE'),

                  ],
                ),
                Expanded(
                  child: Container(
                    child:  ListView.builder(
                      itemCount: monstersToAdd.length,
                      itemBuilder: (BuildContext context, int index) {
                        return monstersToAdd[index];
                      }),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 80.0),
                  child: addListTile,
                ),

              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            heroTag: null,
            backgroundColor: Colors.primaries[9],
            onPressed: (){
              addMonsters(monstersToAdd);
              monstersToAdd.clear();
              addListTile = null;
              setState(() {
                addingMonster=false;
              });
            },
            child: Icon(Icons.done),
          ),
        );

      }

  }
}

class MonsterListItem extends StatefulWidget {

  final Monster monster;
  final int id;
  static int mid = 0;
  static bool colorSwap = false;

  final Function state;

  MonsterListItem(Function notify,{this.monster}) : id = mid++, state = ((){return _MonsterListItemState(notify);});

  MonsterListItem.add(Function delete,{this.monster,}): id = mid++, state = ((){return _MonsterListItemAddState(delete);});

  @override
  State<StatefulWidget> createState() => state();
}

///monster list item state with delete functionality
class _MonsterListItemAddState extends State<MonsterListItem>
{
  Function delete;
  _MonsterListItemAddState(Function f) : delete = f;

  @override
  Widget build(BuildContext context) {

        MonsterListItem.colorSwap = !MonsterListItem.colorSwap;

        return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Text(widget.monster.name,style: TextStyle(fontSize: 20.0,color: (MonsterListItem.colorSwap)? Colors.purpleAccent : Colors.teal),),
          ),

          Text(widget.monster.cr.toString()),

          Text(widget.monster.xp.toString()),

          FlatButton(
            onPressed: (){
              delete(widget.id);
            },
            child: Icon(Icons.delete),
          ),

        ]
    );
  }

}

///normal monster list item state - with checkbox functionality
class _MonsterListItemState extends State<MonsterListItem>
{

  bool isChecked = false;
  Function notify;

  _MonsterListItemState(Function n) : notify = n;


  @override
  Widget build(BuildContext context) {

    MonsterListItem.colorSwap = !MonsterListItem.colorSwap;

    Widget type;
    if(isChecked)
      type = Icon(Icons.check_box);
    else
      type = Icon(Icons.check_box_outline_blank);

    return GestureDetector(
      onTap: (){
        notify();
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(widget.monster.name,style: TextStyle(fontSize: 20.0,color: (MonsterListItem.colorSwap)? Colors.purpleAccent : Colors.teal),),
            ),

            Text(widget.monster.cr.toString()),

            Text(widget.monster.xp.toString()),

            type,

          ]
      ),
    );

  }
}


class AddMonsterListItem extends StatefulWidget {

  final List<Widget> listOfMonsters;
  final Function update;
  final Function deleteListItem;

  AddMonsterListItem({this.listOfMonsters,this.update,this.deleteListItem});

  @override
  _AddMonsterListItemState createState() => _AddMonsterListItemState();
}

class _AddMonsterListItemState extends State<AddMonsterListItem> {

  bool capturingNewMonster = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController combatController = TextEditingController();
  final TextEditingController xpController = TextEditingController();

  deletingItemFromList(int id)
  {
    widget.deleteListItem(id);
    setState(() {
      //update view to reflect item being deleted
    });
  }

  @override
  Widget build(BuildContext context) {

    if(!capturingNewMonster)
      return Container(
        child: FlatButton(
          onPressed: (){
            //add new monster dialog or w/e
            setState(() {
              capturingNewMonster = true;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Add Monster'),
              Icon(Icons.add_circle_outline)
            ],
          ),
        ),
      );
    else{
      String amount = "Amount";

      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 4.0),
        decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.deepOrange,width: 3.0),bottom: BorderSide(color: Colors.deepOrange,width: 3.0))),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Text('Name:'),
                      ),
                      Expanded(
                        child: Text('Combat Rating'),
                      ),
                      Expanded(
                        child: Text('Experience')
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(hintText: 'Name'),
//                          onSubmitted: (val){nameController.value = TextEditingValue(text: val);},
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: combatController,
                          decoration: InputDecoration(hintText: 'CR'),
                          keyboardType: TextInputType.number,
                          onSubmitted: (val){xpController.text = (combatRatingToXp(double.parse(val))).toString() ;},
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: xpController,
                          decoration: InputDecoration(hintText: amount),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: FlatButton(
                onPressed: (){
                  //add new MonsterListItem to list
                  print('adding ${nameController.value.text} to list');
                  widget.update(MonsterListItem.add(
                    deletingItemFromList,
                    monster: new Monster(nameController.value.text, null, null, null, double.parse(combatController.value.text), null, null, null, null, null, null,int.parse(xpController.value.text)),
                  ));
                },
                child: Icon(Icons.add),
              ),
            )
          ],
        ),
      );
    }
  }
}


//class TabWidget extends StatefulWidget {
//
//  final List<Widget> tabHeadings;
//  final List<Widget> tabs;
//
//  TabWidget({this.tabHeadings,this.tabs});
//
//  @override
//  _TabWidgetState createState() => _TabWidgetState(tabHeadings,tabs);
//}
//
//class _TabWidgetState extends State<TabWidget> {
//
//  List<FlatButton> tabButtons = new List();
//  List<Widget> tabHeadings;
//  List<Widget> tabs;
//
//  int last = 0;
//
//  _TabWidgetState(List<Widget> headings, List<Widget> t) {
//    tabHeadings = headings;
//    tabs = t;
//
//    if (tabButtons.isEmpty) {
//      tabButtons.add(FlatButton(
//        onPressed: () {
//          //track
//          update(0);
//        },
//        child: Container(
//          decoration: BoxDecoration(
//              border: Border(
//                  bottom: BorderSide(color: Colors.deepOrange, width: 2.0))
//          ),
//          child: tabHeadings[0],
//        ),
//      ));
//
//      for (int i = 1; i < tabHeadings.length; i++) {
//        tabButtons.add(FlatButton(
//          onPressed: () {
//            //track
//            update(i);
//          },
//          child: tabHeadings[i],
//        ));
//      }
//    }
//  }
//
//  update(int index) {
//    int temp = last;
//    //last has no value initially
//    if (last != index) {
//      tabButtons[index] = new FlatButton(onPressed: () {
//        update(index);
//      }, child: Container(
//        decoration: BoxDecoration(
//            border: Border(
//                bottom: BorderSide(color: Colors.deepOrange, width: 2.0))
//        ),
//        child: tabHeadings[index],
//      ));
//
//      tabButtons[temp] = new FlatButton(onPressed: () {
//        update(temp);
//      }, child: Container(
//        child: tabHeadings[temp],
//      ));
//
//      if(this.mounted)
//        setState(() {
//        //update view
//        last = index;
//      });
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Column(
//          children: <Widget>[
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: tabButtons.map((b) {
//                return Expanded(child: b);
//              }).toList(),
//            ),
//            Expanded(child: tabs[last],)
//          ]
//      ),
//    );
//  }
//}