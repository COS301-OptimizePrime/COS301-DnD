import 'dart:async';
import 'package:dnd_301_final/monster_journal.dart';
import 'package:flutter/material.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  Future<String> _testSignInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;
    final FirebaseUser user = await _auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);


    Navigator.pop(context); //pop dialog
    Navigator.of(context).pushNamed(MonsterJournal.tag);

    print("This user is signed in: $user");
    return 'signInWithGoogle succeeded: $user';
  }

  Future <LoginPage> _signOut()  async{
    await FirebaseAuth.instance.signOut();
    _googleSignIn.signOut();
    return new LoginPage();
  }

  //firebase signin
//  final googleSignIn = new GoogleSignIn();
//
//  Future<Null> _ensureLoggedIn() async {
//    GoogleSignInAccount user = googleSignIn.currentUser;
//    if (user == null)
//      user = await googleSignIn.signInSilently();
//    if (user == null) {
//      await googleSignIn.signIn();
//    }
//  }

  @override
  Widget build(BuildContext context) {
    final logo = new Hero(
      tag: 'hero',
      child: new CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 60.0,
        child: new Image.asset('assets/dadlogo2.png'),
      ),
    );

    final email = new TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
//      initialValue: 'pepe69',
      style: new TextStyle(color: Colors.white),
      decoration: new InputDecoration(
        fillColor: Colors.white,
        hintText: 'Username',
        contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: new OutlineInputBorder( borderRadius: new BorderRadius.circular(32.0),), ),
    );

    final password = new TextFormField(
      autofocus: false,
//      initialValue: 'some password',
      obscureText: true,
      style: new TextStyle(color: Colors.white),
      decoration: new InputDecoration(
        hintText: 'Password',
        fillColor: Colors.white,
        contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: new OutlineInputBorder(borderRadius: new BorderRadius.circular(32.0)),
      ),
    );

    final loginDialog = new Dialog(child: new SizedBox(
      width: 100.0,
      height: 100.0,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        new CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
        new Text("Logging you in..."), ],  ))
    );

    final loginButton = new Padding(
      padding: new EdgeInsets.symmetric(vertical: 16.0),
      child: new Material(
        borderRadius: new BorderRadius.circular(30.0),
        elevation: 5.0,
        child: new MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            showDialog(
                context: context,
                barrierDismissible: false,
                child: loginDialog,
            );

            new Future.delayed(new Duration(seconds: 3), () {
              Navigator.pop(context); //pop dialog
              Navigator.of(context).pushNamed(MonsterJournal.tag);

            });

          },
          color: Colors.deepOrange,
          child: new Text('Enter World!', style: new TextStyle(color: Colors.white)),
        ),
      ),
    );

    final signUpButton = new Padding(
      padding: new EdgeInsets.symmetric(vertical: 16.0),
      child: new Material(
        borderRadius: new BorderRadius.circular(30.0),
        elevation: 5.0,
        child: new MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {},
          color: Colors.deepOrange,
          child: new Text('Register', style: new TextStyle(color: Colors.white)),
        ),
      ),
    );

    final googleButton = new Padding(
      padding: new EdgeInsets.symmetric(vertical: 16.0),
      child: new Material(
        borderRadius: new BorderRadius.circular(30.0),
        elevation: 5.0,
        child: new MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              child: loginDialog,
            );

            _testSignInWithGoogle();


//            new Future.delayed(new Duration(seconds: 3), () {
//              Navigator.pop(context); //pop dialog
//              Navigator.of(context).pushNamed(MonsterJournal.tag);

//            });
          },
          color: Colors.deepOrange,
          child: new Text('Google Sign In!', style: new TextStyle(color: Colors.white)),
        ),
      ),
    );


    return new Scaffold(
      body: new Center(
        child: new ListView(
          controller: new ScrollController(),
          shrinkWrap: true,
          padding: new EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            new SizedBox(height: 48.0),
            email,
            new SizedBox(height: 8.0),
            password,
            new SizedBox(height: 24.0),
            loginButton,
            signUpButton,
            googleButton
          ],
        ),
      ),
    );
  }
}
