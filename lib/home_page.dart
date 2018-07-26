import 'package:dnd_301_final/SessionViewList.dart';
import 'package:dnd_301_final/app_data.dart';
import 'package:dnd_301_final/menu.dart';
import 'package:dnd_301_final/qr_handler.dart';
import 'package:dnd_301_final/session_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_reader/qr_reader.dart';

import 'backend/server.pb.dart';
import 'backend/server.pbgrpc.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';
  final String flava_text = 'The many worlds of Dungeons & Dragons are places of magic and monsters, of brave warriors and spectacular adventures. '
      'They begin with a foundation of medieval fantasy and '
      'then add the creatures, places, and magic that make these worlds unique.';

  @override
  Widget build(BuildContext context) {

    AppData.screenWidth = MediaQuery.of(context).size.width;
    AppData.screenHeight = MediaQuery.of(context).size.height;
    AppData.getUserSessions();

    final create_button = new Padding(
      padding: new EdgeInsets.symmetric(vertical: 16.0),
      child: new Material(
        borderRadius: new BorderRadius.circular(30.0),
        elevation: 5.0,
        child: new MaterialButton(
//          minWidth: 300.0,
          minWidth: AppData.screenWidth/1.38,
          height: 42.0,
          onPressed: () async{
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => new QrMakerWidget(),
              //child:  new QrMakerWidget(),
            );

          },
          color: Colors.deepOrange,
          child: new Text('Create Game Session', style: new TextStyle(color: Colors.white)),
        ),
      ),
    );

    final join_button = new Padding(
        padding: new EdgeInsets.symmetric(vertical: 16.0),
        child:  new Builder(
          // Create an inner BuildContext so that the onPressed methods
          // can refer to the Scaffold with Scaffold.of().
            builder: (BuildContext context)
            {
              return new Material(
                borderRadius: new BorderRadius.circular(30.0),
                elevation: 5.0,
                child: new MaterialButton(
                  key: new Key("join_btn"),
//            minWidth: 300.0,
                  minWidth: AppData.screenWidth/1.38,
                  height: 42.0,
                  onPressed: () async {

                    String sid = await new QRCodeReader()
                        .setAutoFocusIntervalInMs(200) // default 5000
                        .setForceAutoFocus(true) // default false
                        .setTorchEnabled(true) // default false
                        .setHandlePermissions(true) // default true
                        .setExecuteAfterPermissionGranted(true) // default true
                        .scan();

                    if(sid!=null)
                    {
                      showDialog(context: context,barrierDismissible: false, child: new QrReaderWaiter());

                      Session s = await AppData.joinSession(sid);

                      if (s.status == "FAILED") {
                        //snackBar.content = new Text(s.statusMessage);
                        Navigator.of(context).pop();
                        Scaffold.of(context).showSnackBar(
                            new SnackBar(duration: new Duration(seconds: 3) ,content: new Text(s.statusMessage)));
                      } else {
                        Navigator.pop(context);
                        Navigator.push(context, new MaterialPageRoute(
                          builder: (BuildContext context) => new GameSessionDemo(s),
                        ));
                      }
                    }
                  },
                  color: Colors.deepOrange,
                  child: new Text(
                      'Join Game Session', style: new TextStyle(color: Colors.white)),
                ),
              );
            })
    );

    final List<String>_items = <String>['currently','active','sessions','appear','here'];

    final activeSessionsView = new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          new Padding(
            padding: new EdgeInsets.only(bottom: 20.0),
            child: new DecoratedBox(
                decoration: new BoxDecoration(border: new Border(bottom: new BorderSide(color: Colors.deepOrange))),
                child: new Text("Active Sessions:",style: new TextStyle(color: Colors.deepOrange,fontSize: 18.0,fontWeight: FontWeight.bold,))),
          ),
          new Container(
            width: AppData.screenWidth/1.5,
            height: AppData.screenHeight/4,
            child: new ListView.builder(
                padding: kTabLabelPadding,
                itemCount: _items.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final String item = _items[index];
                  return new DecoratedBox(
                    decoration: new BoxDecoration(border: new Border(bottom: new BorderSide(color: Colors.deepOrange))),
                    child: new ListTile(
                      title: new Text('$item.'),
                    ),
                  );}),
          )
        ]);

    final logo = new Hero(
      tag: 'loginLogo',
      child: new CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: AppData.screenWidth/4.25,
        child: new Image.asset('assets/dadlogo2.png'),
      ),
    );


    final main_page = new Scaffold(
      drawer: new Menu(),
      appBar: new AppBar( //AppBars are the bars on top of the view
        title: const Text('Home Page'),
      ),
      body: new ListView(//new Container(
        padding: const EdgeInsets.only(bottom: 20.0),
        children: <Widget>[
          new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              logo,
              new Transform(
                transform: new Matrix4.translationValues(0.0, -10.0, 0.0),
                child: new Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: new Container(child : new Text(flava_text,overflow: TextOverflow.ellipsis,maxLines: 7,textAlign: TextAlign.center,)),
                ),
              ),
            ],
          ),
          new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              join_button,
              create_button
            ],
          ),
          new SessionViewList(),
        ],
        //  )
      ),
    );

    return main_page;
  }
}
