import 'package:flutter/material.dart';

// The screen that players see when session is initiated
// Dungeon Master and normal players see different screens
class InSession extends StatefulWidget {
  static String tag = 'in-session';
  final String sessionName;
  final bool isDM;

  InSession(this.sessionName, this.isDM);

  @override
  InSessionState createState() =>
      new InSessionState(this.sessionName, this.isDM);
}

class InSessionState extends State<InSession> {
  final String sessionName;
  final bool isDM;

  InSessionState(this.sessionName, this.isDM);

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: (isDM) ? 4 : 3,
        child: Scaffold(
          appBar: new AppBar(
            title: Text(this.sessionName),
            actions: <Widget>[
              (isDM) ? Image.asset('assets/icon_assets/dm_icon.png') : Text("")
            ],
            bottom: TabBar(
                // tabs differ for DM and NP
                tabs: (isDM)
                    ? <Widget>[
                        // DM tabs
                        Tab(text: "Placeholder1"),
                        Tab(text: "Placeholder2"),
                        Tab(text: "Placeholder3"),
                        Tab(text: "Placeholder4"),
                      ]
                    : <Widget>[
                        // NP tabs
                        Tab(text: "Placeholder1"),
                        Tab(text: "Placeholder2"),
                        Tab(text: "Placeholder3"),
                      ]),
          ),
          body: new TabBarView(
              children: (isDM) ? [
                Container(),
                Container(),
                Container(),
                Container(),
              ]
              : [ // NP tabs
                Container(),
                Container(),
                Container(),
              ]
          ),
        ));
  }
}
