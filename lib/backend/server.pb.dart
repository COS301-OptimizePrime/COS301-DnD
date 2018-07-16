///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library session_server;

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart';

class GetCharacterByIdRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('GetCharacterByIdRequest')
    ..aOS(1, 'authIdToken')
    ..aOS(2, 'characterId')
    ..hasRequiredFields = false
  ;

  GetCharacterByIdRequest() : super();
  GetCharacterByIdRequest.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetCharacterByIdRequest.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetCharacterByIdRequest clone() => new GetCharacterByIdRequest()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static GetCharacterByIdRequest create() => new GetCharacterByIdRequest();
  static PbList<GetCharacterByIdRequest> createRepeated() => new PbList<GetCharacterByIdRequest>();
  static GetCharacterByIdRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyGetCharacterByIdRequest();
    return _defaultInstance;
  }
  static GetCharacterByIdRequest _defaultInstance;
  static void $checkItem(GetCharacterByIdRequest v) {
    if (v is! GetCharacterByIdRequest) checkItemFailed(v, 'GetCharacterByIdRequest');
  }

  String get authIdToken => $_getS(0, '');
  set authIdToken(String v) { $_setString(0, v); }
  bool hasAuthIdToken() => $_has(0);
  void clearAuthIdToken() => clearField(1);

  String get characterId => $_getS(1, '');
  set characterId(String v) { $_setString(1, v); }
  bool hasCharacterId() => $_has(1);
  void clearCharacterId() => clearField(2);
}

class _ReadonlyGetCharacterByIdRequest extends GetCharacterByIdRequest with ReadonlyMessageMixin {}

class DeleteCharacterRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('DeleteCharacterRequest')
    ..aOS(1, 'authIdToken')
    ..aOS(2, 'characterId')
    ..hasRequiredFields = false
  ;

  DeleteCharacterRequest() : super();
  DeleteCharacterRequest.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  DeleteCharacterRequest.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  DeleteCharacterRequest clone() => new DeleteCharacterRequest()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static DeleteCharacterRequest create() => new DeleteCharacterRequest();
  static PbList<DeleteCharacterRequest> createRepeated() => new PbList<DeleteCharacterRequest>();
  static DeleteCharacterRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyDeleteCharacterRequest();
    return _defaultInstance;
  }
  static DeleteCharacterRequest _defaultInstance;
  static void $checkItem(DeleteCharacterRequest v) {
    if (v is! DeleteCharacterRequest) checkItemFailed(v, 'DeleteCharacterRequest');
  }

  String get authIdToken => $_getS(0, '');
  set authIdToken(String v) { $_setString(0, v); }
  bool hasAuthIdToken() => $_has(0);
  void clearAuthIdToken() => clearField(1);

  String get characterId => $_getS(1, '');
  set characterId(String v) { $_setString(1, v); }
  bool hasCharacterId() => $_has(1);
  void clearCharacterId() => clearField(2);
}

class _ReadonlyDeleteCharacterRequest extends DeleteCharacterRequest with ReadonlyMessageMixin {}

class UpdateCharacterRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('UpdateCharacterRequest')
    ..aOS(1, 'authIdToken')
    ..a<Character>(2, 'character', PbFieldType.OM, Character.getDefault, Character.create)
    ..hasRequiredFields = false
  ;

  UpdateCharacterRequest() : super();
  UpdateCharacterRequest.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  UpdateCharacterRequest.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  UpdateCharacterRequest clone() => new UpdateCharacterRequest()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static UpdateCharacterRequest create() => new UpdateCharacterRequest();
  static PbList<UpdateCharacterRequest> createRepeated() => new PbList<UpdateCharacterRequest>();
  static UpdateCharacterRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyUpdateCharacterRequest();
    return _defaultInstance;
  }
  static UpdateCharacterRequest _defaultInstance;
  static void $checkItem(UpdateCharacterRequest v) {
    if (v is! UpdateCharacterRequest) checkItemFailed(v, 'UpdateCharacterRequest');
  }

  String get authIdToken => $_getS(0, '');
  set authIdToken(String v) { $_setString(0, v); }
  bool hasAuthIdToken() => $_has(0);
  void clearAuthIdToken() => clearField(1);

  Character get character => $_getN(1);
  set character(Character v) { setField(2, v); }
  bool hasCharacter() => $_has(1);
  void clearCharacter() => clearField(2);
}

class _ReadonlyUpdateCharacterRequest extends UpdateCharacterRequest with ReadonlyMessageMixin {}

class GetCharactersRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('GetCharactersRequest')
    ..aOS(1, 'authIdToken')
    ..a<int>(2, 'limit', PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  GetCharactersRequest() : super();
  GetCharactersRequest.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetCharactersRequest.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetCharactersRequest clone() => new GetCharactersRequest()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static GetCharactersRequest create() => new GetCharactersRequest();
  static PbList<GetCharactersRequest> createRepeated() => new PbList<GetCharactersRequest>();
  static GetCharactersRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyGetCharactersRequest();
    return _defaultInstance;
  }
  static GetCharactersRequest _defaultInstance;
  static void $checkItem(GetCharactersRequest v) {
    if (v is! GetCharactersRequest) checkItemFailed(v, 'GetCharactersRequest');
  }

  String get authIdToken => $_getS(0, '');
  set authIdToken(String v) { $_setString(0, v); }
  bool hasAuthIdToken() => $_has(0);
  void clearAuthIdToken() => clearField(1);

  int get limit => $_get(1, 0);
  set limit(int v) { $_setUnsignedInt32(1, v); }
  bool hasLimit() => $_has(1);
  void clearLimit() => clearField(2);
}

