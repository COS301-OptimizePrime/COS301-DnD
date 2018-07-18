import 'dart:async';
import 'dart:io';

import 'package:dnd_301_final/app_data.dart';
import 'package:dnd_301_final/menu.dart';
import 'package:dnd_301_final/in_session.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'backend/server.pb.dart';
import 'backend/server.pbgrpc.dart';

class GameSessionDemo extends StatefulWidget {
  static String tag = "game-session";

  final Session session;

  GameSessionDemo(this.session) {
  }
  @override
  GameSessionState createState() => new GameSessionState(this.session);

}

class GameSessionState extends State<GameSessionDemo> {

  static List<String> _items = <String>[];

//  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();
  final Session session;
  Session responseSession;


  static bool stopped = false;

  GameSessionState(this.session) {
    responseSession = this.session;
    _items = <String>[];
    stopped = false;
    _update();
  }

  @override
  void dispose() {
    super.dispose();
    stopped = true;
  }

  _update() async {
    while(stopped == false) {
      GetSessionRequest gsr = new GetSessionRequest();
      gsr.sessionId = this.session.sessionId;
      gsr.authIdToken = AppData.token;

      final response = await AppData.stub.getSessionById(gsr);
      print('Status: ${response.status}');
      print('Status Message: ${response.statusMessage}');
      print('Number of users: ${response.users}');
      responseSession = response;
      _items = <String>[];

      for (User user in responseSession.users) {
        print(user.name);
        _items.add(user.name);
      }

      if (stopped == false) {
        setState((){
         // _items = _items;
        });
        sleep(new Duration(seconds: 1));
      } else {
        break;
      }
    }
  }

  Future<Null> _handleRefresh() async{
    GetSessionRequest gsr = new GetSessionRequest();
    gsr.sessionId = this.session.sessionId;
    gsr.authIdToken = AppData.token;

    final response = await AppData.stub.getSessionById(gsr);
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
                    child: new Text("Welcome to: ${this.responseSession.name} with ID: ${this.responseSession.sessionId}!",style: new TextStyle(fontSize: 20.0,color: Colors.deepOrange),),
                  ),
                ),),
                new Container (child: new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Container(
                    child: new Text("The dungeon master for this session is: ${this.session.dungeonMaster.name}!",style: new TextStyle(fontSize: 15.0,color: Colors.white),),
                  ),
                ),),
                new Container (child: new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Container(
                    child: new Text("Maximum users possible in this session: ${this.responseSession.maxPlayers}\n Current users in this session:",style: new TextStyle(fontSize: 15.0,color: Colors.deepOrange),),
                  ),
                ),),
                new ListView.builder(
                    shrinkWrap: true,
                    padding: kMaterialListPadding,
                    itemCount: _items.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == _items.length) {
                        return new Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: new Material(
                              borderRadius: new BorderRadius.circular(30.0),
                              elevation: 5.0,
                              child: new MaterialButton(
                                minWidth: 200.0,
                                height: 42.0,
                                onPressed: () {
                                  if (this.session.dungeonMaster.name ==
                                      appData.user.email) {
                                    // TODO: Start session for all players
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => InSession(this.responseSession.name, true)),
                                    );
                                  }
                                  else {
                                    // TODO: Indicate ready to play on DM screen and wait for session
//                                    while (waitForSession());

                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => InSession(this.responseSession.name, false)),
                                    );
                                  }
                                },
                                color: Colors.deepOrange,
                                child: (this.session.dungeonMaster.name ==
                                    appData.user.email)
                                  ? new Text(
                                    "Start Session",
                                    style: new TextStyle(color: Colors.white))
                                  : new Text("Ready Up",
                                    style: new TextStyle(color: Colors.white)),
                              ),
                            )
                        );
                      }
                      final String item = _items[index];
                      return new ListTile(
                        leading: new CircleAvatar(
                          backgroundImage: new AssetImage('assets/placeholder.jpg'),
                        ),
                        title: new Text('$item'),
                        subtitle: const Text(
                            ''),
                      );
                    }),
              ],
             )
            ),
          ),
        ),
      );
  }
}
