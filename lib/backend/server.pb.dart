///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library session_server;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class GetSessionRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('GetSessionRequest')
    ..aOS(1, 'authIdToken')
    ..aOS(2, 'sessionId')
    ..hasRequiredFields = false
  ;

  GetSessionRequest() : super();
  GetSessionRequest.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetSessionRequest.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetSessionRequest clone() => new GetSessionRequest()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static GetSessionRequest create() => new GetSessionRequest();
  static PbList<GetSessionRequest> createRepeated() => new PbList<GetSessionRequest>();
  static GetSessionRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyGetSessionRequest();
    return _defaultInstance;
  }
  static GetSessionRequest _defaultInstance;
  static void $checkItem(GetSessionRequest v) {
    if (v is! GetSessionRequest) checkItemFailed(v, 'GetSessionRequest');
  }

  String get authIdToken => $_getS(0, '');
  set authIdToken(String v) { $_setString(0, v); }
  bool hasAuthIdToken() => $_has(0);
  void clearAuthIdToken() => clearField(1);

  String get sessionId => $_getS(1, '');
  set sessionId(String v) { $_setString(1, v); }
  bool hasSessionId() => $_has(1);
  void clearSessionId() => clearField(2);
}

class _ReadonlyGetSessionRequest extends GetSessionRequest with ReadonlyMessageMixin {}

class NewSessionRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('NewSessionRequest')
    ..aOS(1, 'authIdToken')
    ..aOS(2, 'name')
    ..a<int>(3, 'maxPlayers', PbFieldType.OU3)
    ..aOB(4, 'private')
    ..hasRequiredFields = false
  ;

  NewSessionRequest() : super();
  NewSessionRequest.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  NewSessionRequest.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  NewSessionRequest clone() => new NewSessionRequest()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static NewSessionRequest create() => new NewSessionRequest();
  static PbList<NewSessionRequest> createRepeated() => new PbList<NewSessionRequest>();
  static NewSessionRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyNewSessionRequest();
    return _defaultInstance;
  }
  static NewSessionRequest _defaultInstance;
  static void $checkItem(NewSessionRequest v) {
    if (v is! NewSessionRequest) checkItemFailed(v, 'NewSessionRequest');
  }

  String get authIdToken => $_getS(0, '');
  set authIdToken(String v) { $_setString(0, v); }
  bool hasAuthIdToken() => $_has(0);
  void clearAuthIdToken() => clearField(1);

  String get name => $_getS(1, '');
  set name(String v) { $_setString(1, v); }
  bool hasName() => $_has(1);
  void clearName() => clearField(2);

  int get maxPlayers => $_get(2, 0);
  set maxPlayers(int v) { $_setUnsignedInt32(2, v); }
  bool hasMaxPlayers() => $_has(2);
  void clearMaxPlayers() => clearField(3);

  bool get private => $_get(3, false);
  set private(bool v) { $_setBool(3, v); }
  bool hasPrivate() => $_has(3);
  void clearPrivate() => clearField(4);
}

class _ReadonlyNewSessionRequest extends NewSessionRequest with ReadonlyMessageMixin {}

class ListRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('ListRequest')
    ..aOS(1, 'authIdToken')
    ..a<int>(2, 'limit', PbFieldType.OU3)
    ..aOB(3, 'full')
    ..hasRequiredFields = false
  ;

  ListRequest() : super();
  ListRequest.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ListRequest.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ListRequest clone() => new ListRequest()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static ListRequest create() => new ListRequest();
  static PbList<ListRequest> createRepeated() => new PbList<ListRequest>();
  static ListRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyListRequest();
    return _defaultInstance;
  }
  static ListRequest _defaultInstance;
  static void $checkItem(ListRequest v) {
    if (v is! ListRequest) checkItemFailed(v, 'ListRequest');
  }

  String get authIdToken => $_getS(0, '');
  set authIdToken(String v) { $_setString(0, v); }
  bool hasAuthIdToken() => $_has(0);
  void clearAuthIdToken() => clearField(1);

  int get limit => $_get(1, 0);
  set limit(int v) { $_setUnsignedInt32(1, v); }
  bool hasLimit() => $_has(1);
  void clearLimit() => clearField(2);

  bool get full => $_get(2, false);
  set full(bool v) { $_setBool(2, v); }
  bool hasFull() => $_has(2);
  void clearFull() => clearField(3);
}

class _ReadonlyListRequest extends ListRequest with ReadonlyMessageMixin {}

class LeaveRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('LeaveRequest')
    ..aOS(1, 'authIdToken')
    ..aOS(2, 'sessionId')
    ..hasRequiredFields = false
  ;

  LeaveRequest() : super();
  LeaveRequest.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  LeaveRequest.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  LeaveRequest clone() => new LeaveRequest()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static LeaveRequest create() => new LeaveRequest();
  static PbList<LeaveRequest> createRepeated() => new PbList<LeaveRequest>();
  static LeaveRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyLeaveRequest();
    return _defaultInstance;
  }
  static LeaveRequest _defaultInstance;
  static void $checkItem(LeaveRequest v) {
    if (v is! LeaveRequest) checkItemFailed(v, 'LeaveRequest');
  }

  String get authIdToken => $_getS(0, '');
  set authIdToken(String v) { $_setString(0, v); }
  bool hasAuthIdToken() => $_has(0);
  void clearAuthIdToken() => clearField(1);

  String get sessionId => $_getS(1, '');
  set sessionId(String v) { $_setString(1, v); }
  bool hasSessionId() => $_has(1);
  void clearSessionId() => clearField(2);
}

class _ReadonlyLeaveRequest extends LeaveRequest with ReadonlyMessageMixin {}

class JoinRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('JoinRequest')
    ..aOS(1, 'authIdToken')
    ..aOS(2, 'sessionId')
    ..hasRequiredFields = false
  ;

  JoinRequest() : super();
  JoinRequest.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  JoinRequest.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  JoinRequest clone() => new JoinRequest()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static JoinRequest create() => new JoinRequest();
  static PbList<JoinRequest> createRepeated() => new PbList<JoinRequest>();
  static JoinRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyJoinRequest();
    return _defaultInstance;
  }
  static JoinRequest _defaultInstance;
  static void $checkItem(JoinRequest v) {
    if (v is! JoinRequest) checkItemFailed(v, 'JoinRequest');
  }

  String get authIdToken => $_getS(0, '');
  set authIdToken(String v) { $_setString(0, v); }
  bool hasAuthIdToken() => $_has(0);
  void clearAuthIdToken() => clearField(1);

  String get sessionId => $_getS(1, '');
  set sessionId(String v) { $_setString(1, v); }
  bool hasSessionId() => $_has(1);
  void clearSessionId() => clearField(2);
}

class _ReadonlyJoinRequest extends JoinRequest with ReadonlyMessageMixin {}

class KickPlayerRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('KickPlayerRequest')
    ..aOS(1, 'authIdToken')
    ..aOS(2, 'sessionId')
    ..a<User>(3, 'user', PbFieldType.OM, User.getDefault, User.create)
    ..hasRequiredFields = false
  ;

  KickPlayerRequest() : super();
  KickPlayerRequest.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  KickPlayerRequest.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  KickPlayerRequest clone() => new KickPlayerRequest()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static KickPlayerRequest create() => new KickPlayerRequest();
  static PbList<KickPlayerRequest> createRepeated() => new PbList<KickPlayerRequest>();
  static KickPlayerRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyKickPlayerRequest();
    return _defaultInstance;
  }
  static KickPlayerRequest _defaultInstance;
  static void $checkItem(KickPlayerRequest v) {
    if (v is! KickPlayerRequest) checkItemFailed(v, 'KickPlayerRequest');
  }

  String get authIdToken => $_getS(0, '');
  set authIdToken(String v) { $_setString(0, v); }
  bool hasAuthIdToken() => $_has(0);
  void clearAuthIdToken() => clearField(1);

  String get sessionId => $_getS(1, '');
  set sessionId(String v) { $_setString(1, v); }
  bool hasSessionId() => $_has(1);
  void clearSessionId() => clearField(2);

  User get user => $_getN(2);
  set user(User v) { setField(3, v); }
  bool hasUser() => $_has(2);
  void clearUser() => clearField(3);
}

class _ReadonlyKickPlayerRequest extends KickPlayerRequest with ReadonlyMessageMixin {}

class SetPrivateRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('SetPrivateRequest')
    ..aOS(1, 'authIdToken')
    ..aOS(2, 'sessionId')
    ..aOB(3, 'private')
    ..hasRequiredFields = false
  ;

  SetPrivateRequest() : super();
  SetPrivateRequest.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  SetPrivateRequest.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  SetPrivateRequest clone() => new SetPrivateRequest()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static SetPrivateRequest create() => new SetPrivateRequest();
  static PbList<SetPrivateRequest> createRepeated() => new PbList<SetPrivateRequest>();
  static SetPrivateRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlySetPrivateRequest();
    return _defaultInstance;
  }
  static SetPrivateRequest _defaultInstance;
  static void $checkItem(SetPrivateRequest v) {
    if (v is! SetPrivateRequest) checkItemFailed(v, 'SetPrivateRequest');
  }

  String get authIdToken => $_getS(0, '');
  set authIdToken(String v) { $_setString(0, v); }
  bool hasAuthIdToken() => $_has(0);
  void clearAuthIdToken() => clearField(1);

  String get sessionId => $_getS(1, '');
  set sessionId(String v) { $_setString(1, v); }
  bool hasSessionId() => $_has(1);
  void clearSessionId() => clearField(2);

  bool get private => $_get(2, false);
  set private(bool v) { $_setBool(2, v); }
  bool hasPrivate() => $_has(2);
  void clearPrivate() => clearField(3);
}