class _ReadonlyGetCharactersRequest extends GetCharactersRequest with ReadonlyMessageMixin {}

class GetCharactersReply extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('GetCharactersReply')
    ..aOS(1, 'status')
    ..aOS(2, 'statusMessage')
    ..pp<Character>(3, 'characters', PbFieldType.PM, Character.$checkItem, Character.create)
    ..hasRequiredFields = false
  ;

  GetCharactersReply() : super();
  GetCharactersReply.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetCharactersReply.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetCharactersReply clone() => new GetCharactersReply()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static GetCharactersReply create() => new GetCharactersReply();
  static PbList<GetCharactersReply> createRepeated() => new PbList<GetCharactersReply>();
  static GetCharactersReply getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyGetCharactersReply();
    return _defaultInstance;
  }
  static GetCharactersReply _defaultInstance;
  static void $checkItem(GetCharactersReply v) {
    if (v is! GetCharactersReply) checkItemFailed(v, 'GetCharactersReply');
  }

  String get status => $_getS(0, '');
  set status(String v) { $_setString(0, v); }
  bool hasStatus() => $_has(0);
  void clearStatus() => clearField(1);

  String get statusMessage => $_getS(1, '');
  set statusMessage(String v) { $_setString(1, v); }
  bool hasStatusMessage() => $_has(1);
  void clearStatusMessage() => clearField(2);

  List<Character> get characters => $_getList(2);
}

class _ReadonlyGetCharactersReply extends GetCharactersReply with ReadonlyMessageMixin {}

class GetSessionsOfUserRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('GetSessionsOfUserRequest')
    ..aOS(1, 'authIdToken')
    ..a<int>(2, 'limit', PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  GetSessionsOfUserRequest() : super();
  GetSessionsOfUserRequest.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetSessionsOfUserRequest.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetSessionsOfUserRequest clone() => new GetSessionsOfUserRequest()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static GetSessionsOfUserRequest create() => new GetSessionsOfUserRequest();
  static PbList<GetSessionsOfUserRequest> createRepeated() => new PbList<GetSessionsOfUserRequest>();
  static GetSessionsOfUserRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyGetSessionsOfUserRequest();
    return _defaultInstance;
  }
  static GetSessionsOfUserRequest _defaultInstance;
  static void $checkItem(GetSessionsOfUserRequest v) {
    if (v is! GetSessionsOfUserRequest) checkItemFailed(v, 'GetSessionsOfUserRequest');
  }

  String get authIdToken => $_getS(0, '');
  set authIdToken(String v) { $_setString(0, v); }
  bool hasAuthIdToken() => $_has(0);
  void clearAuthIdToken() => clearField(1);

  int get limit => $_get(1, 0);
  set limit(int v) { $_setUnsignedInt32(1, v); }
  bool hasLimit() => $_has(1);
  void clearLimit() => clearField(2);
}

class _ReadonlyGetSessionsOfUserRequest extends GetSessionsOfUserRequest with ReadonlyMessageMixin {}

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

class NewCharacterRequest extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('NewCharacterRequest')
    ..aOS(1, 'authIdToken')
    ..a<Character>(2, 'character', PbFieldType.OM, Character.getDefault, Character.create)
    ..hasRequiredFields = false
  ;

  NewCharacterRequest() : super();
  NewCharacterRequest.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  NewCharacterRequest.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  NewCharacterRequest clone() => new NewCharacterRequest()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static NewCharacterRequest create() => new NewCharacterRequest();
  static PbList<NewCharacterRequest> createRepeated() => new PbList<NewCharacterRequest>();
  static NewCharacterRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyNewCharacterRequest();
    return _defaultInstance;
  }
  static NewCharacterRequest _defaultInstance;
  static void $checkItem(NewCharacterRequest v) {
    if (v is! NewCharacterRequest) checkItemFailed(v, 'NewCharacterRequest');
  }

  String get authIdToken => $_getS(0, '');
  set authIdToken(String v) { $_setString(0, v); }
  bool hasAuthIdToken() => $_has(0);
  void clearAuthIdToken() => clearField(1);

  Character get character => $_getN(1);
  set character(Character v) { setField(2, v); }
  bool hasCharacter() => $_has(1);
  void clearCharacter() => clearField(2);
}

class _ReadonlyNewCharacterRequest extends NewCharacterRequest with ReadonlyMessageMixin {}

