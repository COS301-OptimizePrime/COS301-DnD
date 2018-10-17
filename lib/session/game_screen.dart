import 'dart:async';

import 'package:dnd_301_final/app_data.dart';
import 'package:dnd_301_final/backend/server.pb.dart';
import 'package:dnd_301_final/character/character_creation.dart';
import 'package:dnd_301_final/character/character_selection.dart';
import 'package:dnd_301_final/journals/monster_journal_new.dart';
import 'package:dnd_301_final/menu.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:qr_flutter/qr_flutter.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';
//import 'package:draggable_scrollbar/draggable_scrollbar.dart';

///To hold the actual game screen logic
class GameScreen extends StatefulWidget {


//  final List<PlayerFrame> playerCharacters = new List();
  final bool iAmDungeonMaster;
//  final List<Monster> sessionMonsters = new List();
  final String charID;

//  static bool getCharacters = false;
//  static bool mustUpdateChar = false;

//  final PlayerView pv = PlayerView();
//  final MonstersTab mt = MonstersTab();


  GameScreen.isPlayer({this.charID}) : iAmDungeonMaster = false;

  GameScreen.isDM() : iAmDungeonMaster = true, charID =null {
    MonsterListItem.mid = 0;
    MonsterListItem.colorSwap = false;
  }

  @override
//  _GameScreenState createState() => _GameScreenState(playerCharacters);
  _GameScreenState createState() => _GameScreenState();

  static void cleanUp()
  {
    if(MonstersTab.monstersInSession!=null){
      MonstersTab.monstersInSession.clear();
//      MonstersTab.monstersInSession=null;
    }

    if(SpellSlots.usedSpells!=null){
      SpellSlots.usedSpells.clear();
//      SpellSlots.usedSpells=null;
      SpellSlots.resetMode = false;
    }

    if(MonsterListItem.mid!=0){
      MonsterListItem.mid=0;
      MonsterListItem.colorSwap=false;
    }

    if(_PlayerSelfViewState.myChar!=null) _PlayerSelfViewState.myChar=null;

    PlayerSelfView.currentHp=null;
    PlayerSelfView.maxHp=null;
  }
}

class _GameScreenState extends State<GameScreen> with SingleTickerProviderStateMixin{

  Timer timer;
  bool busy;

  bool iAmGameMaster = false;
//  List<PlayerFrame> playerCharacters;


//  _GameScreenState(List<PlayerFrame> list) {
  _GameScreenState() {
    busy = false;
//    playerCharacters = list;

    init().whenComplete(() {
      setState(() {
        timer = new Timer.periodic(
            const Duration(seconds: AppData.pollRate*5), (Timer t) => _update()
        );
      });
    });
  }

