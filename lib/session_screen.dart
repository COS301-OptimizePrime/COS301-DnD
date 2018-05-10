import 'package:flutter/material.dart';
import 'backend/server.pb.dart';
import 'backend/server.pbgrpc.dart';
import 'package:dnd_301_final/menu.dart';
import 'dart:async';
import 'dart:io';
import 'package:dnd_301_final/app_data.dart';

class GameSessionDemo extends StatefulWidget {
  static String tag = "game-session";

  final Session session;

  GameSessionDemo(this.session) {
    /*for (User user in session.users) {
      print(user.name);
      _items.add('User: ' + user.name);
    }*/
  }
  @override
  GameSessionState createState() => new GameSessionState(this.session);

}

class GameSessionState extends State<GameSessionDemo> {

  static List<String> _items = <String>[];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();
  final Session session;


  GameSessionState(this.session) {
    _items = <String>['Welcome to ${this.session.name}','Dungeon master: ${this.session.dungeonMaster.name}'];
    _update();
  }


  _update() async {
    while(true) {
      sleep(new Duration(seconds: 1));
      GetSessionRequest gsr = new GetSessionRequest();
      gsr.sessionId = this.session.sessionId;
      gsr.authIdToken = AppData.token;

      final response = await AppData.stub.getSessionById(gsr);
      print('Status: ${response.status}');
      print('Status Message: ${response.statusMessage}');

      _items = <String>['Welcome to ${this.session.name}','Dungeon master: ${this.session.dungeonMaster.name}'];

      for (User user in session.users) {
        print(user.name);
        _items.add('User: ' + user.name);
      }
      setState((){
        _items = _items;
      });
    }
  }

  Future<Null> _handleRefresh() async{
    GetSessionRequest gsr = new GetSessionRequest();
    gsr.sessionId = this.session.sessionId;
    gsr.authIdToken = AppData.token;

    final response = await AppData.stub.getSessionById(gsr);
    print('Status: ${response.status}');
    print('Status Message: ${response.statusMessage}');

    _items = <String>['Welcome to ${this.session.name}','Dungeon master: ${this.session.dungeonMaster.name}'];

    for (User user in session.users) {
      print(user.name);
      _items.add('User: ' + user.name);
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
            child: new ListView.builder(
                padding: kMaterialListPadding,
                itemCount: _items.length,
                itemBuilder: (BuildContext context, int index) {
                  final String item = _items[index];
                  return new ListTile(
                    isThreeLine: true,
                    title: new Text('$item.'),
                    subtitle: const Text(
                        'Even more additional list item information appears on line three.'),
                  );
                })
          ),
        ),
      );
  }
}
