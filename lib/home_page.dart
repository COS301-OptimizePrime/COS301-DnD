import 'package:dnd_301_final/app_data.dart';
import 'package:dnd_301_final/menu.dart';
import 'package:dnd_301_final/qr_handler.dart';
import 'package:flutter/material.dart';
import 'package:qr_reader/qr_reader.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';
  final String flava_text = 'The many worlds of Dungeons & Dragons are places of magic and monsters, of brave warriors and spectacular adventures. '
      'They begin with a foundation of medieval fantasy and '
      'then add the creatures, places, and magic that make these worlds unique.';

  @override
  Widget build(BuildContext context) {

    AppData.screenWidth = MediaQuery.of(context).size.width;
    AppData.screenHeight = MediaQuery.of(context).size.height;

    final create_button = new Padding(
      padding: new EdgeInsets.symmetric(vertical: 16.0),
      child: new Material(
        borderRadius: new BorderRadius.circular(30.0),
        elevation: 5.0,
        child: new MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {

            AppData.createSession();

            showDialog(
              context: context,
              barrierDismissible: false,
               child:  new QrMakerWidget(),
            );
          },
          color: Colors.deepOrange,
          child: new Text('Create Game Session', style: new TextStyle(color: Colors.white)),
        ),
      ),
    );

    final join_button = new Padding(
      padding: new EdgeInsets.symmetric(vertical: 16.0),
      child: new Material(
        borderRadius: new BorderRadius.circular(30.0),
        elevation: 5.0,
        child: new MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () async{
              String sid = await new QRCodeReader()
                  .setAutoFocusIntervalInMs(200) // default 5000
                  .setForceAutoFocus(true) // default false
                  .setTorchEnabled(true) // default false
                  .setHandlePermissions(true) // default true
                  .setExecuteAfterPermissionGranted(true) // default true
                  .scan();

              AppData.joinSession(sid);
          },
          color: Colors.deepOrange,
          child: new Text('Join Game Session', style: new TextStyle(color: Colors.white)),
        ),
      ),
    );

    final logo = new Hero(
      tag: 'loginLogo',
      child: new CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 60.0,
        child: new Image.asset('assets/dadlogo2.png'),
      ),
    );

    final main_page = new Scaffold(
      drawer: new Menu(),
      appBar: new AppBar( //AppBars are the bars on top of the view
        title: const Text('Home Page'),
      ),
      body: new Center(
        child: new ListView(
            controller: new ScrollController(),
            shrinkWrap: true,
            padding: new EdgeInsets.only(left: 24.0, right: 24.0,top: 50.0),
            children: <Widget>[
              logo,
              new SizedBox(height: 48.0),
              new Container(child : new Text(flava_text,overflow: TextOverflow.ellipsis,maxLines: 7,textAlign: TextAlign.center,)),
              new SizedBox(height: 70.0),
              join_button,
              new SizedBox(height: 8.0),
              create_button,
              new SizedBox(height: 24.0),
            ],
          ),
      ),
    );

    return main_page;
  }
}
