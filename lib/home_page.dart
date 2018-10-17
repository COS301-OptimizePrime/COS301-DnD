import 'package:dnd_301_final/app_data.dart';
import 'package:dnd_301_final/menu.dart';
import 'package:dnd_301_final/plugins/qr_handler.dart';
import 'package:dnd_301_final/session/SessionViewList.dart';
import 'package:dnd_301_final/session/game_screen.dart';
import 'package:dnd_301_final/session/lobby_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_reader/qr_reader.dart';

import 'backend/server.pb.dart';
import 'backend/server.pbgrpc.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';
  final String flava_text = 'The many worlds of Dungeons & Dragons are places of magic and monsters, of brave warriors and spectacular adventures. '
      'They begin with a foundation of medieval fantasy and '
      'then add the creatures, places, and magic that make these worlds unique.';
  final SessionViewList svl = new SessionViewList();

  @override
  Widget build(BuildContext context) {

    AppData.screenWidth = MediaQuery.of(context).size.width;
    AppData.screenHeight = MediaQuery.of(context).size.height;
    if(svl!=null)
      svl.update();

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
            ).whenComplete((){
              svl.update();
            });

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
                        .setAutoFocusIntervalInMs(1000) // default 5000
                        .setForceAutoFocus(true) // default false
                        .setTorchEnabled(true) // default false
                        .setHandlePermissions(true) // default true
                        .setExecuteAfterPermissionGranted(true) // default true
                        .scan();

                    if(sid!=null)
                    {
                      showDialog(context: context,barrierDismissible: false, child: new QrReaderWaiter());

                      Session s = await AppData.joinSession(sid);


                      if (s.status != "SUCCESS") {
                        //snackBar.content = new Text(s.statusMessage);
                        Navigator.of(context).pop();
                        Scaffold.of(context).showSnackBar(
                            new SnackBar(duration: new Duration(seconds: 3) ,content: new Text(s.statusMessage)));
                      } else {
                        GameScreen.cleanUp();
                        if(s.firstStartedTime!='None'){
                          Navigator.pop(context);//remove spinner and QR code
                          //must select a character
                          showDialog<String>(
                              context: context,
                              barrierDismissible: false,
                              builder: (context){

                                return new SimpleDialog(
                                    title: Text('Pick a Characcter to join!',style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold),),
                                    children: <Widget>[
                                      Container(
                                        height: AppData.screenHeight/2,
                                        width: AppData.screenWidth/1.5,
                                        child: SelectCharacterMaster((int index){
                                          //performs server calls to add the selected character to this session
                                          AppData.addCharacterToCurrentSession(s.sessionId,AppData.lightCharacters[index].characterId);
                                          //local update - not strictly necessary
                                          AppData.lightCharacters[index].sessionId = AppData.currentSession.sessionId;

                                          print('added character ${AppData.lightCharacters[index].name} to ${s.name}');
                                          Navigator.pop(context,AppData.lightCharacters[index].characterId);
                                        }),
                                      )
                                    ]
                                );
                              }
                          ).then((String val){
                            if(val!=null){
                              Navigator.pop(context);
                              Navigator.push(context, new MaterialPageRoute(
                                builder: (BuildContext context) => new GameScreen.isPlayer(charID: val),
                              ));
                            }
                            else
                              Navigator.pop(context);
                          });
                        }
                        else{
                          Navigator.pop(context);
                          Navigator.push(context, new MaterialPageRoute(
                            builder: (BuildContext context) => new GameSession(s),
                          ));
                        }
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
          svl,
        ],
        //  )
      ),
    );

    return main_page;
  }
}