class _ReadonlySetPrivateRequest extends SetPrivateRequest with ReadonlyMessageMixin {}

class SetMaxPlayersRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('SetMaxPlayersRequest')
    ..aOS(1, 'authIdToken')
    ..a<int>(2, 'number', PbFieldType.OU3)
    ..aOS(3, 'sessionId')
    ..hasRequiredFields = false
  ;

  SetMaxPlayersRequest() : super();
  SetMaxPlayersRequest.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  SetMaxPlayersRequest.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  SetMaxPlayersRequest clone() => new SetMaxPlayersRequest()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static SetMaxPlayersRequest create() => new SetMaxPlayersRequest();
  static PbList<SetMaxPlayersRequest> createRepeated() => new PbList<SetMaxPlayersRequest>();
  static SetMaxPlayersRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlySetMaxPlayersRequest();
    return _defaultInstance;
  }
  static SetMaxPlayersRequest _defaultInstance;
  static void $checkItem(SetMaxPlayersRequest v) {
    if (v is! SetMaxPlayersRequest) checkItemFailed(v, 'SetMaxPlayersRequest');
  }

  String get authIdToken => $_getS(0, '');
  set authIdToken(String v) { $_setString(0, v); }
  bool hasAuthIdToken() => $_has(0);
  void clearAuthIdToken() => clearField(1);

  int get number => $_get(1, 0);
  set number(int v) { $_setUnsignedInt32(1, v); }
  bool hasNumber() => $_has(1);
  void clearNumber() => clearField(2);

  String get sessionId => $_getS(2, '');
  set sessionId(String v) { $_setString(2, v); }
  bool hasSessionId() => $_has(2);
  void clearSessionId() => clearField(3);
}

class _ReadonlySetMaxPlayersRequest extends SetMaxPlayersRequest with ReadonlyMessageMixin {}

class SetNameRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('SetNameRequest')
    ..aOS(1, 'authIdToken')
    ..aOS(2, 'sessionId')
    ..aOS(3, 'name')
    ..hasRequiredFields = false
  ;

  SetNameRequest() : super();
  SetNameRequest.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  SetNameRequest.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  SetNameRequest clone() => new SetNameRequest()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static SetNameRequest create() => new SetNameRequest();
  static PbList<SetNameRequest> createRepeated() => new PbList<SetNameRequest>();
  static SetNameRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlySetNameRequest();
    return _defaultInstance;
  }
  static SetNameRequest _defaultInstance;
  static void $checkItem(SetNameRequest v) {
    if (v is! SetNameRequest) checkItemFailed(v, 'SetNameRequest');
  }

  String get authIdToken => $_getS(0, '');
  set authIdToken(String v) { $_setString(0, v); }
  bool hasAuthIdToken() => $_has(0);
  void clearAuthIdToken() => clearField(1);

  String get sessionId => $_getS(1, '');
  set sessionId(String v) { $_setString(1, v); }
  bool hasSessionId() => $_has(1);
  void clearSessionId() => clearField(2);

  String get name => $_getS(2, '');
  set name(String v) { $_setString(2, v); }
  bool hasName() => $_has(2);
  void clearName() => clearField(3);
}

class _ReadonlySetNameRequest extends SetNameRequest with ReadonlyMessageMixin {}

class ListReply extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('ListReply')
    ..pp<Session>(1, 'sessions', PbFieldType.PM, Session.$checkItem, Session.create)
    ..aOS(2, 'status')
    ..hasRequiredFields = false
  ;

  ListReply() : super();
  ListReply.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ListReply.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ListReply clone() => new ListReply()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static ListReply create() => new ListReply();
  static PbList<ListReply> createRepeated() => new PbList<ListReply>();
  static ListReply getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyListReply();
    return _defaultInstance;
  }
  static ListReply _defaultInstance;
  static void $checkItem(ListReply v) {
    if (v is! ListReply) checkItemFailed(v, 'ListReply');
  }

  List<Session> get sessions => $_getList(0);

  String get status => $_getS(1, '');
  set status(String v) { $_setString(1, v); }
  bool hasStatus() => $_has(1);
  void clearStatus() => clearField(2);
}

class _ReadonlyListReply extends ListReply with ReadonlyMessageMixin {}

