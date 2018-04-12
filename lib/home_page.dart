import 'package:flutter/material.dart';
import 'package:dnd_301_final/menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    final alucard = new Hero(
      tag: 'hero',
      child: new Padding(
        padding: new EdgeInsets.all(16.0),
        child: new CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: new AssetImage('assets/alucard.jpg'),
        ),
      ),
    );

    final welcome = new Padding(
      padding: new EdgeInsets.all(8.0),
      child: new Text(
        'Welcome Alucard',
        style: new TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final lorem = new Padding(
      padding: new EdgeInsets.all(8.0),
      child: new Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit condimentum mauris id tempor. Praesent eu commodo lacus. Praesent eget mi sed libero eleifend tempor. Sed at fringilla ipsum. Duis malesuada feugiat urna vitae convallis. Aliquam eu libero arcu.',
        style: new TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final body = new Container(
      width: MediaQuery.of(context).size.width,
      padding: new EdgeInsets.all(28.0),
      decoration: new BoxDecoration(
        gradient: new LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: new Column(
        children: <Widget>[alucard, welcome, lorem],
      ),
    );

    return new MaterialApp(
        title: 'DnD 301 Use Case Demo',
        theme: new ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.grey,
            accentColor: Colors.deepOrange
        ),
        home: new Scaffold(
          body: body,
          drawer: new Menu(),
          appBar: new AppBar( //AppBars are the bars on top of the view
              title: const Text('Hoome Page'),
              actions: <Widget>[
                new Padding(
                  padding: new EdgeInsets.symmetric(vertical: 16.0),
                  child: new Material(
                    borderRadius: new BorderRadius.circular(30.0),
                    elevation: 5.0,
                    child: new MaterialButton(
                      minWidth: 200.0,
                      height: 42.0,
                      onPressed: () async {
                        GoogleSignIn _googleSignIn = new GoogleSignIn();
                        FirebaseAuth.instance.signOut();
                        await _googleSignIn.signOut();
                        Navigator.pop(context);
                      },
                      color: Colors.deepOrange,
                      child: new Text('Sign Out!', style: new TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ]
          )
        )
    );
  }
}
