import 'dart:async';
import 'package:dnd_301_final/home_page.dart';
import 'package:flutter/material.dart';
import 'package:dnd_301_final/app_data.dart';


class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  AppData appData = AppData.instance();

//  final FirebaseAuth _auth = FirebaseAuth.instance;
//  final GoogleSignIn _googleSignIn = new GoogleSignIn();
//  bool signedIn = false, googleSignedIn = false;
  String signin_login_message, enter_register_message;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _email;
  String _pass = '';
  String _confirmPass = '';
  bool signup = false, incorrectCredentials = false;


  Future _SignInWithGoogle() async {
//    appData.googleUser = await appData.googleSignIn.signIn();
//    final GoogleSignInAuthentication googleAuth =   await appData.googleUser.authentication;
//    final FirebaseUser user = await appData.auth.signInWithGoogle(
//      accessToken: googleAuth.accessToken,
//      idToken: googleAuth.idToken,
//    );
//    assert(user.email != null);
//    assert(user.displayName != null);
//    assert(!user.isAnonymous);
//    assert(await user.getIdToken() != null);
//
//    final FirebaseUser currentUser = await appData.auth.currentUser();
//    assert(user.uid == currentUser.uid);

    await appData.signinWithGoogle();

    Navigator.pop(context); //pop dialog
    Navigator.of(context).pushNamed(HomePage.tag);

//    googleSignedIn = true;
    //print('This user is signed in: '+ appData.user.toString());
  }

//  Future <LoginPage> _signOut()  async{
//    await FirebaseAuth.instance.signOut();
//    appData.googleSignIn.signOut();
//    return new LoginPage();
//  }

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

  Future _submit() async {
    final form = formKey.currentState;

    if(!signup)
    {
      if (form.validate()) {
        form.save();

        showDialog(
          context: context,
          barrierDismissible: false,
          child: loginDialog,
        );


        try{
          // Email & password matched our validation rules
          // and are saved to _email and _password fields.
          if(await appData.signInWithEmailAndPass(_email,_pass))
          {
            Navigator.pop(context); //pop dialog
            Navigator.of(context).pushNamed(HomePage.tag);
          }
          else
          {
            Navigator.pop(context); //pop dialog
            scaffoldKey.currentState.showSnackBar(
                new SnackBar(content: new Text("Incorrect Login Credentials!"))
            );
          }
        }
        catch(error)
        {

        }
      }
    }
    else
    {
      if(form.validate())
      {
        form.save();

        showDialog(
          context: context,
          barrierDismissible: false,
          child: loginDialog,
        );
        print(appData.auth.currentUser().toString());
        if(validatePasswords()){
          print("New User with Email: $_email and Pass: $_pass");

////          final FirebaseUser newUser = await appData.auth.createUserWithEmailAndPassword(email: _email, password: _pass);
//          assert(newUser!=null);
//          print(newUser.toString());

          await appData.registerNewEmalAndPassUser(_email,_pass);

          Navigator.pop(context); //pop dialog
          Navigator.of(context).pushNamed(HomePage.tag);
        }
        else
        {
          print('passwords do not match');
        }

      }
    }
  }

  bool validatePasswords()
  {
    return (_pass.compareTo(_confirmPass)==0);
  }

  void _signup()
  {
    setState(() {signup = !signup;});
  }


//  Future<bool> signInWithEmailAndPass() async{
//    bool status = true;
//    try{
//        await (appData.auth.signInWithEmailAndPassword(email: _email, password: _pass)
//          .catchError((){
//        status = false;
//      }));
//    }catch(PlatformException)
//    {
//      status = false;
//    }
//
//    return status;
//  }

  @override
  Widget build(BuildContext context) {

    if(signup==false) {
      signin_login_message = 'Register';
      enter_register_message = 'Enter World!';
    }
    else {
      signin_login_message = 'Login';
      enter_register_message = 'Register New Account';
    }
    final logo = new Hero(
      tag: 'loginLogo',
      child: new CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 60.0,
        child: new Image.asset('assets/dadlogo2.png'),
      ),
    );

    final email = new TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: "spongebob@cos123.com",
      validator: (val) => !val.contains('@') ? 'Not a valid email.' : null,
      onSaved: (val) => _email = val,
      style: new TextStyle(color: Colors.white),
      decoration: new InputDecoration(
        fillColor: Colors.white,
        hintText: 'Email',
        contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: new OutlineInputBorder( borderRadius: new BorderRadius.circular(32.0),), ),
    );

    final password = new TextFormField(
      autofocus: false,
      initialValue: 'qwerty',
      validator: (val) => val.length < 6 ? 'Password too short.' : null,
      onSaved: (val) => _pass = val,
      obscureText: true,
      style: new TextStyle(color: Colors.white),
      decoration: new InputDecoration(
        hintText: 'Password',

        fillColor: Colors.white,
        contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: new OutlineInputBorder(borderRadius: new BorderRadius.circular(32.0)),
      ),
    );

    final confirm_password = new TextFormField(
      autofocus: false,
      validator: (val) => val.compareTo(_pass)==0 ? 'Passwords do not match.' : null,
      onSaved: (val) => _confirmPass = val,
      obscureText: true,
      style: new TextStyle(color: Colors.white),
      decoration: new InputDecoration(
        hintText: 'Confirm Password',
        fillColor: Colors.white,
        contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: new OutlineInputBorder(borderRadius: new BorderRadius.circular(32.0)),
      ),
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
          _submit();
          },
          color: Colors.deepOrange,
          child: new Text(enter_register_message, style: new TextStyle(color: Colors.white)),
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
          onPressed:  _signup,
          color: Colors.deepOrange,
          child: new Text(signin_login_message, style: new TextStyle(color: Colors.white)),
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

            _SignInWithGoogle();

          },
          color: Colors.deepOrange,
          child: new Text('Google Sign In!', style: new TextStyle(color: Colors.white)),
        ),
      ),
    );

    final loginScaffold = new Scaffold(
      key: scaffoldKey,
      body: new Center(
        child: new Form(
          key: formKey,
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
              googleButton,
              signUpButton
            ],
          ),
        ),
      ),
    );

    final signupScaffold = new Scaffold(
      key: scaffoldKey,
      body: new Center(
        child: new Form(
          key: formKey,
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
              new SizedBox(height: 8.0),
              confirm_password,
              new SizedBox(height: 24.0),
              loginButton,
              signUpButton,
            ],
          ),
        ),
      ),
    );

    if(!signup)
      return loginScaffold;
    else
      return signupScaffold;
  }

  @override
  void dispose() {
    appData.signout();
    super.dispose();

//    if(signedIn)
//      appData.auth.signOut().then((val){print('Singed out successfully!');}).catchError((){print('error: could not sign out');});
//
//    if(googleSignedIn)
//      appData.googleSignIn.signOut();


  }
}
