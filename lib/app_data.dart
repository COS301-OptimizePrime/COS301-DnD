import 'dart:async';
import 'dart:io' show sleep;

import 'package:dnd_301_final/character/character_creation.dart';
import 'package:dnd_301_final/character/character_selection.dart';
import 'package:dnd_301_final/character/races_and_classes.dart';
import 'package:dnd_301_final/session/game_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import "package:grpc/grpc.dart";

import 'backend/server.pb.dart';
import 'backend/server.pbgrpc.dart';

class AppData{

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  static FirebaseUser user;
  GoogleSignInAccount googleUser;
  GoogleUserCircleAvatar userGoogleImage;

  static String token = "anon";
  static const int pollRate = 2;

  // The current active game session
  static Session currentSession;
//  static Timer refreshLogin;

  static List<LightSession> activeSessions;
  static ClientChannel channel;
  static SessionsManagerClient sessionStub;
  static bool readyInSession;

  ///characters
  static CharactersManagerClient charStub;
  static int charsLoaded;
  static final List<LightCharacter> lightCharacters = new List();

  static double screenWidth;
  static double screenHeight;

  static AppData _singleton;

  AppData() {
    //this class contains data to be passed around the app
    //DO NOT instantiate new AppData classes with 'new'
    //use AppData.instance() or call AppData.staticField

  }

  static AppData instance()
  {
    if(_singleton == null)
      _singleton = new AppData();

    return _singleton;
  }

  Future signInWithGoogle() async
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
//    if(refreshLogin == null)
//      refreshLogin = new Timer.periodic(const Duration(minutes: 1), (Timer t){
//        user.getIdToken(refresh: true).then((String newToken)=>token = newToken);
//      });

    userGoogleImage = new GoogleUserCircleAvatar(identity: googleUser,placeholderPhotoUrl: googleUser.photoUrl);
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

//    if(status)
//      if(refreshLogin == null)
//        refreshLogin = new Timer.periodic(const Duration(minutes: 1), (Timer t){
//          user.getIdToken(refresh: true).then((String newToken)=>token = newToken);
//        });

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

    final response = await sessionStub.leave(jr);
    print('Status: ${response.status}');
    print('Status Message: ${response.statusMessage}');

    activeSessions.removeAt(activeSessions.indexWhere((e)=>e.sessionId==sid));

    return response;
  }

  Future signout()
  async {
    auth.signOut();
    if(googleUser!=null)
      {
        googleSignIn.signOut();
        googleUser = null;
        userGoogleImage=null;
      }
    user = null;
//    characters.clear();
    charsLoaded = null;
    lightCharacters.clear();
    sessionStub = null;
    charStub = null;
    activeSessions = null;
    user = null;
    readyInSession = false;
    currentSession=null;
//    refreshLogin.cancel();
//    refreshLogin = null;

    GameScreen.cleanUp();
  }

  static void connectToServer()
  {
    channel = new ClientChannel('develop.optimizeprime.co.za', port: 50051,
        options: const ChannelOptions(
            credentials: const ChannelCredentials.insecure(),
        ));
  }

  static Future<Session> createSession(String name, int maxPlayers)
  async {

    if(channel==null)
      connectToServer();

    if(sessionStub==null)
      sessionStub = new SessionsManagerClient(channel);

    NewSessionRequest nsr = new NewSessionRequest();
    nsr.name = name;
    nsr.authIdToken = token;
    nsr.maxPlayers = maxPlayers;

    final response = await sessionStub.create(nsr);
    print('Client received: ${response.status}');

    currentSession = response;
    return response;
  }

  static Future<Session> joinSession(String sid) async
  {
    if(channel==null)
      connectToServer();

    if(sessionStub==null)
      sessionStub = new SessionsManagerClient(channel);

    JoinRequest jr = new JoinRequest();
    jr.sessionId = sid;
    jr.authIdToken = token;

    final response = await sessionStub.join(jr);
    print('Status: ${response.status}');
    print('Status Message: ${response.statusMessage}');

    return response;
  }

  static Future getUserSessions()
  async {
    if(channel==null)
      connectToServer();

    if(sessionStub==null)
      sessionStub = new SessionsManagerClient(channel);

    GetSessionsOfUserRequest gsur = new GetSessionsOfUserRequest();
    gsur.limit = 10;
    gsur.authIdToken = token;

    final response = await sessionStub.getSessionsOfUser(gsur).catchError((e){print(e.toString());});

    if(activeSessions==null || activeSessions.length!=response.lightSessions.length) {
      activeSessions = response.lightSessions;
      print('updating ActiveSessions list');
    }
    else print('not updating ActiveSessions list');

    print('   Status: ${response.status}');
    print('   Status Message: ${response.statusMessage}');

    return response;
  }

  static Future updateUserCharacters()
  async
  {
    if(channel==null)
      connectToServer();

    if(charStub==null)
      charStub = new CharactersManagerClient(channel);

//    if(charsLoaded==null)
//      return getUserCharacters();

    GetCharactersRequest gcr = new GetCharactersRequest();
    gcr.authIdToken = token;

    final chars = await charStub.getCharacters(gcr);

    print('adding ${chars.lightCharacters.length - charsLoaded} characters');

//    for (int i = charsLoaded; i>=0 && i < chars.characters.length;i++)

    lightCharacters.clear();
    lightCharacters.addAll(chars.lightCharacters);
//    for (int i = 0; i>=0 && i < chars.lightCharacters.length;i++)
//    {
////      characters.add(
////          convertToLocalChar(chars.lightCharacters.elementAt(i))
////      );
//      charsLoaded++;
//    }
    print('characters added');
  }

  static Future getUserCharacters()
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

