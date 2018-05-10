import 'package:flutter/material.dart';
import 'backend/server.pb.dart';
import 'backend/server.pbgrpc.dart';
import 'package:dnd_301_final/menu.dart';


class GameSessionDemo extends StatelessWidget {
  static String tag = "game-session";

  GameSessionDemo(this.session);
  final Session session;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new Menu(),
      appBar: new AppBar( //AppBars are the bars on top of the view
        title: const Text('Current Session Page'),
      ),
      body: new Center(
        child: new ListView(
          controller: new ScrollController(),
          shrinkWrap: true,
          padding: new EdgeInsets.only(left: 24.0, right: 24.0,top: 50.0),
          children: <Widget>[
            new SizedBox(height: 48.0),
            new Container(child : new Text("Welcome to ${this.session.name} session!",overflow: TextOverflow.ellipsis,maxLines: 7,textAlign: TextAlign.center,)),
            new Container(child : new Text("This session has: ${this.session.dungeonMaster.name} as the dungeon master!",overflow: TextOverflow.ellipsis,maxLines: 7,textAlign: TextAlign.center,)),
            new Container(child : new Text("Current players in this session: -${this.session.users}",overflow: TextOverflow.ellipsis,maxLines: 7,textAlign: TextAlign.center,)),
          ],
        ),
      ),
    );
  }
}
