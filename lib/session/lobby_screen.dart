import 'dart:async';

import 'package:dnd_301_final/app_data.dart';
import 'package:dnd_301_final/backend/server.pb.dart';
import 'package:dnd_301_final/backend/server.pbgrpc.dart';
import 'package:dnd_301_final/character/character_creation.dart';
import 'package:dnd_301_final/character/character_selection.dart';
import 'package:dnd_301_final/menu.dart';
import 'package:dnd_301_final/session/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GameSession extends StatefulWidget {
  static String tag = "game-session";

  static LightSession session;
  static GameSessionState gs;

  GameSession(Session s) {
    AppData.currentSession = s;
  }

  @override
  GameSessionState createState() => (gs = new GameSessionState());
}

class GameSessionState extends State<GameSession>{

  static List<String> _items = <String>[];
  static List<PlayerLobbyListTile> _players = <PlayerLobbyListTile>[];

//  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();
  static Timer timer;

  static bool stopped = false;
  static bool busy = false;

  static bool allPlayersReady = false;
  bool iAmGameMaster;

  static ReadyCountdown countdown;

  String lastStatus;
  String lastState;
  int lastUsers;
  int lastReadyUsers;
  var hasCharacterInSession;

  String myCharID;


  GameSessionState() {
    GameSession.session = null;
    _items = <String>[];
    stopped = false;
    iAmGameMaster = (AppData.currentSession.dungeonMaster.uid == AppData.user.uid);
    print('I am Dungeon master: $iAmGameMaster');
    if(iAmGameMaster)
      timer = new Timer.periodic(const Duration(seconds: AppData.pollRate), (Timer t) => _update());
    else
      {
        checkForCharacterInSession().then((bool b){if(this.mounted)setState(() {
          //update view to reflect finish
          hasCharacterInSession = b;
          print('hasCharacterInSession: $hasCharacterInSession');
          timer = new Timer.periodic(const Duration(seconds: AppData.pollRate), (Timer t) => _update());
        });});
      }
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    GameSession.session = null;
  }

  Future _update() async {

    if(busy) return;
    busy = true;

    if(AppData.currentSession==null){
      print('AppData current session is null!');
      return;
    }

    LightSession response = await AppData.getLightSessionById(AppData.currentSession.sessionId);
    if(timer==null)
      {
        busy = false;
        return;
      }

    if(response==null)
      {
        print('response is null');
        busy = false;
        return;
      }

    bool needToUpdateView = false;

    if(GameSession.session == null)
      needToUpdateView = true;

   if(response.state=='EXPLORING'){
     print('Session state changed to exploring');
      GameSessionState.timer.cancel();
      Navigator.of(context).pop();
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> (iAmGameMaster)?  new GameScreen.isDM() : new GameScreen.isPlayer(charID: myCharID)));

     if(!iAmGameMaster)
       {
         timer.cancel();
         busy = false;
       }

