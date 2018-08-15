import 'dart:async';

import 'package:dnd_301_final/app_data.dart';
import 'package:dnd_301_final/backend/server.pb.dart';
import 'package:dnd_301_final/backend/server.pbgrpc.dart';
import 'package:dnd_301_final/menu.dart';
import 'package:dnd_301_final/session/in_session.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GameSession extends StatefulWidget {
  static String tag = "game-session";

//  final LightSession lightSession;
  final Session session;

  GameSession(this.session) {
//    session = AppData.getSessionById(lightSession.sessionId);
  }
  @override
  GameSessionState createState() => new GameSessionState(this.session);


  static int currentReadyUsers(Session session) {
    int readyUsers = 0;
    session.users.forEach((User u) => (){if(u.readyInThisSession)readyUsers+=1;});
    return readyUsers;
  }

}

class GameSessionState extends State<GameSession> {

  static List<String> _items = <String>[];
  static List<User> _players = <User>[];

//  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();
  final Session session;
  Session responseSession;
  static Timer timer;


  static bool stopped = false;
  static bool busy = false;

  GameSessionState(this.session) {
    responseSession = this.session;
    _items = <String>[];
//    _players = List<User>();
    stopped = false;
    timer = new Timer.periodic(const Duration(seconds: 1), (Timer t) => _update());
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  void _update() async {

    if(busy) return;
    busy = true;

    GetSessionRequest gsr = new GetSessionRequest();
    gsr.sessionId = this.session.sessionId;
    gsr.authIdToken = AppData.token;

    var response;

    if(AppData.sessionStub!=null)
      response = await AppData.sessionStub.getSessionById(gsr);

    print('Status: ${response.status}');
    print('Status Message: ${response.statusMessage}');
    print('Number of users: ${response.users}');
    print('Number of ready users: ${response.users}');
    responseSession = response;
//    _items.clear();
    bool needToUpdateView = false;

    for (User user in responseSession.users) {
      print(user.name);
      User u = _players.firstWhere((p)=>p.uid==user.uid,orElse: (){return null;});
      if(u!=null)
//      _items.add(user.name);
        {
          _players.add(user);
          needToUpdateView=true;
        }
      else if(u.readyInThisSession!=user.readyInThisSession)
        {
          u = user;
          needToUpdateView=true;
        }
    }

    try {
//      if(needToUpdateView)
      setState(() {
        // _items = _items;
      });
    }
    catch(Exception) {print('setState called on null');}
//        sleep(new Duration(seconds: 1));
    busy = false;
  }


  Future<Null> _handleRefresh() async{
    GetSessionRequest gsr = new GetSessionRequest();
    gsr.sessionId = this.session.sessionId;
    gsr.authIdToken = AppData.token;

    final response = await AppData.sessionStub.getSessionById(gsr);
    print('Status: ${response.status}');
    print('Status Message: ${response.statusMessage}');
    responseSession = response;
    _items = <String>[];

    for (User user in responseSession.users) {
      print(user.name);
      _items.add(user.name);
    }
    setState((){
      _items = _items;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    AppData appData = AppData.instance();

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
                              new QrImage(data: this.responseSession.sessionId, size: 250.0,)
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
            AppData.leaveSessions(this.responseSession.sessionId);
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
                    child: new Text("Welcome to: ${this.responseSession.name}",style: new TextStyle(fontSize: 20.0,color: Colors.deepOrange),),
                  ),
                ),),
                new Container (child: new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Container(
                    child: new Text("Dungeon Master: ${this.session.dungeonMaster.name}!",style: new TextStyle(fontSize: 15.0,color: Colors.white),),
                  ),
                ),),
                new Container (child: new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Container(
                    child: new Text("Party Size: ${this.responseSession.users.length}/${this.responseSession.maxPlayers}",style: new TextStyle(fontSize: 15.0,color: Colors.deepOrange),),
                  ),
                ),),new Container (child: new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ReadyCountdown(session: session,),
                ),),
                new ListView.builder(
                    shrinkWrap: true,
                    padding: kMaterialListPadding,
//                    itemCount: _items.length + 1,
                    itemCount: _players.length+1,
                    itemBuilder: (BuildContext context, int index) {
//                      if (index == _items.length) {
                      if (index == _players.length) {
                        return new Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: (this.session.dungeonMaster.uid == AppData.user.uid)? StartGameButton(session: session,) : ReadyUpButton(session: session,)
                        );
                      }
//                      final String item = _items[index];
//                      return new PlayerLobbyListTIle(item: item);
                    return new PlayerLobbyListTIle.player(pUser: _players[index]);
                    }),
              ],
             )
            ),
          ),
        ),
      );
  }
}

class PlayerLobbyListTIle extends StatelessWidget {

  const PlayerLobbyListTIle({
    Key key,
    @required this.name,
  }) : super(key: key);

  const PlayerLobbyListTIle.player({
    Key key,
    @required this.pUser,
  }) : super(key: key);

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
      return new SizedBox(
        width: AppData.screenWidth/1.10,
        height: AppData.screenHeight/20,
        child: Container(
          color: (pUser.readyInThisSession)? Colors.redAccent : Colors.transparent,
          child: Row(
            children: <Widget>[
              new CircleAvatar(
                backgroundImage: new AssetImage('assets/placeholder.jpg'),
              ),
              new Text('$name'),
            ],
          ),
        ),
      );
  }
}

class ReadyUpButton extends StatefulWidget {

  ReadyUpButton({@required this.session});

  final Session session;

  @override
  Color get color => Colors.deepOrange;

  @override
  _ReadyUpButtonState createState() => _ReadyUpButtonState();
}

class _ReadyUpButtonState extends State<ReadyUpButton> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GameSessionState.timer.cancel();
        Navigator.of(context).pop();
        Navigator.push(context, new MaterialPageRoute(builder: (context)=>InSession(widget.session,false)));
      },
      child: Container(
        child: new Text("Ready Up",
            style: new TextStyle(color: Colors.white)),
      ),
    );
  }
}

class StartGameButton extends StatefulWidget {

  StartGameButton({this.session});

  final Session session;

  @override
  _StartGameButtonState createState() => _StartGameButtonState();
}

class _StartGameButtonState extends State<StartGameButton> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GameSessionState.timer.cancel();
        Navigator.of(context).pop();
        Navigator.push(context, new MaterialPageRoute(builder: (context)=>InSession(widget.session,true)));
      },
      child: Container(
        child: new Text("Start Game",
            style: new TextStyle(color: Colors.white)),
      ),
    );
  }

}
//
//class CircleClipper extends CustomClipper<Rect>
//{
//
//  double percent;
//
//  CircleClipper({this.percent});
//
//  @override
//  Rect getClip(Size size) {
//      final height = size.height/10;
//      final  width = size.width/4;
//
////      return Rect
//  }
//
//  @override
//  bool shouldReclip(CustomClipper<Rect> oldClipper) {

//    return true;
//  }
//
//}

class ReadyCountdown extends StatefulWidget {

  ReadyCountdown({this.session});

  final Session session;

  @override
  _ReadyCountdownState createState() => _ReadyCountdownState();
}

class _ReadyCountdownState extends State<ReadyCountdown>{

  int seconds;
  static Timer timer;

  @override void initState() {
    super.initState();
    seconds = widget.session.readyUpExpiryTime;
    timer = new Timer.periodic(Duration(seconds: 1),(Timer t) => tick(t));
  }

  tick(Timer t) {
    setState(() {
      if(seconds>0)
        seconds-=1;
      else
        {
          ///@TODO: implement countdown finished!
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