class DeleteCharacterReply extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('DeleteCharacterReply')
    ..aOS(1, 'status')
    ..aOS(2, 'statusMessage')
    ..hasRequiredFields = false
  ;

  DeleteCharacterReply() : super();
  DeleteCharacterReply.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  DeleteCharacterReply.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  DeleteCharacterReply clone() => new DeleteCharacterReply()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static DeleteCharacterReply create() => new DeleteCharacterReply();
  static PbList<DeleteCharacterReply> createRepeated() => new PbList<DeleteCharacterReply>();
  static DeleteCharacterReply getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyDeleteCharacterReply();
    return _defaultInstance;
  }
  static DeleteCharacterReply _defaultInstance;
  static void $checkItem(DeleteCharacterReply v) {
    if (v is! DeleteCharacterReply) checkItemFailed(v, 'DeleteCharacterReply');
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

class _ReadonlyDeleteCharacterReply extends DeleteCharacterReply with ReadonlyMessageMixin {}

class Character extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('Character')
    ..aOS(1, 'characterId')
    ..a<User>(2, 'creator', PbFieldType.OM, User.getDefault, User.create)
    ..aOS(3, 'name')
    ..a<int>(4, 'strength', PbFieldType.OS3)
    ..a<int>(5, 'strengthSubscript', PbFieldType.OS3)
    ..a<int>(6, 'dexterity', PbFieldType.OS3)
    ..a<int>(7, 'dexteritySubscript', PbFieldType.OS3)
    ..a<int>(8, 'constitution', PbFieldType.OS3)
    ..a<int>(9, 'constitutionSubscript', PbFieldType.OS3)
    ..a<int>(10, 'intelligence', PbFieldType.OS3)
    ..a<int>(11, 'intelligenceSubscript', PbFieldType.OS3)
    ..a<int>(12, 'wisdom', PbFieldType.OS3)
    ..a<int>(13, 'wisdomSubscript', PbFieldType.OS3)
    ..a<int>(14, 'charisma', PbFieldType.OS3)
    ..a<int>(15, 'charismaSubscript', PbFieldType.OS3)
    ..aOS(16, 'characterClass')
    ..aOS(17, 'race')
    ..a<int>(18, 'xp', PbFieldType.OS3)
    ..aOS(19, 'alignment')
    ..aOS(20, 'background')
    ..a<int>(21, 'inspiration', PbFieldType.OS3)
    ..a<int>(22, 'proficiencyBonus', PbFieldType.OS3)
    ..a<SavingThrows>(23, 'savingThrows', PbFieldType.OM, SavingThrows.getDefault, SavingThrows.create)
    ..a<Skills>(24, 'skills', PbFieldType.OM, Skills.getDefault, Skills.create)
    ..a<int>(25, 'passiveWisdom', PbFieldType.OS3)
    ..a<Attacks_Spellcasting>(26, 'attacksSpellcasting', PbFieldType.OM, Attacks_Spellcasting.getDefault, Attacks_Spellcasting.create)
    ..a<Hitpoints>(27, 'hitpoints', PbFieldType.OM, Hitpoints.getDefault, Hitpoints.create)
    ..aOS(28, 'personalityTraits')
    ..aOS(29, 'ideals')
    ..aOS(30, 'bonds')
    ..aOS(31, 'flaws')
    ..aOS(32, 'dateCreated')
    ..aOS(33, 'status')
    ..aOS(34, 'statusMessage')
    ..pp<Equipment>(35, 'equipment', PbFieldType.PM, Equipment.$checkItem, Equipment.create)
    ..aOS(36, 'sessionId')
    ..aOS(37, 'featuresAndTraits')
    ..aOB(38, 'online')
    ..hasRequiredFields = false
  ;

  Character() : super();
  Character.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Character.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Character clone() => new Character()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static Character create() => new Character();
  static PbList<Character> createRepeated() => new PbList<Character>();
  static Character getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyCharacter();
    return _defaultInstance;
  }
  static Character _defaultInstance;
  static void $checkItem(Character v) {
    if (v is! Character) checkItemFailed(v, 'Character');
  }

  String get characterId => $_getS(0, '');
  set characterId(String v) { $_setString(0, v); }
  bool hasCharacterId() => $_has(0);
  void clearCharacterId() => clearField(1);

  User get creator => $_getN(1);
  set creator(User v) { setField(2, v); }
  bool hasCreator() => $_has(1);
  void clearCreator() => clearField(2);

  String get name => $_getS(2, '');
  set name(String v) { $_setString(2, v); }
  bool hasName() => $_has(2);
  void clearName() => clearField(3);

  int get strength => $_get(3, 0);
  set strength(int v) { $_setSignedInt32(3, v); }
  bool hasStrength() => $_has(3);
  void clearStrength() => clearField(4);

  int get strengthSubscript => $_get(4, 0);
  set strengthSubscript(int v) { $_setSignedInt32(4, v); }
  bool hasStrengthSubscript() => $_has(4);
  void clearStrengthSubscript() => clearField(5);

  int get dexterity => $_get(5, 0);
  set dexterity(int v) { $_setSignedInt32(5, v); }
  bool hasDexterity() => $_has(5);
  void clearDexterity() => clearField(6);

  int get dexteritySubscript => $_get(6, 0);
  set dexteritySubscript(int v) { $_setSignedInt32(6, v); }
  bool hasDexteritySubscript() => $_has(6);
  void clearDexteritySubscript() => clearField(7);

  int get constitution => $_get(7, 0);
  set constitution(int v) { $_setSignedInt32(7, v); }
  bool hasConstitution() => $_has(7);
  void clearConstitution() => clearField(8);

  int get constitutionSubscript => $_get(8, 0);
  set constitutionSubscript(int v) { $_setSignedInt32(8, v); }
  bool hasConstitutionSubscript() => $_has(8);
  void clearConstitutionSubscript() => clearField(9);

  int get intelligence => $_get(9, 0);
  set intelligence(int v) { $_setSignedInt32(9, v); }
  bool hasIntelligence() => $_has(9);
  void clearIntelligence() => clearField(10);

  int get intelligenceSubscript => $_get(10, 0);
  set intelligenceSubscript(int v) { $_setSignedInt32(10, v); }
  bool hasIntelligenceSubscript() => $_has(10);
  void clearIntelligenceSubscript() => clearField(11);

  int get wisdom => $_get(11, 0);
  set wisdom(int v) { $_setSignedInt32(11, v); }
  bool hasWisdom() => $_has(11);
  void clearWisdom() => clearField(12);

  int get wisdomSubscript => $_get(12, 0);
  set wisdomSubscript(int v) { $_setSignedInt32(12, v); }
  bool hasWisdomSubscript() => $_has(12);
  void clearWisdomSubscript() => clearField(13);

  int get charisma => $_get(13, 0);
  set charisma(int v) { $_setSignedInt32(13, v); }
  bool hasCharisma() => $_has(13);
  void clearCharisma() => clearField(14);

  int get charismaSubscript => $_get(14, 0);
  set charismaSubscript(int v) { $_setSignedInt32(14, v); }
  bool hasCharismaSubscript() => $_has(14);
  void clearCharismaSubscript() => clearField(15);

  String get characterClass => $_getS(15, '');
  set characterClass(String v) { $_setString(15, v); }
  bool hasCharacterClass() => $_has(15);
  void clearCharacterClass() => clearField(16);

  String get race => $_getS(16, '');
  set race(String v) { $_setString(16, v); }
  bool hasRace() => $_has(16);
  void clearRace() => clearField(17);

  int get xp => $_get(17, 0);
  set xp(int v) { $_setSignedInt32(17, v); }
  bool hasXp() => $_has(17);
  void clearXp() => clearField(18);

  String get alignment => $_getS(18, '');
  set alignment(String v) { $_setString(18, v); }
  bool hasAlignment() => $_has(18);
  void clearAlignment() => clearField(19);

  String get background => $_getS(19, '');
  set background(String v) { $_setString(19, v); }
  bool hasBackground() => $_has(19);
  void clearBackground() => clearField(20);

  int get inspiration => $_get(20, 0);
  set inspiration(int v) { $_setSignedInt32(20, v); }
  bool hasInspiration() => $_has(20);
  void clearInspiration() => clearField(21);

  int get proficiencyBonus => $_get(21, 0);
  set proficiencyBonus(int v) { $_setSignedInt32(21, v); }
  bool hasProficiencyBonus() => $_has(21);
  void clearProficiencyBonus() => clearField(22);

  SavingThrows get savingThrows => $_getN(22);
  set savingThrows(SavingThrows v) { setField(23, v); }
  bool hasSavingThrows() => $_has(22);
  void clearSavingThrows() => clearField(23);

  Skills get skills => $_getN(23);
  set skills(Skills v) { setField(24, v); }
  bool hasSkills() => $_has(23);
  void clearSkills() => clearField(24);

  int get passiveWisdom => $_get(24, 0);
  set passiveWisdom(int v) { $_setSignedInt32(24, v); }
  bool hasPassiveWisdom() => $_has(24);
  void clearPassiveWisdom() => clearField(25);

  Attacks_Spellcasting get attacksSpellcasting => $_getN(25);
  set attacksSpellcasting(Attacks_Spellcasting v) { setField(26, v); }
  bool hasAttacksSpellcasting() => $_has(25);
  void clearAttacksSpellcasting() => clearField(26);

  Hitpoints get hitpoints => $_getN(26);
  set hitpoints(Hitpoints v) { setField(27, v); }
  bool hasHitpoints() => $_has(26);
  void clearHitpoints() => clearField(27);

  String get personalityTraits => $_getS(27, '');
  set personalityTraits(String v) { $_setString(27, v); }
  bool hasPersonalityTraits() => $_has(27);
  void clearPersonalityTraits() => clearField(28);

  String get ideals => $_getS(28, '');
  set ideals(String v) { $_setString(28, v); }
  bool hasIdeals() => $_has(28);
  void clearIdeals() => clearField(29);

  String get bonds => $_getS(29, '');
  set bonds(String v) { $_setString(29, v); }
  bool hasBonds() => $_has(29);
  void clearBonds() => clearField(30);

  String get flaws => $_getS(30, '');
  set flaws(String v) { $_setString(30, v); }
  bool hasFlaws() => $_has(30);
  void clearFlaws() => clearField(31);

  String get dateCreated => $_getS(31, '');
  set dateCreated(String v) { $_setString(31, v); }
  bool hasDateCreated() => $_has(31);
  void clearDateCreated() => clearField(32);

  String get status => $_getS(32, '');
  set status(String v) { $_setString(32, v); }
  bool hasStatus() => $_has(32);
  void clearStatus() => clearField(33);

  String get statusMessage => $_getS(33, '');
  set statusMessage(String v) { $_setString(33, v); }
  bool hasStatusMessage() => $_has(33);
  void clearStatusMessage() => clearField(34);

  List<Equipment> get equipment => $_getList(34);

  String get sessionId => $_getS(35, '');
  set sessionId(String v) { $_setString(35, v); }
  bool hasSessionId() => $_has(35);
  void clearSessionId() => clearField(36);

  String get featuresAndTraits => $_getS(36, '');
  set featuresAndTraits(String v) { $_setString(36, v); }
  bool hasFeaturesAndTraits() => $_has(36);
  void clearFeaturesAndTraits() => clearField(37);

  bool get online => $_get(37, false);
  set online(bool v) { $_setBool(37, v); }
  bool hasOnline() => $_has(37);
  void clearOnline() => clearField(38);
}

