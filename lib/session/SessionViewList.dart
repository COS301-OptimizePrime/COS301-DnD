import 'package:dnd_301_final/app_data.dart';
import 'package:dnd_301_final/backend/server.pb.dart';
import 'package:dnd_301_final/session/game_screen.dart';
import 'package:dnd_301_final/session/lobby_screen.dart';
import 'package:flutter/material.dart';

class SessionViewList extends StatefulWidget {
  @override
  _SessionViewListState createState() => new _SessionViewListState();

  Function updateList;

  void update() {
    if(updateList!=null)
      updateList();
  }
}

class _SessionViewListState extends State<SessionViewList> {

  bool loadedSessions = false;
  bool valid = false;

  @override
  void initState() {

    widget.updateList = this.update;
    AppData.getUserSessions().whenComplete((){loadedSessions=true; if(AppData.activeSessions. length>0) valid = true; setState(() {
      //do the do
    });});

    super.initState();
  }


  void update()
  {
    int items = AppData.activeSessions.length;
    AppData.getUserSessions().whenComplete((){loadedSessions=true; if(items!=AppData.activeSessions.length) valid = true; setState(() {
      //update list
    });});
  }


  @override
  Widget build(BuildContext context) {

    if(loadedSessions && valid)
      return new Container(
        width: AppData.screenWidth/1.5,
        height: AppData.screenHeight/4,
        child: new ListView.builder(
            padding: kTabLabelPadding,
            itemCount: AppData.activeSessions.length,
//            itemExtent: AppData.screenHeight/4/4,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final item = AppData.activeSessions.elementAt(index);
              return new DecoratedBox(
                decoration: new BoxDecoration(border: new Border(bottom: new BorderSide(color: Colors.deepOrange))),
                child: new ListTile(
                  title: new Text('${item.name}'),
                  trailing: (item.dungeonMaster.uid==AppData.user.uid)? Text("DM",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),) : null,
                  onTap: () async {
                    Session fullSession = await AppData.getSessionById(AppData.activeSessions.elementAt(index).sessionId);
                    if(fullSession!=null && fullSession.firstStartedTime!='None')//go to game
                      {
                        AppData.currentSession = fullSession;
                        String id = fullSession.charactersInSession.firstWhere((c)=>c.creatorId==AppData.user.uid,orElse: (){print('no charId at SVL'); return null;})?.characterId;
                        Navigator.push(context, new MaterialPageRoute(
                          builder: (BuildContext context) => (item.dungeonMaster.uid==AppData.user.uid)? new GameScreen.isDM() : new GameScreen.isPlayer(charID: id),
                        )).whenComplete(update);
                      }
                    else//go to lobby
                      Navigator.push(context, new MaterialPageRoute(
                        builder: (BuildContext context) => new GameSession(fullSession),
                      )).whenComplete(update);
                  },
                ),
              );}),
      );
    else
    return new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            new Padding(
              padding: new EdgeInsets.only(bottom: 20.0),
              child: new DecoratedBox(
                  decoration: new BoxDecoration(border: new Border(bottom: new BorderSide(color: Colors.deepOrange))),
                  child: new Text("No Active Sessions:",style: new TextStyle(color: Colors.deepOrange,fontSize: 18.0,fontWeight: FontWeight.bold,))),
            ),
          ]);
    }
}
