import 'package:flutter/material.dart';
import 'package:dnd_301_final/menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';
  final String flava_text = 'The many worlds of Dungeons & Dragons are places of magic and monsters, of brave warriors and spectacular adventures. '
      'They begin with a foundation of medieval fantasy and '
      'then add the creatures, places, and magic that make these worlds unique.';

  @override
  Widget build(BuildContext context) {

    final create_button = new Padding(
      padding: new EdgeInsets.symmetric(vertical: 16.0),
      child: new Material(
        borderRadius: new BorderRadius.circular(30.0),
        elevation: 5.0,
        child: new MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            //@todo implement create game action
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
          onPressed: () {
            //@todo implement join game action
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
        actions: <Widget>[
          new Padding(
            padding: new EdgeInsets.symmetric(vertical: 16.0),
            child: new Material(
              borderRadius: new BorderRadius.circular(30.0),
              elevation: 5.0,
              child: new MaterialButton(
                minWidth: 100.0,
                height: 42.0,
                onPressed: () async {
                  GoogleSignIn _googleSignIn = new GoogleSignIn();
                  FirebaseAuth.instance.signOut();
                  await _googleSignIn.signOut();
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                color: Colors.deepOrange,
                child: new Text('Sign Out!', style: new TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
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