     return;
   }

   else if(!iAmGameMaster && response.state =="READYUP")
     {
       needToUpdateView=true;
     }

    //check if session has changed - and pull full object if necessary
    if(AppData.currentSession.lastUpdated != response.lastUpdated)
      {

        //important - full session server call
        AppData.currentSession =  await AppData.getSessionById(AppData.currentSession.sessionId);
        needToUpdateView=true;

        if(lastStatus == null || lastStatus!=response.status)
        {
          lastStatus = response.status;
          print('Status: ${response.status}');
          if(response.status=="FAILED") print('Status Message: ${response.statusMessage}');
        }

        if(lastState==null || lastState != response.state)
          {
            lastState = response.state;
            print('State: ${response.state}');
          }

        if(lastUsers==null || lastUsers != AppData.currentSession.users.length)
          {
            lastUsers = AppData.currentSession.users.length;
            print('Number of users: $lastUsers');
          }

        if(lastReadyUsers==null || lastReadyUsers!=AppData.currentSession.readyUsers.length)
          {
            lastReadyUsers = AppData.currentSession.readyUsers.length;
            print('Number of ready users: $lastReadyUsers');
          }

      }


    GameSession.session = response;

    for (User user in AppData.currentSession.users) {
//      print(user.name);
      PlayerLobbyListTile pt = _players.firstWhere((p)=>p.pUser.uid==user.uid,orElse: (){return null;});
      User u = (pt!=null)? pt.pUser: null;
      if(u==null)
        {
          _players.add(new PlayerLobbyListTile.player(pUser: user));
          needToUpdateView=true;
        }
      else if(u.readyInThisSession!=user.readyInThisSession)
        {
          u = user;
//          pt = new PlayerLobbyListTIle.player(pUser: user);
          pt.build(context);
          needToUpdateView=true;
        }


      print('${user.name} : ${user.readyInThisSession}');
    }

    busy = false;

    try {
      if(needToUpdateView)
      setState(() {
        // _items = _items;
        print('updating view');
      });
    }
    catch(Exception) {print('setState called on null');}

  }


  Future<Null> _handleRefresh() async{
    GetSessionRequest gsr = new GetSessionRequest();
    gsr.sessionId = AppData.currentSession.sessionId;
    gsr.authIdToken = AppData.token;

    final response = await AppData.sessionStub.getSessionById(gsr);
    print('Status: ${response.status}');
    print('Status Message: ${response.statusMessage}');
    _items = <String>[];

    for (User user in response.users) {
      print(user.name);
      _items.add(user.name);
    }
    setState((){
      _items = _items;
    });

    AppData.currentSession = response;

    return null;
  }


  void characterSelected(int index) {

    //@todo: remember to re-enable
    //performs server calls to add the selected character to this session
    AppData.addCharacterToCurrentSession(AppData.lightCharacters[index].characterId);
    //local update - not strictly necessary
    AppData.lightCharacters[index].sessionId = AppData.currentSession.sessionId;

    print('added character ${AppData.lightCharacters[index].name} to game');
    myCharID = AppData.lightCharacters[index].characterId;
    //update view
    setState(() {
      hasCharacterInSession=true;
    });

    timer = new Timer.periodic(const Duration(seconds: AppData.pollRate), (Timer t) => _update());
  }


  @override
  Widget build(BuildContext context) {

    Widget bodyWidget;

    if(GameSession.session==null)
      return Material(
        child: new Center(
            child: Text('Loading...'),
          ),
      );
    else if(!iAmGameMaster && hasCharacterInSession!=true)
      {
        if(hasCharacterInSession==null)
        {
          bodyWidget = Center(
            child: Text('Looking for Character...'),
          );
        }
        else if(hasCharacterInSession==false)
        {
          bodyWidget = Column(
            children: <Widget>[
              Text('Please select or create a character to play:'),

              //display available characters
              Expanded(child: SelectCharacterMaster(characterSelected)),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: FlatButton(onPressed: (){
                    print('opening character creation');

                    timer.cancel();
                    Navigator.push(context, new MaterialPageRoute(builder: (context)=>CreateCharacterDialog())).then(
                            (b){if(b==true)setState(() {
                          //update new character
                          print('Created new char: $b');
                          timer = new Timer.periodic(const Duration(seconds: AppData.pollRate), (Timer t) => _update());
                        });}
                    );

                  }, child: Container(child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Add a new Character'),
                      Icon(Icons.add,color: Colors.deepOrange,),
                    ],))),
                ),
              )
            ],
          );
        }
      }
    else
      {
        bodyWidget =  new ListView.builder(
            shrinkWrap: true,
            padding: kMaterialListPadding,
            itemCount: _players.length+1,
            itemBuilder: (BuildContext context, int index) {

              if (index == _players.length) {
                return new Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Center(
                      child: (iAmGameMaster)? StartGameButton() : ReadyUpButton(),
                    )
                );
              }
              return _players[index];
            });

      }

    return new Scaffold(
      drawer: new Menu(),
      appBar: new AppBar( //AppBars are the bars on top of the view
        title: const Text('Current Session Page'),
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
                              new QrImage(data: GameSession.session.sessionId, size: 250.0,)
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
            AppData.leaveSessions(GameSession.session.sessionId);
            Navigator.pop(context);
              }
          ),
        ],
      ),
      body: new RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,

        child: new Center(
            child:
        new Container(
            child: new Column(
              children: <Widget>[
                new Container (child: new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Container(
                    child: new Text("Welcome to: ${GameSession.session.name}",style: new TextStyle(fontSize: 20.0,color: Colors.deepOrange),),
                  ),
                ),),
                new Container (child: new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Container(
                    child: new Text("Dungeon Master: ${AppData.currentSession.dungeonMaster.name}!",style: new TextStyle(fontSize: 15.0,color: Colors.white),),
                  ),
                ),),
                new Container (child: new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Container(
                    child: new Text("Party Size: ${AppData.currentSession.users.length}/${AppData.currentSession.maxPlayers}",style: new TextStyle(fontSize: 15.0,color: Colors.deepOrange),),
                  ),
                ),),new Container (child: new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: (countdown!=null)? (countdown) : Container(),
                ),),
                Expanded(child: bodyWidget),
              ],
             )
            ),
          ),
        ),
      );
  }


  void startCountdown(int time) {
    this.setState(
        (){
          countdown=ReadyCountdown(readyUpExpiryTime: time,);
        }
    );
  }

  Future<bool> checkForCharacterInSession() async{

    if(AppData.currentSession.charactersInSession.isEmpty)
      AppData.currentSession.charactersInSession.addAll(await AppData.getGameCharacters(AppData.currentSession.sessionId));

    for(int i = 0; i < AppData.currentSession.charactersInSession.length;i++)
    {
      if(AppData.currentSession.charactersInSession[i].creatorId==AppData.user.uid)
        return true;
    }

//    await AppData.getUserCharacters();

    return false;
  }
}

