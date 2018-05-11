import 'dart:async';
import 'dart:io';

import 'package:dnd_301_final/app_data.dart';
import 'package:dnd_301_final/menu.dart';
import 'package:flutter/material.dart';

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


  static bool stopped = false;

  GameSessionState(this.session) {
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

      _items = <String>[];

      for (User user in session.users) {
        print(user.name);
        _items.add(user.name);
      }

      if (stopped == false) {
        setState((){
          _items = _items;
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

    _items = <String>[];

    for (User user in session.users) {
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
    return new Scaffold(
      drawer: new Menu(),
      appBar: new AppBar( //AppBars are the bars on top of the view
        title: const Text('Current Session Page'),
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
                    child: new Text("Welcome to: ${this.session.name}!",style: new TextStyle(fontSize: 20.0,color: Colors.deepOrange),),
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
                    child: new Text("Current users in this session:",style: new TextStyle(fontSize: 15.0,color: Colors.deepOrange),),
                  ),
                ),),
                new ListView.builder(
                    shrinkWrap: true,
                    padding: kMaterialListPadding,
                    itemCount: _items.length,
                    itemBuilder: (BuildContext context, int index) {
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