  Future init() async
  {
    if (AppData.currentSession.charactersInSession.isEmpty)
      AppData.currentSession.charactersInSession.addAll(
          await AppData.getGameCharacters(AppData.currentSession.sessionId));

//    if (playerCharacters.isEmpty)
//      AppData.currentSession.charactersInSession.forEach((char) {
//        playerCharacters.add(new PlayerFrame(char: char));
//      });

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

    if(!iAmGameMaster){
      print('updating party...');
      AppData.currentSession.charactersInSession.clear();
      AppData.currentSession.charactersInSession.addAll(await AppData.getGameCharacters(AppData.currentSession.sessionId));
      print('updated party');
    }


    if (response == null) {
      print('response is null');
      busy = false;
      return;
    }

    bool needToUpdateView = false;

//    if(GameScreen.getCharacters){
//      GameScreen.getCharacters =false;
//    print('updating party...');
//    //update characters
////      AppData.currentSession = tempSession;
//    AppData.currentSession.charactersInSession.clear();
//    AppData.currentSession.charactersInSession.addAll(await AppData.getGameCharacters(AppData.currentSession.sessionId));
//    needToUpdateView = true;
//    print('updated party');
//  }


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
      AppData.currentSession.charactersInSession.clear();
      AppData.currentSession.charactersInSession.addAll(await AppData.getGameCharacters(AppData.currentSession.sessionId));

      if(!iAmGameMaster) _PlayerSelfViewState.myChar = await AppData.getCharacterById(_PlayerSelfViewState.myChar.characterId);
    }

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

//  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _tabController = TabController(length: 2, vsync: this,);
//    _tabController.animation = CurvedAnimation(
//      parent:
//    );
  }


  @override
  Widget build(BuildContext context) {
    if (widget.iAmDungeonMaster) {

      return new DefaultTabController(length: 2,
          child: Scaffold(
            drawer: Menu(),
            appBar: AppBar(
              title: Text(AppData.currentSession.name),
              actions: <Widget>[
                new IconButton(
                  icon: new Icon(Icons.person_add),
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) => new Dialog(child: new Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: new Container(
                                child: new Text("Scan the QR code to join!",style: new TextStyle(fontSize: 20.0,color: Colors.deepOrange),),
                              ),
                            ),
                            new Container(
                              color: Colors.white,
                              child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    new QrImage(data: AppData.currentSession.sessionId, size: 250.0,)
                                  ]),
                            ),
                          ]),
                      ),
                      //child:  new QrMakerWidget(),
                    );
                  },
                ),
                new IconButton(icon: new Icon(Icons.exit_to_app),
                    onPressed: () {
                      AppData.leaveSessions(AppData.currentSession.sessionId);
                      Navigator.pop(context);
                    }
                ),
              ],
              bottom: TabBar(
                tabs: [
                  Tab(text: 'Adventurers',),
                  Tab(text: 'Monsters',),
                ],
              ),
            ),
            body: TabBarView(
//              controller: ,
              children: [
//                PlayerView.list(playerCharacters),
                PartyView(),
                MonstersTab(),
              ],
            ),
          )
      );

    }
    else {
      //if a user
      return new DefaultTabController(length: 2,
          child: Scaffold(
            drawer: Menu(),
            appBar: AppBar(
              title: Text(AppData.currentSession.name),
              actions: <Widget>[
                new IconButton(icon: new Icon(Icons.exit_to_app),
                    onPressed: () {
                      AppData.leaveSessions(AppData.currentSession.sessionId);
                      Navigator.pop(context);
                    }
                ),
              ],
              bottom: TabBar(
                tabs: [
                  Tab(text: 'Myself',),
                  Tab(text: 'Party',),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                PlayerSelfView(myCharID: widget.charID),
                PartyView(),
              ],
            ),
          )
      );
    }
  }
}

class PlayerSelfView extends StatefulWidget {

  final String myCharID;

  static int currentHp;
  static int maxHp;

  PlayerSelfView({this.myCharID});

  @override
  _PlayerSelfViewState createState() => _PlayerSelfViewState();
}

class _PlayerSelfViewState extends State<PlayerSelfView> {

  static LocalCharacter myChar;
  bool update = false;

  @override
  void initState() {
    super.initState();

    if(PlayerSelfView.currentHp==null){
      PlayerSelfView.currentHp = 100;
      PlayerSelfView.maxHp = 100;
    }

  }


  Future<LocalCharacter> getCharacter(String id) async
  {
    if(id == null) id = AppData.currentSession.charactersInSession.firstWhere((c)=>c.creatorId==AppData.user.uid,orElse: (){return null;})?.characterId;
    if(id == null) return null;

    return await AppData.getCharacterById(id);
  }

  bool editing = false;
  bool busy = false;
  bool shouldUpdate = false;
  void toggleEdit() async
  {
    if(busy) return;
    busy = true;

    //done editing
    if(editing){
      if(shouldUpdate){
        AppData.updateCharacter(myChar);
        shouldUpdate = false;
      }
    }

    setState(() {
      editing = !editing;
      print('Editing: $editing');
    });

    busy = false;

  }

  @override
  void dispose() {
    super.dispose();
//    AppData.updateCharacter(myChar);
//    myChar = null;
  }


