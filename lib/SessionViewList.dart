import 'package:dnd_301_final/app_data.dart';
import 'package:dnd_301_final/session_screen.dart';
import 'package:flutter/material.dart';

class SessionViewList extends StatefulWidget {
  @override
  _SessionViewListState createState() => new _SessionViewListState();
}

class _SessionViewListState extends State<SessionViewList> {

  bool loadedSessions = false;
  bool valid = false;

  @override
  void initState() {

    AppData.getUserSessions().whenComplete((){loadedSessions=true; if(AppData.activeSessions.length>0) valid = true; setState(() {
      //do the do
    });});

    super.initState();
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
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final String item = AppData.activeSessions.elementAt(index).name;
              return new DecoratedBox(
                decoration: new BoxDecoration(border: new Border(bottom: new BorderSide(color: Colors.deepOrange))),
                child: new ListTile(
                  title: new Text('$item.'),
                  onTap: (){
                    Navigator.push(context, new MaterialPageRoute(
                      builder: (BuildContext context) => new GameSessionDemo(AppData.activeSessions.elementAt(index)),
                    ));
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
