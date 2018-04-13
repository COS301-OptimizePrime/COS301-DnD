import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class AppData{

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  GoogleSignInAccount googleUser = null;
  Image user_google_image;

  static AppData _singleton;

  AppData() {
    //this class contains data to be passed around the app
  }

  static AppData instance()
  {
    if(_singleton == null)
      _singleton = new AppData();

    return _singleton;
  }

}