  @override
  Widget build(BuildContext context) {
    if(myChar==null || myChar.sessionId!=AppData.currentSession.sessionId) {
      getCharacter(widget.myCharID).then((c){
          setState(() {
            myChar = c;
          });
    });
      return Material(child: Center(child: Text('Loading Character...'),));
    }

    return new Scaffold(
        //new scaffold
          resizeToAvoidBottomPadding: false,
          floatingActionButton:FloatingActionButton(
            child: (!editing)? Icon(Icons.edit) : Icon(Icons.done),
            onPressed: (){
              toggleEdit();
            },
          ),
          body: new ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(10.0),
              children: <Widget>[
                RichText(text: TextSpan(
                    style: TextStyle(
                        color: myChar.charClass.color,
                        fontSize: 23.0
                    ),
                    text: '${myChar.title}\n',
                    children: <TextSpan>[
                      TextSpan(
                        text: '     ${myChar.charRace.name}   - ',
                        style: TextStyle(color: Colors.white70,fontSize: 13.0),
                      ),
                      TextSpan(
                        text: '  ${myChar.charClass.name}',
                        style: traitsTitleStyle,
                      )
                    ]
                )),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    RacePreview(
                      race: myChar.charRace,
                    ),
                    Container(
                      height: 60.0,
                      child: ClassIcon(
                        classType: myChar.charClass,
                      ),
                    ),
//                    Container(
//                      height: 20.0,
//                      child: GenderIcon.str(myChar.charGender),
//                    ),
                    new HpIcon(
                      diameter: 80.0,
                      currentHp: myChar.currentHp,
                      maxHp: myChar.maxHp,
                    ),
                    new Column(
                      children: <Widget>[
//                  new Text(lightChar.gender),

//                  Text("Lvl: ${level = calcLevel(lightChar.xp)}"),
                        LevelWidget(myChar.xp),
                        Text("P: ${calcProf(calcLevel(myChar.xp))}")
//                  new Text((lightChar.sessionId == null)
//                      ? "No Session"
//                      : lightChar.sessionId), //our text widget with our description
                      ],
                    )
                  ],
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: new Divider(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                Row(
                  children: <Widget>[
                    new Text(
                      'SpellSlots: ',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Expanded(child: Container()),
                    IconButton(icon: Icon((!SpellSlots.resetMode)? Icons.refresh : Icons.done,color: Colors.deepOrange,) ,
                      onPressed: (){
                        setState(() {
                          SpellSlots.resetMode=!SpellSlots.resetMode;
                        });
                    }),
                  ],
                ),

                ///SpellSlots
                SpellSlots( spellSlots: getSpellSlotsForCharacter(myChar),),

                new Padding(
                  padding: new EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: new Divider(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                new Text(
                  'Stats: ',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                new Container(
                  height: AppData.screenHeight / 4,
                  child: new Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          flex: 1,
                          child: new Column(
                            children: <Widget>[
                              ///main stats
                              new Expanded(
                                child: Stat.Int(
                                  value: myChar.intelligence,
                                  hasButtons: editing,
                                  update: (int i){myChar.intelligence=i; shouldUpdate=true;},
                                ),
                              ),
                              new Expanded(
                                child: Stat.Str(
                                  value: myChar.strength,
                                  hasButtons: editing,
                                  update: (int s){myChar.strength=s; shouldUpdate=true;},
                                ),
                              ),
                              new Expanded(
                                child: Stat.Dex(
                                  value: myChar.dexterity,
                                  hasButtons: editing,
                                  update: (int d){myChar.dexterity=d; shouldUpdate=true;},
                                ),
                              ),
                            ],
                          ),
                        ),
                        new Expanded(
                          flex: 1,
                          child: new Column(
                            children: <Widget>[
                              ///main stats
                              new Expanded(
                                child: Stat.Wis(
                                  value: myChar.wisdom,
                                  hasButtons: editing,
                                  update: (int w){myChar.wisdom=w; shouldUpdate=true;},
                                ),
                              ),
                              new Expanded(
                                child: Stat.Chr(
                                  value: myChar.charisma,
                                  hasButtons: editing,
                                  update: (int ch){myChar.charisma=ch; shouldUpdate=true;}
                                ),
                              ),
                              new Expanded(
                                child: Stat.Con(
                                  value: myChar.constitution,
                                  hasButtons: editing,
                                  update: (int co){myChar.constitution=co; shouldUpdate=true;},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: new Divider(
                    color: Theme.of(context).accentColor,
                  ),
                ),
//                Shield.list(equipmentList: myChar.equipment),
                Container(
                  width: AppData.screenWidth,
//                  height: AppData.screenHeight / 4,
                  child: EquipmentList.add(
                    char: myChar,
                    height: AppData.screenHeight / 4,
                    shield: true
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: new Divider(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                LoreView(
                  background: myChar.background,
                  personality: myChar.personality,
                  ideals: myChar.ideals,
                  bonds: myChar.bonds,
                  flaws: myChar.flaws,
                  featAndTraits: myChar.featuresTraits,
                )
              ])
      );
    }
}


//class MonsterSelector extends StatefulWidget {
//  @override
//  _MonsterSelectorState createState() => _MonsterSelectorState();
//}
//
//class _MonsterSelectorState extends State<MonsterSelector> {
//  @override
//  Widget build(BuildContext context) {
//    return ListView.builder(
//      itemBuilder: (BuildContext context, int index){
//        return
//      },
//    );
//  }
//}



class SpellSlots extends StatelessWidget {

  final List<SpellSlot> slots = new List();

  static List<int> usedSpells = [0,0,0,0,0,0,0,0,0];

  static void useSpell(int slot)
  {
    usedSpells[slot-1]++;
  }

  SpellSlots({@required List<int> spellSlots})
  {
    if(usedSpells.isEmpty) usedSpells = [0,0,0,0,0,0,0,0,0];
    for(int i = 0; i < 9;i++) slots.add(SpellSlot(i+1, (spellSlots.length>i)? spellSlots[i]: 0));
  }


  static bool resetMode = false;

  static toggleReset()
  {
    resetMode = !resetMode;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(bottom: 10.0),
          child: (!SpellSlots.resetMode)?Text('Slots per Level') : Text('Tap to Reset'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: slots,
          )
        ],
      ),
    );
  }

  static void resetSlot(int slot) {
    SpellSlots.usedSpells[slot-1] = 0;
  }
}


class SpellSlot extends StatefulWidget {

  final int slot;
  final int capacity;

  SpellSlot(this.slot,this.capacity);

  @override
  _SpellSlotState createState() => _SpellSlotState();

}

class _SpellSlotState extends State<SpellSlot> {


//  int usedSpells = 0;

//  _SpellSlotState(){if(widget.alreadyUsedSpells[widget.slot-1]!=null) usedSpells=widget.alreadyUsedSpells[widget.slot-1];}


  @override
  Widget build(BuildContext context) {
    return InkWell(
      //disable button when all spells used
      onTap: (){

        if(!SpellSlots.resetMode && SpellSlots.usedSpells[widget.slot-1]==widget.capacity) return null;

        setState(() {
          if(SpellSlots.resetMode)
            SpellSlots.resetSlot(widget.slot);
          else
            SpellSlots.useSpell(widget.slot);
        });
      },
      splashColor: Colors.transparent,
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: CircularPercentIndicator(
                radius: 30.0,
                lineWidth: 3.0,
                percent: SpellSlots.usedSpells[widget.slot-1]/widget.capacity,
                center: Text('${widget.capacity-SpellSlots.usedSpells[widget.slot-1]}',style: (SpellSlots.usedSpells[widget.slot-1]!=widget.capacity)? TextStyle(color: Colors.red,fontWeight: FontWeight.bold) : null,),
                backgroundColor: Colors.grey,
                progressColor: Colors.deepOrange,
                animation: true,
                animationDuration: 1000,
              ),
            ),
            Text('${widget.slot}'),
          ],
        ),
      ),
    );
  }
}





class PartyView extends StatefulWidget {

  final List<PlayerFrame> playerCharacters;


  PartyView() : playerCharacters = new List();
//  PartyView.list(List<PlayerFrame> list): playerCharacters = list;

  @override
  _PartyViewState createState() => _PartyViewState();
}

class _PartyViewState extends State<PartyView> {

//  int lastUpdate = DateTime.now().millisecondsSinceEpoch;
//
//  @override
//  void didUpdateWidget(PartyView oldWidget) {
//    // TODO: implement didUpdateWidget
//    super.didUpdateWidget(oldWidget);
//    widget.playerCharacters.clear();
//  }

  @override
  Widget build(BuildContext context) {

//    if(DateTime.now().millisecondsSinceEpoch - lastUpdate > 10000) {
//      lastUpdate = DateTime.now().millisecondsSinceEpoch;
//      GameScreen.getCharacters = true;
//    }

//    if(widget.playerCharacters==null || widget.playerCharacters.isEmpty){
//
//      AppData.currentSession.charactersInSession.forEach((c)=>widget.playerCharacters.add(PlayerFrame(char: c,)));
//
//      if(widget.playerCharacters.length==0)
//        return Container(child: null,);
//    }


    if(AppData.currentSession.charactersInSession.isEmpty)
      return Container();

    return Container(
      child: ListView.builder(
        itemCount: AppData.currentSession.charactersInSession.length,
        itemBuilder: (BuildContext context, int index){
            return PlayerFrame(char: AppData.currentSession.charactersInSession[index]);
        }
      ),
    );

//    return Column(
//      children: widget.playerCharacters,
//    );
  }
}

///A CharacterLightView widget wrapped in a tap detector.
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
      child: InkWell(
          onTap: (){
            Navigator.of(context).push(new MaterialPageRoute<int>(
                builder: (BuildContext context) {
                  //build a new widget
                  return new CharacterDetailsView.load(lightChar: character,editable: true,deletable: false,);
                }
            )).then((val) {
              //1 = edited, 0 = nothing changed
              if(val==1) CharacterSelectionState.updateCharacters(CharacterSelectionState.currentState);
            });
          },
          child: CharacterLightView(lightChar: character,titleStyle: null,)),
    );
  }
}