class _ReadonlyCharacter extends Character with ReadonlyMessageMixin {}

class SavingThrows extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('SavingThrows')
    ..a<int>(1, 'strength', PbFieldType.OS3)
    ..aOB(2, 'strengthProficient')
    ..a<int>(3, 'dexterity', PbFieldType.OS3)
    ..aOB(4, 'dexterityProficient')
    ..a<int>(5, 'constitution', PbFieldType.OS3)
    ..aOB(6, 'constitutionProficient')
    ..a<int>(7, 'intelligence', PbFieldType.OS3)
    ..aOB(8, 'intelligenceProficient')
    ..a<int>(9, 'wisdom', PbFieldType.OS3)
    ..aOB(10, 'wisdomProficient')
    ..a<int>(11, 'charisma', PbFieldType.OS3)
    ..aOB(12, 'charismaSubscript')
    ..hasRequiredFields = false
  ;

  SavingThrows() : super();
  SavingThrows.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  SavingThrows.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  SavingThrows clone() => new SavingThrows()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static SavingThrows create() => new SavingThrows();
  static PbList<SavingThrows> createRepeated() => new PbList<SavingThrows>();
  static SavingThrows getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlySavingThrows();
    return _defaultInstance;
  }
  static SavingThrows _defaultInstance;
  static void $checkItem(SavingThrows v) {
    if (v is! SavingThrows) checkItemFailed(v, 'SavingThrows');
  }

  int get strength => $_get(0, 0);
  set strength(int v) { $_setSignedInt32(0, v); }
  bool hasStrength() => $_has(0);
  void clearStrength() => clearField(1);

  bool get strengthProficient => $_get(1, false);
  set strengthProficient(bool v) { $_setBool(1, v); }
  bool hasStrengthProficient() => $_has(1);
  void clearStrengthProficient() => clearField(2);

  int get dexterity => $_get(2, 0);
  set dexterity(int v) { $_setSignedInt32(2, v); }
  bool hasDexterity() => $_has(2);
  void clearDexterity() => clearField(3);

  bool get dexterityProficient => $_get(3, false);
  set dexterityProficient(bool v) { $_setBool(3, v); }
  bool hasDexterityProficient() => $_has(3);
  void clearDexterityProficient() => clearField(4);

  int get constitution => $_get(4, 0);
  set constitution(int v) { $_setSignedInt32(4, v); }
  bool hasConstitution() => $_has(4);
  void clearConstitution() => clearField(5);

  bool get constitutionProficient => $_get(5, false);
  set constitutionProficient(bool v) { $_setBool(5, v); }
  bool hasConstitutionProficient() => $_has(5);
  void clearConstitutionProficient() => clearField(6);

  int get intelligence => $_get(6, 0);
  set intelligence(int v) { $_setSignedInt32(6, v); }
  bool hasIntelligence() => $_has(6);
  void clearIntelligence() => clearField(7);

  bool get intelligenceProficient => $_get(7, false);
  set intelligenceProficient(bool v) { $_setBool(7, v); }
  bool hasIntelligenceProficient() => $_has(7);
  void clearIntelligenceProficient() => clearField(8);

  int get wisdom => $_get(8, 0);
  set wisdom(int v) { $_setSignedInt32(8, v); }
  bool hasWisdom() => $_has(8);
  void clearWisdom() => clearField(9);

  bool get wisdomProficient => $_get(9, false);
  set wisdomProficient(bool v) { $_setBool(9, v); }
  bool hasWisdomProficient() => $_has(9);
  void clearWisdomProficient() => clearField(10);

  int get charisma => $_get(10, 0);
  set charisma(int v) { $_setSignedInt32(10, v); }
  bool hasCharisma() => $_has(10);
  void clearCharisma() => clearField(11);

  bool get charismaSubscript => $_get(11, false);
  set charismaSubscript(bool v) { $_setBool(11, v); }
  bool hasCharismaSubscript() => $_has(11);
  void clearCharismaSubscript() => clearField(12);
}