//    charsLoaded = chars.characters.length;
    print('adding ${chars.lightCharacters.length} characters');

//    for (int i = 0; i < chars.characters.length;i++)
//      {
//        characters.add(
//          convertToLocalChar(chars.characters.elementAt(i))
//        );
//      }

    if(lightCharacters.isNotEmpty) lightCharacters.clear();
    lightCharacters.addAll(chars.lightCharacters);

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

   print('\tAdding character: ${response.status}');

   characters.add(char);

  }

  static LocalCharacter convertToLocalChar(Character netChar) {
    return new LocalCharacter(
      characterId: netChar.characterId,
      sessionId: netChar.sessionId,
      title: netChar.name,
      charClass: ClassType.getClass(netChar.characterClass),
      charRace:  Race.getRace(netChar.race),
      charGender: netChar.gender,
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
      featuresTraits: netChar.featuresAndTraits,
      equipment: convertToLocalEquip(netChar.equipment),
      xp: netChar.xp,
      currentHp: netChar.hitpoints.currentHitpoints,
      maxHp: netChar.hitpoints.maxHitpoints,
      armorValue: netChar.hitpoints.armorClass
    );
  }

  static List<LocalEquipment> convertToLocalEquip(List<Equipment> netList)
  {
    List<LocalEquipment> newList = new List();

    netList.forEach((item){
      List<String> splitName = item.name.split('日本');
      newList.add(LocalEquipment(splitName[0], splitName[1], item.value,isWep: splitName[2]=='y'));
    });

    return newList;
  }

  static convertToNetEquip(Character netChar ,List<LocalEquipment> localList)
  {
    int armorClass = 0;

    localList.forEach((item){
      var isWep = 'n';
      if(item.isWep)
        isWep='y';
      else
        armorClass+=item.val;

      Equipment temp = new Equipment();
      temp.name=item.name+'日本'+item.type+'日本'+isWep.toString();
      temp.value = item.val;
      netChar.equipment.add(temp);

    });

    netChar.hitpoints.armorClass = armorClass;
  }

  static Character convertToNetChar(LocalCharacter char) {
    Character temp = new Character();
    if (char.characterId!=null) temp.characterId = char.characterId;
    if(char.sessionId!=null) temp.sessionId = char.sessionId;
    temp.name = char.title;
    temp.characterClass = char.charClass.name;
    temp.race = char.charRace.name;
    temp.gender = char.charGender;
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
    temp.featuresAndTraits = char.featuresTraits;
//    temp.xp = char.xp;
    temp.hitpoints = new Hitpoints();
    temp.hitpoints.maxHitpoints = char.maxHp;
    temp.hitpoints.currentHitpoints = char.currentHp;
    temp.hitpoints.armorClass = char.armorValue;
    convertToNetEquip(temp ,char.equipment);

    return temp;
  }

  static Future deleteCharacter(String id) async{

    if(channel==null)
      connectToServer();

    if(charStub==null)
      charStub = new CharactersManagerClient(channel);

    DeleteCharacterRequest dcr = new DeleteCharacterRequest();
    dcr.characterId = id;
    dcr.authIdToken=token;

    print("deleting character $id");
    lightCharacters.removeWhere((c)=>c.characterId==id);
    characters.removeWhere((c)=>c.characterId==id);

    final response = await charStub.deleteCharacter(dcr);

    print('deleted character ${response.status}');
  }

  static void removeEquipment(LocalCharacter char, int index) async{
    if(channel==null)
      connectToServer();

    if(charStub==null)
      charStub = new CharactersManagerClient(channel);

    UpdateCharacterRequest ucr = new UpdateCharacterRequest();
    ucr.authIdToken = token;

    final netChar = convertToNetChar(char);

    ucr.character = netChar;

    print("deleting equipment: $index from character: ${char.characterId}");

    final response = await charStub.updateCharacter(ucr);

    print('deleted equipment: ${response.status}');
    print(response.statusMessage);
  }

  static Future updateCharacter(LocalCharacter localChar) async {

    if(channel==null)
      connectToServer();

    if(charStub==null)
      charStub = new CharactersManagerClient(channel);

    UpdateCharacterRequest ucr = new UpdateCharacterRequest();
    ucr.authIdToken = token;
    ucr.character = convertToNetChar(localChar);

    print("Updating charcter with id: ${localChar.characterId}");

    final response = await charStub.updateCharacter(ucr);

    print('Update: ${response.status}');
    print(response.statusMessage);

    return null;
  }

  static Future<Session> getSessionById(String id) async
  {
    if(channel==null)
      connectToServer();

    if(sessionStub==null)
      sessionStub = new SessionsManagerClient(channel);

    GetSessionRequest gsr = new GetSessionRequest();
    gsr.authIdToken = token;
    gsr.sessionId = id;

    final response = await (sessionStub.getSessionById(gsr));

    print('Retrieved session: \'${response.name}\' with id: ${response.sessionId}');

    if(response.status!="FAILED")
      return response;
    else
      return null;

  }

  static updateUserLightCharacters()
  async
  {
    if(channel==null)
      connectToServer();

    if(charStub==null)
      charStub = new CharactersManagerClient(channel);

//    if(charsLoaded==null)
//      return getUserCharacters();

    GetCharactersRequest gcr = new GetCharactersRequest();
    gcr.authIdToken = token;

    final chars = await charStub.getCharacters(gcr);

    int updatedChars = 0;
    int addedChars = 0;

    for(int i = 0; i < chars.lightCharacters.length;i++)
      {
        LightCharacter tempNet = chars.lightCharacters.elementAt(i);
        LightCharacter tempLoc = lightCharacters.firstWhere((c) => c.characterId==tempNet.characterId,orElse: (){return null;});

        if(tempLoc!=null)//match found - do not re-add
          continue;//@todo: implement checking for updates
//          if(tempnet.hasLastUpdated())
//            checkForChanges(tempLoc,tempNet);

        addedChars++;
        lightCharacters.add(tempNet);
      }

    print('Updating User Light Characters:\n');
    print('\tadding $addedChars characters\n');
    print('\tupdating $updatedChars characters\n');
  }

  static Future<LocalCharacter> getCharacterById(String id) async {
    if(channel==null)
      connectToServer();

    if(charStub==null)
      charStub = new CharactersManagerClient(channel);

    GetCharacterByIdRequest gcrId = new GetCharacterByIdRequest();
    gcrId.characterId = id;
    gcrId.authIdToken = token;

    final charResponse = await charStub.getCharacterById(gcrId);

    if(charResponse.status=='SUCCESS') {
      print("Fetched character <${charResponse.name}> with id [${charResponse.characterId}]");
      return convertToLocalChar(charResponse);
    }
     else {
      print("Failed to fetch character with id [$id]: ${charResponse.statusMessage}");
      return null;
    }
  }

  static Future readyToggle(String id) async{

    if(channel==null)
      connectToServer();

    if(sessionStub==null)
      sessionStub = new SessionsManagerClient(channel);

     ReadyUpRequest rur = new ReadyUpRequest();
     rur.sessionId = id;
     rur.authIdToken = token;

     final ReadyUpReply response = await sessionStub.ready(rur);
     print('Readying up user: $id  -> ${response.status}');

     return;
  }

  static void setSessionState(String s, String id) async{


    if(channel==null)
      connectToServer();

    if(sessionStub==null)
      sessionStub = new SessionsManagerClient(channel);

    ChangeStateRequest csr = new ChangeStateRequest();
    csr.state = s;
    csr.sessionId = id;
    csr.authIdToken = token;

    final Session response = await sessionStub.changeState(csr);

    if(response.status=="FAILED")
      print('Failed to update state to $s');

  }

  static Future<LightSession> getLightSessionById(sessionId) async{
    if(channel==null)
      connectToServer();

    if(sessionStub==null)
      sessionStub = new SessionsManagerClient(channel);

    GetSessionRequest gsr = new GetSessionRequest();
    gsr.authIdToken = token;
    gsr.sessionId = sessionId;

    final response = await (sessionStub.getLightSessionById(gsr)).catchError((_)async{

      print('disconnect detected - sleeping for 1 secong and trying again');
      sleep(Duration(seconds: 1));

      print('attempting to reconnect');
      connectToServer();
      sessionStub = new SessionsManagerClient(channel);
//      return await getLightSessionById(sessionId);
    });


    if(response!=null && response.status!=null && response.status!="FAILED"){
      print('Retrieved light session: \'${response.name}\' with id: ${response.sessionId}');
      return response;

    }
    else
      return null;

  }

  static Future addCharacterToCurrentSession(String sessionId,String charId) async
  {
    if(channel==null)
      connectToServer();

    if(sessionStub==null)
      sessionStub = new SessionsManagerClient(channel);

    final request = AddCharacterToSessionRequest();
    request.sessionId = sessionId;
    request.characterId = charId;
    request.authIdToken = token;

    final response = await (sessionStub.addCharacterToSession(request));

    print("Adding $charId to session (${currentSession.name}) => ${response.status}");
    if(response.status=="FAILED")
      print(response.statusMessage);

  }

  static Future<List<LightCharacter>> getGameCharacters(String sessionId) async {

    if(channel==null)
      connectToServer();

    if(sessionStub==null)
      sessionStub = new SessionsManagerClient(channel);


    print('Fetching characters for session: $sessionId');
    final GetCharactersInSessionRequest request = new GetCharactersInSessionRequest();
    request.sessionId = sessionId;
    request.authIdToken = token;

    final GetCharactersInSessionResponse response = await sessionStub.getCharactersInSession(request);

    print('   status: ${response.status}');
    if(response.status=="FAILED")
      print('   message: ${response.statusMessage}');

    return response.lightCharacters;
  }

  static distributeXP(int total, String sessionID) async{

//    int xp = total ~/ currentSession.charactersInSession.length;

//    currentSession.charactersInSession.forEach((char){
//
//      giveXpToCharacter(, charid)
//
//    });

    if(channel==null)
      connectToServer();

    if(sessionStub==null)
      sessionStub = new SessionsManagerClient(channel);

    DistributeXpRequest dxr = new DistributeXpRequest();
    dxr.authIdToken = token;
    dxr.xp = total;
    dxr.sessionId = sessionID;

    final DistributeXpReply response = await sessionStub.distributeXp(dxr);

    print('Distributing XP: ${response.status}');
    if(response.status!="SUCCESS"){
      print(response.statusMessage);
    }

  }

  static giveXpToCharacter(int xp, String charid) async
  {

  }


//  static void updateHp(int currentHp, int maxHp, LocalCharacter char)
//  {
//    char.currentHp = currentHp;
//    char.maxHp = maxHp;
//  }

//  static Future setUpdatedFlag() {
//
//    if(channel==null)
//      connectToServer();
//
//    if(sessionStub==null)
//      sessionStub = new SessionsManagerClient(channel);
//
//    sessionStub.
//
//  }

  /*

  0 	1 	+2
300 	2 	+2
900 	3 	+2
2,700 	4 	+2
6,500 	5 	+3
14,000 	6 	+3
23,000 	7 	+3
34,000 	8 	+3
48,000 	9 	+4
64,000 	10 	+4
85,000 	11 	+4
100,000 	12 	+4
120,000 	13 	+5
140,000 	14 	+5
165,000 	15 	+5
195,000 	16 	+5
225,000 	17 	+6
265,000 	18 	+6
305,000 	19 	+6
355,000 	20 	+6

   */




}