class MonstersTab extends StatefulWidget {

  static List<Monster> monstersInSession;
  final List<MonsterListItem> markedForReclaim = new List();

  MonstersTab(){
    if(monstersInSession==null) monstersInSession = new List();
  }
  MonstersTab.list(List<Monster> list){
    monstersInSession = new List();
    monstersInSession.addAll(list);
  }



  @override
  _MonstersTabState createState() => new _MonstersTabState();
}
class _MonstersTabState extends State<MonstersTab> {

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
    MonstersTab.monstersInSession.addAll(
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
//      int index = monsters.indexOf(mli);
//      widget.monstersInSession.removeAt(index);
      MonstersTab.monstersInSession.remove(mli.monster);
    });

    reclaimList.clear();

    print('=========================>  XP: $total   <=======================');



    setState(() {
      print('=========================>  XP: $total   <=======================');
    });


    ///@todo: Get that yummy xp to the server vaults!
    AppData.distributeXP(total,AppData.currentSession.sessionId).whenComplete((){
//      AppData.setUpdatedFlag();
//      int xp = AppData.currentSession.charactersInSession.length;
//      xp = total~/xp;
//      AppData.currentSession.charactersInSession.forEach((c){
//        c.xp+=xp;
//      });
      if(this.mounted)
      setState(() {
        print('=========================>  XP: $total   <=======================');
      });
    });

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
                  itemCount: MonstersTab.monstersInSession.length,
                  itemBuilder: (BuildContext context, int index){
                    monsters.add(MonsterListItem((){markForXpReclaim(index);},monster: MonstersTab.monstersInSession[index],));
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
                  child: Center(child: Text('XP'),),
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

  @override
  void dispose() {
    super.dispose();
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

  Future<List<Monster>> getJournalMonsters() async{



  }

  @override
  Widget build(BuildContext context) {
    if(!capturingNewMonster){

      return Column(
        children: <Widget>[
          FlatButton(
            onPressed: (){
//          add new monster dialog or w/e
            setState(() {
              capturingNewMonster = true;
            });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Add Custom Monster'),
                  Icon(Icons.add_circle_outline)
                ],
            ),
          ),
//          FlatButton(
//            onPressed: (){
//              //open journal to select monsters
//              getJournalMonsters();
//            },
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: [
//                  Text('Add Monster From Journal'),
//                  Icon(Icons.view_list)
//              ],
//            ),
//          ),
        ],
      );
    }

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

class LoreView extends StatelessWidget {

  final String background;
  final String personality;
  final String ideals;
  final String bonds;
  final String flaws;
  final String featAndTraits;

  LoreView({this.background,this.personality,this.ideals,this.bonds,this.flaws,this.featAndTraits});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Text(
          'Lore: ',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        new Text(
          'Background: ',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,),
        ),
        new Text(background,
          textAlign: TextAlign.center,
        ),
        new Text(
          'Personality: ',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,),
        ),
        new Text(personality,
          textAlign: TextAlign.center,
        ),
        new Text(
          'Ideals: ',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,),
        ),
        new Text(ideals,
          textAlign: TextAlign.center,
        ),
        new Text(
          'Bonds: ',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,),
        ),
        new Text(bonds,
          textAlign: TextAlign.center,
        ),
        new Text(
          'Flaws: ',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,),
        ),
        new Text(flaws,
          textAlign: TextAlign.center,
        ),
        new Text(
          'Features and Traits: ',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,),
        ),
        new Text(featAndTraits,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class HpIcon extends StatefulWidget {

  final int currentHp;
  final int maxHp;
  final double diameter;
  final bool interactable;

  HpIcon({this.currentHp=50,this.maxHp=100,this.diameter,this.interactable=true});
//  HpIcon({this.diameter});

  @override
  _HpIconState createState() => _HpIconState();
}

class _HpIconState extends State<HpIcon> {

  int currentHp;
  int maxHp;

  @override
  void initState() {
    super.initState();
    currentHp = widget.currentHp;
    maxHp = widget.maxHp;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
//      decoration: BoxDecoration(border: Border.all(width: 2.0)),
      height: widget.diameter,
      width: widget.diameter,
      child: InkWell(
        onTap: (!widget.interactable)? null : (){
          //hp edit
            showDialog<bool>(
            context: context,
            barrierDismissible: false,
            builder: (context){

              return new SimpleDialog(
                  title: Text('Adjust Hp',style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold),),
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Center(child: Text('Current:   /     Max:')),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: TextField(
                                    controller: TextEditingController(text: '$currentHp'),
                                    keyboardType: TextInputType.numberWithOptions(signed: true,decimal: false),
                                    onSubmitted: (String val){
                                      int newHp = int.tryParse(val);
                                      if(newHp!=null && newHp<=maxHp && newHp!=currentHp) {
                                        currentHp=newHp;
                                      }
                                    } ,
                                  ),
                                ),
                                Container(width: 30.0,child: Center(child: Text('/'))),
                                Expanded(
                                  child: TextField(
                                    controller: TextEditingController(text: '$maxHp'),
                                    keyboardType: TextInputType.numberWithOptions(signed: true,decimal: false),
                                    onSubmitted: (String val){
                                      int newHp = int.tryParse(val);
                                      if(newHp!=null && newHp>=currentHp && newHp!=maxHp) {
                                        maxHp=newHp;
                                      }
                                    } ,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          FlatButton(
                            child: Container(
                              child: Text('Adjust'),
                            ),
                            onPressed: (){
                              Navigator.pop(context,(widget.currentHp!=currentHp || widget.maxHp!=maxHp));
                            },
                          )
                        ],
                      ),
                    )
                  ]
              );
            }
          ).then((var shouldUpdate){
            if(shouldUpdate==null)
              return;
            if(shouldUpdate){
              _PlayerSelfViewState.myChar.currentHp = currentHp;
              _PlayerSelfViewState.myChar.maxHp = maxHp;
              AppData.updateCharacter(_PlayerSelfViewState.myChar);
            }
          });
        },
        child: Stack(
          children: <Widget>[
            Container(
              child: Image.asset('assets/icon_assets/heart.png',color: Colors.red,)
            ),
            Center(
//            top: 30.0,
//            left: 18.0,
//              child: Text('${widget.currentHp} / ${widget.maxHp}')
              child: Text('$currentHp / $maxHp')
            )
          ],
        ),
      ),
    );
  }
}