class _ReadonlySavingThrows extends SavingThrows with ReadonlyMessageMixin {}

class Skills extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('Skills')
    ..a<int>(1, 'acrobatics', PbFieldType.OS3)
    ..aOB(2, 'acrobaticsProficient')
    ..a<int>(3, 'animalHandling', PbFieldType.OS3)
    ..aOB(4, 'animalHandlingProficient')
    ..a<int>(5, 'arcana', PbFieldType.OS3)
    ..aOB(6, 'arcanaProficient')
    ..a<int>(7, 'athletics', PbFieldType.OS3)
    ..aOB(8, 'athleticsProficient')
    ..a<int>(9, 'deception', PbFieldType.OS3)
    ..aOB(10, 'deceptionProficient')
    ..a<int>(11, 'history', PbFieldType.OS3)
    ..aOB(12, 'historyProficient')
    ..a<int>(13, 'insight', PbFieldType.OS3)
    ..aOB(14, 'insightProficient')
    ..a<int>(15, 'intimidation', PbFieldType.OS3)
    ..aOB(16, 'intimidationProficient')
    ..a<int>(17, 'investigation', PbFieldType.OS3)
    ..aOB(18, 'investigationProficient')
    ..a<int>(19, 'medicine', PbFieldType.OS3)
    ..aOB(20, 'medicineProficient')
    ..a<int>(21, 'nature', PbFieldType.OS3)
    ..aOB(22, 'natureProficient')
    ..a<int>(23, 'perception', PbFieldType.OS3)
    ..aOB(24, 'perceptionProficient')
    ..a<int>(25, 'performance', PbFieldType.OS3)
    ..aOB(26, 'performanceProficient')
    ..a<int>(27, 'persuasion', PbFieldType.OS3)
    ..aOB(28, 'persuasionProficient')
    ..a<int>(29, 'religion', PbFieldType.OS3)
    ..aOB(30, 'religionProficient')
    ..a<int>(31, 'sleightOfHand', PbFieldType.OS3)
    ..aOB(32, 'sleightOfHandProficient')
    ..a<int>(33, 'stealth', PbFieldType.OS3)
    ..aOB(34, 'stealthProficient')
    ..a<int>(35, 'survival', PbFieldType.OS3)
    ..aOB(36, 'survivalProficient')
    ..hasRequiredFields = false
  ;

  Skills() : super();
  Skills.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Skills.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Skills clone() => new Skills()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static Skills create() => new Skills();
  static PbList<Skills> createRepeated() => new PbList<Skills>();
  static Skills getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlySkills();
    return _defaultInstance;
  }
  static Skills _defaultInstance;
  static void $checkItem(Skills v) {
    if (v is! Skills) checkItemFailed(v, 'Skills');
  }

  int get acrobatics => $_get(0, 0);
  set acrobatics(int v) { $_setSignedInt32(0, v); }
  bool hasAcrobatics() => $_has(0);
  void clearAcrobatics() => clearField(1);

  bool get acrobaticsProficient => $_get(1, false);
  set acrobaticsProficient(bool v) { $_setBool(1, v); }
  bool hasAcrobaticsProficient() => $_has(1);
  void clearAcrobaticsProficient() => clearField(2);

  int get animalHandling => $_get(2, 0);
  set animalHandling(int v) { $_setSignedInt32(2, v); }
  bool hasAnimalHandling() => $_has(2);
  void clearAnimalHandling() => clearField(3);

  bool get animalHandlingProficient => $_get(3, false);
  set animalHandlingProficient(bool v) { $_setBool(3, v); }
  bool hasAnimalHandlingProficient() => $_has(3);
  void clearAnimalHandlingProficient() => clearField(4);

  int get arcana => $_get(4, 0);
  set arcana(int v) { $_setSignedInt32(4, v); }
  bool hasArcana() => $_has(4);
  void clearArcana() => clearField(5);

  bool get arcanaProficient => $_get(5, false);
  set arcanaProficient(bool v) { $_setBool(5, v); }
  bool hasArcanaProficient() => $_has(5);
  void clearArcanaProficient() => clearField(6);

  int get athletics => $_get(6, 0);
  set athletics(int v) { $_setSignedInt32(6, v); }
  bool hasAthletics() => $_has(6);
  void clearAthletics() => clearField(7);

  bool get athleticsProficient => $_get(7, false);
  set athleticsProficient(bool v) { $_setBool(7, v); }
  bool hasAthleticsProficient() => $_has(7);
  void clearAthleticsProficient() => clearField(8);

  int get deception => $_get(8, 0);
  set deception(int v) { $_setSignedInt32(8, v); }
  bool hasDeception() => $_has(8);
  void clearDeception() => clearField(9);

  bool get deceptionProficient => $_get(9, false);
  set deceptionProficient(bool v) { $_setBool(9, v); }
  bool hasDeceptionProficient() => $_has(9);
  void clearDeceptionProficient() => clearField(10);

  int get history => $_get(10, 0);
  set history(int v) { $_setSignedInt32(10, v); }
  bool hasHistory() => $_has(10);
  void clearHistory() => clearField(11);

  bool get historyProficient => $_get(11, false);
  set historyProficient(bool v) { $_setBool(11, v); }
  bool hasHistoryProficient() => $_has(11);
  void clearHistoryProficient() => clearField(12);

  int get insight => $_get(12, 0);
  set insight(int v) { $_setSignedInt32(12, v); }
  bool hasInsight() => $_has(12);
  void clearInsight() => clearField(13);

  bool get insightProficient => $_get(13, false);
  set insightProficient(bool v) { $_setBool(13, v); }
  bool hasInsightProficient() => $_has(13);
  void clearInsightProficient() => clearField(14);

  int get intimidation => $_get(14, 0);
  set intimidation(int v) { $_setSignedInt32(14, v); }
  bool hasIntimidation() => $_has(14);
  void clearIntimidation() => clearField(15);

  bool get intimidationProficient => $_get(15, false);
  set intimidationProficient(bool v) { $_setBool(15, v); }
  bool hasIntimidationProficient() => $_has(15);
  void clearIntimidationProficient() => clearField(16);

  int get investigation => $_get(16, 0);
  set investigation(int v) { $_setSignedInt32(16, v); }
  bool hasInvestigation() => $_has(16);
  void clearInvestigation() => clearField(17);

  bool get investigationProficient => $_get(17, false);
  set investigationProficient(bool v) { $_setBool(17, v); }
  bool hasInvestigationProficient() => $_has(17);
  void clearInvestigationProficient() => clearField(18);

  int get medicine => $_get(18, 0);
  set medicine(int v) { $_setSignedInt32(18, v); }
  bool hasMedicine() => $_has(18);
  void clearMedicine() => clearField(19);

  bool get medicineProficient => $_get(19, false);
  set medicineProficient(bool v) { $_setBool(19, v); }
  bool hasMedicineProficient() => $_has(19);
  void clearMedicineProficient() => clearField(20);

  int get nature => $_get(20, 0);
  set nature(int v) { $_setSignedInt32(20, v); }
  bool hasNature() => $_has(20);
  void clearNature() => clearField(21);

  bool get natureProficient => $_get(21, false);
  set natureProficient(bool v) { $_setBool(21, v); }
  bool hasNatureProficient() => $_has(21);
  void clearNatureProficient() => clearField(22);

  int get perception => $_get(22, 0);
  set perception(int v) { $_setSignedInt32(22, v); }
  bool hasPerception() => $_has(22);
  void clearPerception() => clearField(23);

  bool get perceptionProficient => $_get(23, false);
  set perceptionProficient(bool v) { $_setBool(23, v); }
  bool hasPerceptionProficient() => $_has(23);
  void clearPerceptionProficient() => clearField(24);

  int get performance => $_get(24, 0);
  set performance(int v) { $_setSignedInt32(24, v); }
  bool hasPerformance() => $_has(24);
  void clearPerformance() => clearField(25);

  bool get performanceProficient => $_get(25, false);
  set performanceProficient(bool v) { $_setBool(25, v); }
  bool hasPerformanceProficient() => $_has(25);
  void clearPerformanceProficient() => clearField(26);

  int get persuasion => $_get(26, 0);
  set persuasion(int v) { $_setSignedInt32(26, v); }
  bool hasPersuasion() => $_has(26);
  void clearPersuasion() => clearField(27);

  bool get persuasionProficient => $_get(27, false);
  set persuasionProficient(bool v) { $_setBool(27, v); }
  bool hasPersuasionProficient() => $_has(27);
  void clearPersuasionProficient() => clearField(28);

  int get religion => $_get(28, 0);
  set religion(int v) { $_setSignedInt32(28, v); }
  bool hasReligion() => $_has(28);
  void clearReligion() => clearField(29);

  bool get religionProficient => $_get(29, false);
  set religionProficient(bool v) { $_setBool(29, v); }
  bool hasReligionProficient() => $_has(29);
  void clearReligionProficient() => clearField(30);

  int get sleightOfHand => $_get(30, 0);
  set sleightOfHand(int v) { $_setSignedInt32(30, v); }
  bool hasSleightOfHand() => $_has(30);
  void clearSleightOfHand() => clearField(31);

  bool get sleightOfHandProficient => $_get(31, false);
  set sleightOfHandProficient(bool v) { $_setBool(31, v); }
  bool hasSleightOfHandProficient() => $_has(31);
  void clearSleightOfHandProficient() => clearField(32);

  int get stealth => $_get(32, 0);
  set stealth(int v) { $_setSignedInt32(32, v); }
  bool hasStealth() => $_has(32);
  void clearStealth() => clearField(33);

  bool get stealthProficient => $_get(33, false);
  set stealthProficient(bool v) { $_setBool(33, v); }
  bool hasStealthProficient() => $_has(33);
  void clearStealthProficient() => clearField(34);

  int get survival => $_get(34, 0);
  set survival(int v) { $_setSignedInt32(34, v); }
  bool hasSurvival() => $_has(34);
  void clearSurvival() => clearField(35);

  bool get survivalProficient => $_get(35, false);
  set survivalProficient(bool v) { $_setBool(35, v); }
  bool hasSurvivalProficient() => $_has(35);
  void clearSurvivalProficient() => clearField(36);
}