class PlayerLobbyListTile extends StatelessWidget {

  const PlayerLobbyListTile({
    Key key,
    @required this.name,
  }) : pUser = null, super(key: key);

  const PlayerLobbyListTile.player({
    Key key,
    @required this.pUser,
  }) : name = null, super(key: key);

  final String name;
  final User pUser;

  @override
  Widget build(BuildContext context) {
    if(name!=null)
    return new ListTile(
      leading: new CircleAvatar(
        backgroundImage: new AssetImage('assets/placeholder.jpg'),
      ),
      title: new Text('$name'),
      subtitle: const Text(
          ''),
    );

    else
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: new SizedBox(
          width: AppData.screenWidth/1.3,
          height: AppData.screenHeight/20,
          child: Container(
            color: (pUser.readyInThisSession)? Colors.lightBlueAccent : Colors.transparent,
            child: Row(
              children: <Widget>[
                new CircleAvatar(
                  backgroundImage: new AssetImage('assets/placeholder.jpg'),
                ),
                Expanded(child: Container(),),
                
                new Text('${pUser.name}'),
                
                Expanded(child: Container(),),
                
//                Container(child: AnimatedIcon(icon: AnimatedIcons.ellipsis_search, progress: ),),
                Container(child: (pUser.readyInThisSession)? Icon(Icons.check,size: 25.0,color: Colors.green,) : Icon(Icons.clear,size: 25.0,color: Colors.red,),),
              ],
            ),
          ),
        ),
      );
  }
}

class ReadyUpButton extends StatefulWidget {

  ReadyUpButton();

  @override
  Color get color => Colors.deepOrange;

  @override
  _ReadyUpButtonState createState() => _ReadyUpButtonState();
}

class _ReadyUpButtonState extends State<ReadyUpButton> {

  bool busy = false;

  @override
  Widget build(BuildContext context) {

    if(AppData.currentSession.state!='READYUP')
    return new Text('Waiting on Game Master');

    return MaterialButton(onPressed: (){
      if(!busy)
        {
          busy = true;
          AppData.readyToggle(AppData.currentSession.sessionId).whenComplete((){busy = false;});
        }
    },
      child: Container(
        child: new Text("Ready Up",
            style: new TextStyle(color: Colors.white)),
      ),
    );

  }
}

class StartGameButton extends StatefulWidget {

  StartGameButton();

  @override
  _StartGameButtonState createState() => _StartGameButtonState();
}

class _StartGameButtonState extends State<StartGameButton> {

  String text = "Start Game";

  @override
  Widget build(BuildContext context) {

    return MaterialButton(onPressed: (){

      if(GameSessionState.countdown!=null){
        GameSessionState.countdown=null;
        AppData.setSessionState("PAUSED", AppData.currentSession.sessionId);
        text = "Start Game";
      }
        else
          {
            GameSession.gs.startCountdown(AppData.currentSession.readyUpExpiryTime);
            AppData.setSessionState('READYUP',AppData.currentSession.sessionId);
            text = "Cancel Ready Up";
          }

    },
      child: Container(
        child: new Text(text,
            style: new TextStyle(color: Colors.white)),
      ),
    );

  }

}