class LeaveReply extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('LeaveReply')
    ..aOS(1, 'status')
    ..aOS(2, 'statusMessage')
    ..hasRequiredFields = false
  ;

  LeaveReply() : super();
  LeaveReply.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  LeaveReply.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  LeaveReply clone() => new LeaveReply()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static LeaveReply create() => new LeaveReply();
  static PbList<LeaveReply> createRepeated() => new PbList<LeaveReply>();
  static LeaveReply getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyLeaveReply();
    return _defaultInstance;
  }
  static LeaveReply _defaultInstance;
  static void $checkItem(LeaveReply v) {
    if (v is! LeaveReply) checkItemFailed(v, 'LeaveReply');
  }

  String get status => $_getS(0, '');
  set status(String v) { $_setString(0, v); }
  bool hasStatus() => $_has(0);
  void clearStatus() => clearField(1);

  String get statusMessage => $_getS(1, '');
  set statusMessage(String v) { $_setString(1, v); }
  bool hasStatusMessage() => $_has(1);
  void clearStatusMessage() => clearField(2);
}

class _ReadonlyLeaveReply extends LeaveReply with ReadonlyMessageMixin {}

class Session extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('Session')
    ..aOS(1, 'status')
    ..aOS(2, 'statusMessage')
    ..aOS(3, 'sessionId')
    ..aOS(4, 'name')
    ..a<User>(5, 'dungeonMaster', PbFieldType.OM, User.getDefault, User.create)
    ..aOS(6, 'dateCreated')
    ..a<int>(7, 'maxPlayers', PbFieldType.OU3)
    ..pp<User>(8, 'users', PbFieldType.PM, User.$checkItem, User.create)
    ..aOB(9, 'private')
    ..aOB(10, 'full')
    ..hasRequiredFields = false
  ;

  Session() : super();
  Session.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Session.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Session clone() => new Session()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static Session create() => new Session();
  static PbList<Session> createRepeated() => new PbList<Session>();
  static Session getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlySession();
    return _defaultInstance;
  }
  static Session _defaultInstance;
  static void $checkItem(Session v) {
    if (v is! Session) checkItemFailed(v, 'Session');
  }

  String get status => $_getS(0, '');
  set status(String v) { $_setString(0, v); }
  bool hasStatus() => $_has(0);
  void clearStatus() => clearField(1);

  String get statusMessage => $_getS(1, '');
  set statusMessage(String v) { $_setString(1, v); }
  bool hasStatusMessage() => $_has(1);
  void clearStatusMessage() => clearField(2);

  String get sessionId => $_getS(2, '');
  set sessionId(String v) { $_setString(2, v); }
  bool hasSessionId() => $_has(2);
  void clearSessionId() => clearField(3);

  String get name => $_getS(3, '');
  set name(String v) { $_setString(3, v); }
  bool hasName() => $_has(3);
  void clearName() => clearField(4);

  User get dungeonMaster => $_getN(4);
  set dungeonMaster(User v) { setField(5, v); }
  bool hasDungeonMaster() => $_has(4);
  void clearDungeonMaster() => clearField(5);

  String get dateCreated => $_getS(5, '');
  set dateCreated(String v) { $_setString(5, v); }
  bool hasDateCreated() => $_has(5);
  void clearDateCreated() => clearField(6);

  int get maxPlayers => $_get(6, 0);
  set maxPlayers(int v) { $_setUnsignedInt32(6, v); }
  bool hasMaxPlayers() => $_has(6);
  void clearMaxPlayers() => clearField(7);

  List<User> get users => $_getList(7);

  bool get private => $_get(8, false);
  set private(bool v) { $_setBool(8, v); }
  bool hasPrivate() => $_has(8);
  void clearPrivate() => clearField(9);

  bool get full => $_get(9, false);
  set full(bool v) { $_setBool(9, v); }
  bool hasFull() => $_has(9);
  void clearFull() => clearField(10);
}

class _ReadonlySession extends Session with ReadonlyMessageMixin {}

class User extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('User')
    ..aOS(1, 'uid')
    ..aOS(2, 'name')
    ..hasRequiredFields = false
  ;

  User() : super();
  User.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  User.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  User clone() => new User()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static User create() => new User();
  static PbList<User> createRepeated() => new PbList<User>();
  static User getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyUser();
    return _defaultInstance;
  }
  static User _defaultInstance;
  static void $checkItem(User v) {
    if (v is! User) checkItemFailed(v, 'User');
  }

  String get uid => $_getS(0, '');
  set uid(String v) { $_setString(0, v); }
  bool hasUid() => $_has(0);
  void clearUid() => clearField(1);

  String get name => $_getS(1, '');
  set name(String v) { $_setString(1, v); }
  bool hasName() => $_has(1);
  void clearName() => clearField(2);
}

class _ReadonlyUser extends User with ReadonlyMessageMixin {}