class _ReadonlySkills extends Skills with ReadonlyMessageMixin {}

class Attacks_Spellcasting extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('Attacks_Spellcasting')
    ..aOS(1, 'name1')
    ..aOS(2, 'name2')
    ..aOS(3, 'name3')
    ..a<int>(4, 'atkBonus1', PbFieldType.OS3)
    ..a<int>(5, 'atkBonus2', PbFieldType.OS3)
    ..a<int>(6, 'atkBonus3', PbFieldType.OS3)
    ..aOS(7, 'damageType1')
    ..aOS(8, 'damageType2')
    ..aOS(9, 'damageType3')
    ..hasRequiredFields = false
  ;

  Attacks_Spellcasting() : super();
  Attacks_Spellcasting.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Attacks_Spellcasting.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Attacks_Spellcasting clone() => new Attacks_Spellcasting()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static Attacks_Spellcasting create() => new Attacks_Spellcasting();
  static PbList<Attacks_Spellcasting> createRepeated() => new PbList<Attacks_Spellcasting>();
  static Attacks_Spellcasting getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyAttacks_Spellcasting();
    return _defaultInstance;
  }
  static Attacks_Spellcasting _defaultInstance;
  static void $checkItem(Attacks_Spellcasting v) {
    if (v is! Attacks_Spellcasting) checkItemFailed(v, 'Attacks_Spellcasting');
  }

  String get name1 => $_getS(0, '');
  set name1(String v) { $_setString(0, v); }
  bool hasName1() => $_has(0);
  void clearName1() => clearField(1);

  String get name2 => $_getS(1, '');
  set name2(String v) { $_setString(1, v); }
  bool hasName2() => $_has(1);
  void clearName2() => clearField(2);

  String get name3 => $_getS(2, '');
  set name3(String v) { $_setString(2, v); }
  bool hasName3() => $_has(2);
  void clearName3() => clearField(3);

  int get atkBonus1 => $_get(3, 0);
  set atkBonus1(int v) { $_setSignedInt32(3, v); }
  bool hasAtkBonus1() => $_has(3);
  void clearAtkBonus1() => clearField(4);

  int get atkBonus2 => $_get(4, 0);
  set atkBonus2(int v) { $_setSignedInt32(4, v); }
  bool hasAtkBonus2() => $_has(4);
  void clearAtkBonus2() => clearField(5);

  int get atkBonus3 => $_get(5, 0);
  set atkBonus3(int v) { $_setSignedInt32(5, v); }
  bool hasAtkBonus3() => $_has(5);
  void clearAtkBonus3() => clearField(6);

  String get damageType1 => $_getS(6, '');
  set damageType1(String v) { $_setString(6, v); }
  bool hasDamageType1() => $_has(6);
  void clearDamageType1() => clearField(7);

  String get damageType2 => $_getS(7, '');
  set damageType2(String v) { $_setString(7, v); }
  bool hasDamageType2() => $_has(7);
  void clearDamageType2() => clearField(8);

  String get damageType3 => $_getS(8, '');
  set damageType3(String v) { $_setString(8, v); }
  bool hasDamageType3() => $_has(8);
  void clearDamageType3() => clearField(9);
}