class ReadyCountdown extends StatefulWidget {

  ReadyCountdown({this.readyUpExpiryTime});

  final int readyUpExpiryTime;

  @override
  _ReadyCountdownState createState() => _ReadyCountdownState();
}

class _ReadyCountdownState extends State<ReadyCountdown>{

  int seconds;
  static Timer timer;

  @override void initState() {
    super.initState();
    seconds = widget.readyUpExpiryTime;
    timer = new Timer.periodic(Duration(seconds: 1),(Timer t) => tick(t));
  }

  tick(Timer t) {
    setState(() {
      if(seconds>0)
        seconds-=1;
      else
        {
          t.cancel();
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    child: new Text(
        '$seconds',
        style: Theme.of(context).textTheme.display2,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
}


class SelectCharacterMaster extends StatefulWidget {

  final List<SelectCharacterWidget> items;
  int last;
  final Function confirmSelection;

  SelectCharacterMaster(Function f) : items = new List() , confirmSelection = f;

  tapped(int index)
  {
    //last has no value initially
    if(last!=null && last!=index)
      items[last].scws.unSelect();

    if(last==index)
    {
      confirmSelection(index);
      return;
    }

    items[index].scws.pressed();
    last = index;

  }

  @override
  _SelectCharacterMasterState createState() => _SelectCharacterMasterState();
}

class _SelectCharacterMasterState extends State<SelectCharacterMaster> {


  @override
  void initState() {
    super.initState();
    if(AppData.lightCharacters.isEmpty)
      AppData.getUserCharacters().whenComplete((){
        if(this.mounted)
          setState(() {
            //update list
            print('updating char list');
          });
      });
  }

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: AppData.lightCharacters.length,
      itemBuilder: (BuildContext context, int index) {
        print('${AppData.lightCharacters[index].name} : ${AppData.lightCharacters[index].sessionId}');
        if (AppData.lightCharacters[index].sessionId == null || AppData.lightCharacters[index].sessionId == "") {
          widget.items.add(
              SelectCharacterWidget(AppData.lightCharacters[index]));
          return FlatButton(
            onPressed: () {
              widget.tapped(index);
            },
            child: widget.items.last,
          );
        }
        else {
          widget.items.add(null);
        }

        return Container(child: null,);
      },
    );

  }

}

class SelectCharacterWidget extends StatefulWidget {

  final _SelectCharacterWidgetState scws;
  final LightCharacter character;
  final CharacterLightView clv;

  SelectCharacterWidget(LightCharacter char,) : character = char, clv = CharacterLightView(titleStyle: null,lightChar: char) ,scws = new _SelectCharacterWidgetState(character: char);

  @override
  _SelectCharacterWidgetState createState() => scws;
}

class _SelectCharacterWidgetState extends State<SelectCharacterWidget> {

  _SelectCharacterWidgetState({this.character});

  bool confirmSelect = false;
  LightCharacter character;

   pressed() {
    print('tapped ${character.name}');
    if (confirmSelect) {
      //select character
      print('selected ${character.name} (${character.characterId})');
    } else {
      setState(() {
        confirmSelect = true;
      });
    }
  }

  void unSelect() {
    setState(() {
      confirmSelect = false;
    });
  }


  @override
  Widget build(BuildContext context) {

//    if(confirmSelect)
//      return Container(
//        height: 100.0,
//        width: AppData.screenWidth/1.5,
//        color: Colors.green,
//        child: Text('Select ${character.name}?'),
//      );



    return Container(
      padding: (confirmSelect)? EdgeInsets.symmetric(horizontal: 8.0) : null,
      decoration: (confirmSelect)? BoxDecoration(
        color: Colors.black12 ,
        border: Border.all(width: 3.0,style: BorderStyle.solid,color: Colors.deepOrange),
      ) : null,

      child: CharacterLightView(
          lightChar: widget.character,
          titleStyle: Theme.of(context).textTheme.headline.copyWith(color: Colors.white)),
      );
  }


}

