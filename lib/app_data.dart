import 'dart:async';

import 'package:dnd_301_final/character_selection.dart';
import 'package:dnd_301_final/races_and_classes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import "package:grpc/grpc.dart";

import 'backend/server.pb.dart';
import 'backend/server.pbgrpc.dart';

class AppData{

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  FirebaseUser user = null;
  GoogleSignInAccount googleUser = null;
  GoogleUserCircleAvatar user_google_image = null;

  static String token = "anon";

  // This should change we should not have a global session as there can be multiple
  static Session temp_session;
  // This should change we should not have a global session as there can be multiple
  static String sessionId;
  static List<Session> activeSessions;
  static ClientChannel channel;
  static SessionsManagerClient stub;

  ///characters
  static CharactersManagerClient charStub;
  static int charsLoaded;

  static double screenWidth;
  static double screenHeight;

  static AppData _singleton;

  AppData() {
    //this class contains data to be passed around the app
    //DO NOT instantiate new AppData classes with 'new'
    //use AppData.instance()
  }

  static AppData instance()
  {
    if(_singleton == null)
      _singleton = new AppData();

    return _singleton;
  }

  Future signinWithGoogle() async
  {
    googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    user = await auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    token = await user.getIdToken();
    assert(token != null);


    final FirebaseUser currentUser = await auth.currentUser();
    assert(user.uid == currentUser.uid);

    user_google_image = new GoogleUserCircleAvatar(identity: googleUser,placeholderPhotoUrl: googleUser.photoUrl);
  }

  Future<bool> signInWithEmailAndPass(String email, String pass) async{
    bool status = true;
    try{
      user = await (auth.signInWithEmailAndPassword(email: email, password: pass));
      token = await user.getIdToken();
    }
    catch(PlatformException) {
      status = false;
    }

    return status;
  }

  Future registerNewEmalAndPassUser(String email, String pass) async
  {
    user = await auth.createUserWithEmailAndPassword(email: email, password: pass);
    assert(user!=null);
    print(user.toString());
  }

  static Future<LeaveReply> leaveSessions(String sid) async
  {
    if(channel==null)
      connectToServer();

    LeaveRequest jr = new LeaveRequest();
    jr.sessionId = sid;
    jr.authIdToken = token;

    final response = await stub.leave(jr);
    print('Status: ${response.status}');
    print('Status Message: ${response.statusMessage}');

    return response;
  }

  Future signout()
  async {
    auth.signOut();
    if(googleUser!=null)
      {
        googleSignIn.signOut();
        googleUser = null;
        user_google_image=null;
      }
    user = null;
    characters.clear();
    charsLoaded = null;
  }

  static void connectToServer()
  {
    channel = new ClientChannel('develop.optimizeprime.co.za', port: 50051,
        options: const ChannelOptions(
            credentials: const ChannelCredentials.insecure()));

  }
  static Future<Session> createSession(String name, int maxPlayers)
  async {

        if(channel==null)
          connectToServer();

        if(stub==null)
          stub = new SessionsManagerClient(channel);

        NewSessionRequest nsr = new NewSessionRequest();
    nsr.name = name;
    nsr.authIdToken = token;
    nsr.maxPlayers = maxPlayers;
    final response = await stub.create(nsr);
    print('Client received: ${response.status}');


    temp_session = response;
    sessionId = response.sessionId;
    return response;
  }

  static Future<Session> joinSession(String sid) async
  {
    if(channel==null)
      connectToServer();

    if(stub==null)
      stub = new SessionsManagerClient(channel);

    JoinRequest jr = new JoinRequest();
    jr.sessionId = sid;
    jr.authIdToken = token;

    final response = await stub.join(jr);
    print('Status: ${response.status}');
    print('Status Message: ${response.statusMessage}');

    return response;
  }

  static Future getUserSessions()
  async {
    if(channel==null)
      connectToServer();

    if(stub==null)
      stub = new SessionsManagerClient(channel);

    GetSessionsOfUserRequest gsur = new GetSessionsOfUserRequest();
    gsur.limit = 10;
    gsur.authIdToken = token;

    final response = await stub.getSessionsOfUser(gsur);
    activeSessions = response.sessions;
    print('Status: ${response.status}');
    print('Status Message: ${response.status}');

    return response;
  }

  static Future updateUserCharacters()
  async
  {
    if(channel==null)
      connectToServer();

    if(charStub==null)
      charStub = new CharactersManagerClient(channel);

    if(charsLoaded==null)
      return getUseCharacters();

    GetCharactersRequest gcr = new GetCharactersRequest();
    gcr.authIdToken = token;

    final chars = await charStub.getCharacters(gcr);

    print('adding ${chars.characters.length - charsLoaded} characters');

    for (int i = charsLoaded; i>=0 && i < chars.characters.length;i++)
    {
      characters.add(
          convertToLocalChar(chars.characters.elementAt(i))
      );
      charsLoaded++;
    }

    print('characters added');
  }


  static Future getUseCharacters()
  async
  {
    if(channel==null)
      connectToServer();

    if(charStub==null)
      charStub = new CharactersManagerClient(channel);

    print('retrieving characters');

    GetCharactersRequest gcr = new GetCharactersRequest();
    gcr.authIdToken = token;

    final chars = await charStub.getCharacters(gcr);

    charsLoaded = chars.characters.length;
    print('adding ${chars.characters.length} characters');

    for (int i = 0; i < chars.characters.length;i++)
      {
        characters.add(
          convertToLocalChar(chars.characters.elementAt(i))
        );
      }

      print('characters added');
  }

  static addNewCharacter(LocalCharacter char)
  async
  {
    if(channel==null)
      connectToServer();

    if(charStub==null)
      charStub = new CharactersManagerClient(channel);

    NewCharacterRequest ncr = new NewCharacterRequest();
    ncr.authIdToken = token;
    ncr.character = convertToNetChar(char);

    print('adding character: ${ncr.character.name}');

     final response = await charStub.createCharacter(ncr);

     print('added character: ${response.characterId}');
  }



  static LocalCharacter convertToLocalChar(Character netChar) {
    return new LocalCharacter(
      title: netChar.name,
      charClass: ClassType.getClass(netChar.characterClass),
      charRace:  Race.getRace(netChar.race),
      charGender: 'unimplemented',
      strength: netChar.strength,
      dexterity: netChar.dexterity,
      charisma: netChar.charisma,
      wisdom: netChar.wisdom,
      intelligence: netChar.intelligence,
      constitution: netChar.constitution,
      background: netChar.background,
      personality: netChar.personalityTraits,
      ideals: netChar.ideals,
      bonds: netChar.bonds,
      flaws: netChar.flaws,
      featuresTraits: 'unimplemented',
    );
  }

  static Character convertToNetChar(LocalCharacter char) {
    Character temp = new Character();
    temp.name = char.title;
    temp.characterClass = char.charClass.name;
    temp.race = char.charRace.name;
//    temp.gender
    temp.strength = char.strength;
    temp.dexterity = char.dexterity;
    temp.charisma = char.charisma;
    temp.wisdom = char.wisdom;
    temp.intelligence = char.intelligence;
    temp.constitution = char.constitution;
    temp.background = char.background;
    temp.personalityTraits = char.personality;
    temp.ideals = char.ideals;
    temp.bonds = char.bonds;
    temp.flaws = char.flaws;
//    temp.features

    return temp;
  }

}