class _ReadonlyAttacks_Spellcasting extends Attacks_Spellcasting with ReadonlyMessageMixin {}

class Hitpoints extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('Hitpoints')
    ..a<int>(1, 'armorClass', PbFieldType.OS3)
    ..a<int>(2, 'initiative', PbFieldType.OS3)
    ..a<int>(3, 'speed', PbFieldType.OS3)
    ..a<int>(4, 'currentHitpoints', PbFieldType.OS3)
    ..a<int>(5, 'maxHitpoints', PbFieldType.OS3)
    ..a<int>(6, 'temporaryHitpoints', PbFieldType.OS3)
    ..aOS(7, 'hitdice')
    ..aOB(8, 'deathsavesSuccess1')
    ..aOB(9, 'deathsavesSuccess2')
    ..aOB(10, 'deathsavesSuccess3')
    ..aOB(11, 'deathsavesFailures1')
    ..aOB(12, 'deathsavesFailures2')
    ..aOB(13, 'deathsavesFailures3')
    ..hasRequiredFields = false
  ;

  Hitpoints() : super();
  Hitpoints.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Hitpoints.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Hitpoints clone() => new Hitpoints()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static Hitpoints create() => new Hitpoints();
  static PbList<Hitpoints> createRepeated() => new PbList<Hitpoints>();
  static Hitpoints getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyHitpoints();
    return _defaultInstance;
  }
  static Hitpoints _defaultInstance;
  static void $checkItem(Hitpoints v) {
    if (v is! Hitpoints) checkItemFailed(v, 'Hitpoints');
  }

  int get armorClass => $_get(0, 0);
  set armorClass(int v) { $_setSignedInt32(0, v); }
  bool hasArmorClass() => $_has(0);
  void clearArmorClass() => clearField(1);

  int get initiative => $_get(1, 0);
  set initiative(int v) { $_setSignedInt32(1, v); }
  bool hasInitiative() => $_has(1);
  void clearInitiative() => clearField(2);

  int get speed => $_get(2, 0);
  set speed(int v) { $_setSignedInt32(2, v); }
  bool hasSpeed() => $_has(2);
  void clearSpeed() => clearField(3);

  int get currentHitpoints => $_get(3, 0);
  set currentHitpoints(int v) { $_setSignedInt32(3, v); }
  bool hasCurrentHitpoints() => $_has(3);
  void clearCurrentHitpoints() => clearField(4);

  int get maxHitpoints => $_get(4, 0);
  set maxHitpoints(int v) { $_setSignedInt32(4, v); }
  bool hasMaxHitpoints() => $_has(4);
  void clearMaxHitpoints() => clearField(5);

  int get temporaryHitpoints => $_get(5, 0);
  set temporaryHitpoints(int v) { $_setSignedInt32(5, v); }
  bool hasTemporaryHitpoints() => $_has(5);
  void clearTemporaryHitpoints() => clearField(6);

  String get hitdice => $_getS(6, '');
  set hitdice(String v) { $_setString(6, v); }
  bool hasHitdice() => $_has(6);
  void clearHitdice() => clearField(7);

  bool get deathsavesSuccess1 => $_get(7, false);
  set deathsavesSuccess1(bool v) { $_setBool(7, v); }
  bool hasDeathsavesSuccess1() => $_has(7);
  void clearDeathsavesSuccess1() => clearField(8);

  bool get deathsavesSuccess2 => $_get(8, false);
  set deathsavesSuccess2(bool v) { $_setBool(8, v); }
  bool hasDeathsavesSuccess2() => $_has(8);
  void clearDeathsavesSuccess2() => clearField(9);

  bool get deathsavesSuccess3 => $_get(9, false);
  set deathsavesSuccess3(bool v) { $_setBool(9, v); }
  bool hasDeathsavesSuccess3() => $_has(9);
  void clearDeathsavesSuccess3() => clearField(10);

  bool get deathsavesFailures1 => $_get(10, false);
  set deathsavesFailures1(bool v) { $_setBool(10, v); }
  bool hasDeathsavesFailures1() => $_has(10);
  void clearDeathsavesFailures1() => clearField(11);

  bool get deathsavesFailures2 => $_get(11, false);
  set deathsavesFailures2(bool v) { $_setBool(11, v); }
  bool hasDeathsavesFailures2() => $_has(11);
  void clearDeathsavesFailures2() => clearField(12);

  bool get deathsavesFailures3 => $_get(12, false);
  set deathsavesFailures3(bool v) { $_setBool(12, v); }
  bool hasDeathsavesFailures3() => $_has(12);
  void clearDeathsavesFailures3() => clearField(13);
}

class _ReadonlyHitpoints extends Hitpoints with ReadonlyMessageMixin {}

class Equipment extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('Equipment')
    ..aOS(1, 'name')
    ..a<int>(2, 'value', PbFieldType.OS3)
    ..hasRequiredFields = false
  ;

  Equipment() : super();
  Equipment.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Equipment.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Equipment clone() => new Equipment()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static Equipment create() => new Equipment();
  static PbList<Equipment> createRepeated() => new PbList<Equipment>();
  static Equipment getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyEquipment();
    return _defaultInstance;
  }
  static Equipment _defaultInstance;
  static void $checkItem(Equipment v) {
    if (v is! Equipment) checkItemFailed(v, 'Equipment');
  }

  String get name => $_getS(0, '');
  set name(String v) { $_setString(0, v); }
  bool hasName() => $_has(0);
  void clearName() => clearField(1);

  int get value => $_get(1, 0);
  set value(int v) { $_setSignedInt32(1, v); }
  bool hasValue() => $_has(1);
  void clearValue() => clearField(2);
}

class _ReadonlyEquipment extends Equipment with ReadonlyMessageMixin {}

