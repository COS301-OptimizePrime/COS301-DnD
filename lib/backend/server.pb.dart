///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart' as $pb;
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
// ignore: UNUSED_SHOWN_NAME


class AddCharacterToSessionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('AddCharacterToSessionRequest')
    ..aOS(1, 'authIdToken')
    ..aOS(2, 'sessionId')
    ..aOS(3, 'characterId')
    ..hasRequiredFields = false
  ;

  AddCharacterToSessionRequest() : super();
  AddCharacterToSessionRequest.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  AddCharacterToSessionRequest.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  AddCharacterToSessionRequest clone() => new AddCharacterToSessionRequest()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static AddCharacterToSessionRequest create() => new AddCharacterToSessionRequest();
  static $pb.PbList<AddCharacterToSessionRequest> createRepeated() => new $pb.PbList<AddCharacterToSessionRequest>();
  static AddCharacterToSessionRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyAddCharacterToSessionRequest();
    return _defaultInstance;
  }
  static AddCharacterToSessionRequest _defaultInstance;
  static void $checkItem(AddCharacterToSessionRequest v) {
    if (v is! AddCharacterToSessionRequest) $pb.checkItemFailed(v, 'AddCharacterToSessionRequest');
  }

  String get authIdToken => $_getS(0, '');
  set authIdToken(String v) { $_setString(0, v); }
  bool hasAuthIdToken() => $_has(0);
  void clearAuthIdToken() => clearField(1);

  String get sessionId => $_getS(1, '');
  set sessionId(String v) { $_setString(1, v); }
  bool hasSessionId() => $_has(1);
  void clearSessionId() => clearField(2);

  String get characterId => $_getS(2, '');
  set characterId(String v) { $_setString(2, v); }
  bool hasCharacterId() => $_has(2);
  void clearCharacterId() => clearField(3);
}

class _ReadonlyAddCharacterToSessionRequest extends AddCharacterToSessionRequest with $pb.ReadonlyMessageMixin {}

class RemoveCharacterFromSessionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('RemoveCharacterFromSessionRequest')
    ..aOS(1, 'authIdToken')
    ..aOS(2, 'sessionId')
    ..aOS(3, 'characterId')
    ..hasRequiredFields = false
  ;

  RemoveCharacterFromSessionRequest() : super();
  RemoveCharacterFromSessionRequest.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  RemoveCharacterFromSessionRequest.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  RemoveCharacterFromSessionRequest clone() => new RemoveCharacterFromSessionRequest()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static RemoveCharacterFromSessionRequest create() => new RemoveCharacterFromSessionRequest();
  static $pb.PbList<RemoveCharacterFromSessionRequest> createRepeated() => new $pb.PbList<RemoveCharacterFromSessionRequest>();
  static RemoveCharacterFromSessionRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyRemoveCharacterFromSessionRequest();
    return _defaultInstance;
  }
  static RemoveCharacterFromSessionRequest _defaultInstance;
  static void $checkItem(RemoveCharacterFromSessionRequest v) {
    if (v is! RemoveCharacterFromSessionRequest) $pb.checkItemFailed(v, 'RemoveCharacterFromSessionRequest');
  }

  String get authIdToken => $_getS(0, '');
  set authIdToken(String v) { $_setString(0, v); }
  bool hasAuthIdToken() => $_has(0);
  void clearAuthIdToken() => clearField(1);

  String get sessionId => $_getS(1, '');
  set sessionId(String v) { $_setString(1, v); }
  bool hasSessionId() => $_has(1);
  void clearSessionId() => clearField(2);

  String get characterId => $_getS(2, '');
  set characterId(String v) { $_setString(2, v); }
  bool hasCharacterId() => $_has(2);
  void clearCharacterId() => clearField(3);
}

class _ReadonlyRemoveCharacterFromSessionRequest extends RemoveCharacterFromSessionRequest with $pb.ReadonlyMessageMixin {}

class GetCharactersInSessionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('GetCharactersInSessionRequest')
    ..aOS(1, 'authIdToken')
    ..aOS(2, 'sessionId')
    ..hasRequiredFields = false
  ;

  GetCharactersInSessionRequest() : super();
  GetCharactersInSessionRequest.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetCharactersInSessionRequest.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetCharactersInSessionRequest clone() => new GetCharactersInSessionRequest()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static GetCharactersInSessionRequest create() => new GetCharactersInSessionRequest();
  static $pb.PbList<GetCharactersInSessionRequest> createRepeated() => new $pb.PbList<GetCharactersInSessionRequest>();
  static GetCharactersInSessionRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyGetCharactersInSessionRequest();
    return _defaultInstance;
  }
  static GetCharactersInSessionRequest _defaultInstance;
  static void $checkItem(GetCharactersInSessionRequest v) {
    if (v is! GetCharactersInSessionRequest) $pb.checkItemFailed(v, 'GetCharactersInSessionRequest');
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

class _ReadonlyGetCharactersInSessionRequest extends GetCharactersInSessionRequest with $pb.ReadonlyMessageMixin {}

class GetCharactersInSessionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('GetCharactersInSessionResponse')
    ..aOS(1, 'status')
    ..aOS(2, 'statusMessage')
    ..pp<LightCharacter>(3, 'lightCharacters', $pb.PbFieldType.PM, LightCharacter.$checkItem, LightCharacter.create)
    ..hasRequiredFields = false
  ;

  GetCharactersInSessionResponse() : super();
  GetCharactersInSessionResponse.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetCharactersInSessionResponse.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetCharactersInSessionResponse clone() => new GetCharactersInSessionResponse()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static GetCharactersInSessionResponse create() => new GetCharactersInSessionResponse();
  static $pb.PbList<GetCharactersInSessionResponse> createRepeated() => new $pb.PbList<GetCharactersInSessionResponse>();
  static GetCharactersInSessionResponse getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyGetCharactersInSessionResponse();
    return _defaultInstance;
  }
  static GetCharactersInSessionResponse _defaultInstance;
  static void $checkItem(GetCharactersInSessionResponse v) {
    if (v is! GetCharactersInSessionResponse) $pb.checkItemFailed(v, 'GetCharactersInSessionResponse');
  }

  String get status => $_getS(0, '');
  set status(String v) { $_setString(0, v); }
  bool hasStatus() => $_has(0);
  void clearStatus() => clearField(1);

  String get statusMessage => $_getS(1, '');
  set statusMessage(String v) { $_setString(1, v); }
  bool hasStatusMessage() => $_has(1);
  void clearStatusMessage() => clearField(2);

  List<LightCharacter> get lightCharacters => $_getList(2);
}

class _ReadonlyGetCharactersInSessionResponse extends GetCharactersInSessionResponse with $pb.ReadonlyMessageMixin {}

class ChangeReadyUpExpiryTimeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ChangeReadyUpExpiryTimeRequest')
    ..aOS(1, 'authIdToken')
    ..aOS(2, 'sessionId')
    ..a<int>(3, 'readyUpExpiryTime', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  ChangeReadyUpExpiryTimeRequest() : super();
  ChangeReadyUpExpiryTimeRequest.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ChangeReadyUpExpiryTimeRequest.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ChangeReadyUpExpiryTimeRequest clone() => new ChangeReadyUpExpiryTimeRequest()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static ChangeReadyUpExpiryTimeRequest create() => new ChangeReadyUpExpiryTimeRequest();
  static $pb.PbList<ChangeReadyUpExpiryTimeRequest> createRepeated() => new $pb.PbList<ChangeReadyUpExpiryTimeRequest>();
  static ChangeReadyUpExpiryTimeRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyChangeReadyUpExpiryTimeRequest();
    return _defaultInstance;
  }
  static ChangeReadyUpExpiryTimeRequest _defaultInstance;
  static void $checkItem(ChangeReadyUpExpiryTimeRequest v) {
    if (v is! ChangeReadyUpExpiryTimeRequest) $pb.checkItemFailed(v, 'ChangeReadyUpExpiryTimeRequest');
  }

  String get authIdToken => $_getS(0, '');
  set authIdToken(String v) { $_setString(0, v); }
  bool hasAuthIdToken() => $_has(0);
  void clearAuthIdToken() => clearField(1);

  String get sessionId => $_getS(1, '');
  set sessionId(String v) { $_setString(1, v); }
  bool hasSessionId() => $_has(1);
  void clearSessionId() => clearField(2);

  int get readyUpExpiryTime => $_get(2, 0);
  set readyUpExpiryTime(int v) { $_setUnsignedInt32(2, v); }
  bool hasReadyUpExpiryTime() => $_has(2);
  void clearReadyUpExpiryTime() => clearField(3);
}

class _ReadonlyChangeReadyUpExpiryTimeRequest extends ChangeReadyUpExpiryTimeRequest with $pb.ReadonlyMessageMixin {}

class ChangeReadyUpExpiryTimeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ChangeReadyUpExpiryTimeResponse')
    ..aOS(1, 'status')
    ..aOS(2, 'statusMessage')
    ..hasRequiredFields = false
  ;

  ChangeReadyUpExpiryTimeResponse() : super();
  ChangeReadyUpExpiryTimeResponse.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ChangeReadyUpExpiryTimeResponse.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ChangeReadyUpExpiryTimeResponse clone() => new ChangeReadyUpExpiryTimeResponse()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static ChangeReadyUpExpiryTimeResponse create() => new ChangeReadyUpExpiryTimeResponse();
  static $pb.PbList<ChangeReadyUpExpiryTimeResponse> createRepeated() => new $pb.PbList<ChangeReadyUpExpiryTimeResponse>();
  static ChangeReadyUpExpiryTimeResponse getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyChangeReadyUpExpiryTimeResponse();
    return _defaultInstance;
  }
  static ChangeReadyUpExpiryTimeResponse _defaultInstance;
  static void $checkItem(ChangeReadyUpExpiryTimeResponse v) {
    if (v is! ChangeReadyUpExpiryTimeResponse) $pb.checkItemFailed(v, 'ChangeReadyUpExpiryTimeResponse');
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

class _ReadonlyChangeReadyUpExpiryTimeResponse extends ChangeReadyUpExpiryTimeResponse with $pb.ReadonlyMessageMixin {}

class ChangeStateRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ChangeStateRequest')
    ..aOS(1, 'authIdToken')
    ..aOS(2, 'sessionId')
    ..aOS(3, 'state')
    ..hasRequiredFields = false
  ;

  ChangeStateRequest() : super();
  ChangeStateRequest.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ChangeStateRequest.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ChangeStateRequest clone() => new ChangeStateRequest()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static ChangeStateRequest create() => new ChangeStateRequest();
  static $pb.PbList<ChangeStateRequest> createRepeated() => new $pb.PbList<ChangeStateRequest>();
  static ChangeStateRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyChangeStateRequest();
    return _defaultInstance;
  }
  static ChangeStateRequest _defaultInstance;
  static void $checkItem(ChangeStateRequest v) {
    if (v is! ChangeStateRequest) $pb.checkItemFailed(v, 'ChangeStateRequest');
  }

  String get authIdToken => $_getS(0, '');
  set authIdToken(String v) { $_setString(0, v); }
  bool hasAuthIdToken() => $_has(0);
  void clearAuthIdToken() => clearField(1);

  String get sessionId => $_getS(1, '');
  set sessionId(String v) { $_setString(1, v); }
  bool hasSessionId() => $_has(1);
  void clearSessionId() => clearField(2);

  String get state => $_getS(2, '');
  set state(String v) { $_setString(2, v); }
  bool hasState() => $_has(2);
  void clearState() => clearField(3);
}

class _ReadonlyChangeStateRequest extends ChangeStateRequest with $pb.ReadonlyMessageMixin {}

class ReadyUpRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ReadyUpRequest')
    ..aOS(1, 'authIdToken')
    ..aOS(2, 'sessionId')
    ..hasRequiredFields = false
  ;

  ReadyUpRequest() : super();
  ReadyUpRequest.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ReadyUpRequest.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ReadyUpRequest clone() => new ReadyUpRequest()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static ReadyUpRequest create() => new ReadyUpRequest();
  static $pb.PbList<ReadyUpRequest> createRepeated() => new $pb.PbList<ReadyUpRequest>();
  static ReadyUpRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyReadyUpRequest();
    return _defaultInstance;
  }
  static ReadyUpRequest _defaultInstance;
  static void $checkItem(ReadyUpRequest v) {
    if (v is! ReadyUpRequest) $pb.checkItemFailed(v, 'ReadyUpRequest');
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

class _ReadonlyReadyUpRequest extends ReadyUpRequest with $pb.ReadonlyMessageMixin {}

class ReadyUpReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ReadyUpReply')
    ..aOS(1, 'status')
    ..aOS(2, 'statusMessage')
    ..hasRequiredFields = false
  ;

  ReadyUpReply() : super();
  ReadyUpReply.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ReadyUpReply.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ReadyUpReply clone() => new ReadyUpReply()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static ReadyUpReply create() => new ReadyUpReply();
  static $pb.PbList<ReadyUpReply> createRepeated() => new $pb.PbList<ReadyUpReply>();
  static ReadyUpReply getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyReadyUpReply();
    return _defaultInstance;
  }
  static ReadyUpReply _defaultInstance;
  static void $checkItem(ReadyUpReply v) {
    if (v is! ReadyUpReply) $pb.checkItemFailed(v, 'ReadyUpReply');
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

class _ReadonlyReadyUpReply extends ReadyUpReply with $pb.ReadonlyMessageMixin {}

class GetCharacterByIdRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('GetCharacterByIdRequest')
    ..aOS(1, 'authIdToken')
    ..aOS(2, 'characterId')
    ..hasRequiredFields = false
  ;

  GetCharacterByIdRequest() : super();
  GetCharacterByIdRequest.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetCharacterByIdRequest.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetCharacterByIdRequest clone() => new GetCharacterByIdRequest()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static GetCharacterByIdRequest create() => new GetCharacterByIdRequest();
  static $pb.PbList<GetCharacterByIdRequest> createRepeated() => new $pb.PbList<GetCharacterByIdRequest>();
  static GetCharacterByIdRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyGetCharacterByIdRequest();
    return _defaultInstance;
  }
  static GetCharacterByIdRequest _defaultInstance;
  static void $checkItem(GetCharacterByIdRequest v) {
    if (v is! GetCharacterByIdRequest) $pb.checkItemFailed(v, 'GetCharacterByIdRequest');
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

class _ReadonlyGetCharacterByIdRequest extends GetCharacterByIdRequest with $pb.ReadonlyMessageMixin {}

class DeleteCharacterRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('DeleteCharacterRequest')
    ..aOS(1, 'authIdToken')
    ..aOS(2, 'characterId')
    ..hasRequiredFields = false
  ;

  DeleteCharacterRequest() : super();
  DeleteCharacterRequest.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  DeleteCharacterRequest.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  DeleteCharacterRequest clone() => new DeleteCharacterRequest()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static DeleteCharacterRequest create() => new DeleteCharacterRequest();
  static $pb.PbList<DeleteCharacterRequest> createRepeated() => new $pb.PbList<DeleteCharacterRequest>();
  static DeleteCharacterRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyDeleteCharacterRequest();
    return _defaultInstance;
  }
  static DeleteCharacterRequest _defaultInstance;
  static void $checkItem(DeleteCharacterRequest v) {
    if (v is! DeleteCharacterRequest) $pb.checkItemFailed(v, 'DeleteCharacterRequest');
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

class _ReadonlyDeleteCharacterRequest extends DeleteCharacterRequest with $pb.ReadonlyMessageMixin {}

class UpdateCharacterRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('UpdateCharacterRequest')
    ..aOS(1, 'authIdToken')
    ..a<Character>(2, 'character', $pb.PbFieldType.OM, Character.getDefault, Character.create)
    ..hasRequiredFields = false
  ;

  UpdateCharacterRequest() : super();
  UpdateCharacterRequest.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  UpdateCharacterRequest.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  UpdateCharacterRequest clone() => new UpdateCharacterRequest()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static UpdateCharacterRequest create() => new UpdateCharacterRequest();
  static $pb.PbList<UpdateCharacterRequest> createRepeated() => new $pb.PbList<UpdateCharacterRequest>();
  static UpdateCharacterRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyUpdateCharacterRequest();
    return _defaultInstance;
  }
  static UpdateCharacterRequest _defaultInstance;
  static void $checkItem(UpdateCharacterRequest v) {
    if (v is! UpdateCharacterRequest) $pb.checkItemFailed(v, 'UpdateCharacterRequest');
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

class _ReadonlyUpdateCharacterRequest extends UpdateCharacterRequest with $pb.ReadonlyMessageMixin {}

class GetCharactersRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('GetCharactersRequest')
    ..aOS(1, 'authIdToken')
    ..a<int>(2, 'limit', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  GetCharactersRequest() : super();
  GetCharactersRequest.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetCharactersRequest.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetCharactersRequest clone() => new GetCharactersRequest()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static GetCharactersRequest create() => new GetCharactersRequest();
  static $pb.PbList<GetCharactersRequest> createRepeated() => new $pb.PbList<GetCharactersRequest>();
  static GetCharactersRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyGetCharactersRequest();
    return _defaultInstance;
  }
  static GetCharactersRequest _defaultInstance;
  static void $checkItem(GetCharactersRequest v) {
    if (v is! GetCharactersRequest) $pb.checkItemFailed(v, 'GetCharactersRequest');
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

class _ReadonlyGetCharactersRequest extends GetCharactersRequest with $pb.ReadonlyMessageMixin {}

class GetCharactersReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('GetCharactersReply')
    ..aOS(1, 'status')
    ..aOS(2, 'statusMessage')
    ..pp<LightCharacter>(3, 'lightCharacters', $pb.PbFieldType.PM, LightCharacter.$checkItem, LightCharacter.create)
    ..hasRequiredFields = false
  ;

  GetCharactersReply() : super();
  GetCharactersReply.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetCharactersReply.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetCharactersReply clone() => new GetCharactersReply()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static GetCharactersReply create() => new GetCharactersReply();
  static $pb.PbList<GetCharactersReply> createRepeated() => new $pb.PbList<GetCharactersReply>();
  static GetCharactersReply getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyGetCharactersReply();
    return _defaultInstance;
  }
  static GetCharactersReply _defaultInstance;
  static void $checkItem(GetCharactersReply v) {
    if (v is! GetCharactersReply) $pb.checkItemFailed(v, 'GetCharactersReply');
  }

  String get status => $_getS(0, '');
  set status(String v) { $_setString(0, v); }
  bool hasStatus() => $_has(0);
  void clearStatus() => clearField(1);

  String get statusMessage => $_getS(1, '');
  set statusMessage(String v) { $_setString(1, v); }
  bool hasStatusMessage() => $_has(1);
  void clearStatusMessage() => clearField(2);

  List<LightCharacter> get lightCharacters => $_getList(2);
}

class _ReadonlyGetCharactersReply extends GetCharactersReply with $pb.ReadonlyMessageMixin {}

class GetSessionsOfUserRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('GetSessionsOfUserRequest')
    ..aOS(1, 'authIdToken')
    ..a<int>(2, 'limit', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  GetSessionsOfUserRequest() : super();
  GetSessionsOfUserRequest.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetSessionsOfUserRequest.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetSessionsOfUserRequest clone() => new GetSessionsOfUserRequest()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static GetSessionsOfUserRequest create() => new GetSessionsOfUserRequest();
  static $pb.PbList<GetSessionsOfUserRequest> createRepeated() => new $pb.PbList<GetSessionsOfUserRequest>();
  static GetSessionsOfUserRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyGetSessionsOfUserRequest();
    return _defaultInstance;
  }
  static GetSessionsOfUserRequest _defaultInstance;
  static void $checkItem(GetSessionsOfUserRequest v) {
    if (v is! GetSessionsOfUserRequest) $pb.checkItemFailed(v, 'GetSessionsOfUserRequest');
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

class _ReadonlyGetSessionsOfUserRequest extends GetSessionsOfUserRequest with $pb.ReadonlyMessageMixin {}

class GetSessionsOfUserReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('GetSessionsOfUserReply')
    ..aOS(1, 'status')
    ..aOS(2, 'statusMessage')
    ..pp<LightSession>(3, 'lightSessions', $pb.PbFieldType.PM, LightSession.$checkItem, LightSession.create)
    ..hasRequiredFields = false
  ;

  GetSessionsOfUserReply() : super();
  GetSessionsOfUserReply.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetSessionsOfUserReply.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetSessionsOfUserReply clone() => new GetSessionsOfUserReply()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static GetSessionsOfUserReply create() => new GetSessionsOfUserReply();
  static $pb.PbList<GetSessionsOfUserReply> createRepeated() => new $pb.PbList<GetSessionsOfUserReply>();
  static GetSessionsOfUserReply getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyGetSessionsOfUserReply();
    return _defaultInstance;
  }
  static GetSessionsOfUserReply _defaultInstance;
  static void $checkItem(GetSessionsOfUserReply v) {
    if (v is! GetSessionsOfUserReply) $pb.checkItemFailed(v, 'GetSessionsOfUserReply');
  }

  String get status => $_getS(0, '');
  set status(String v) { $_setString(0, v); }
  bool hasStatus() => $_has(0);
  void clearStatus() => clearField(1);

  String get statusMessage => $_getS(1, '');
  set statusMessage(String v) { $_setString(1, v); }
  bool hasStatusMessage() => $_has(1);
  void clearStatusMessage() => clearField(2);

  List<LightSession> get lightSessions => $_getList(2);
}

class _ReadonlyGetSessionsOfUserReply extends GetSessionsOfUserReply with $pb.ReadonlyMessageMixin {}

class GetSessionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('GetSessionRequest')
    ..aOS(1, 'authIdToken')
    ..aOS(2, 'sessionId')
    ..hasRequiredFields = false
  ;

  GetSessionRequest() : super();
  GetSessionRequest.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  GetSessionRequest.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  GetSessionRequest clone() => new GetSessionRequest()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static GetSessionRequest create() => new GetSessionRequest();
  static $pb.PbList<GetSessionRequest> createRepeated() => new $pb.PbList<GetSessionRequest>();
  static GetSessionRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyGetSessionRequest();
    return _defaultInstance;
  }
  static GetSessionRequest _defaultInstance;
  static void $checkItem(GetSessionRequest v) {
    if (v is! GetSessionRequest) $pb.checkItemFailed(v, 'GetSessionRequest');
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

class _ReadonlyGetSessionRequest extends GetSessionRequest with $pb.ReadonlyMessageMixin {}

class NewSessionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('NewSessionRequest')
    ..aOS(1, 'authIdToken')
    ..aOS(2, 'name')
    ..a<int>(3, 'maxPlayers', $pb.PbFieldType.OU3)
    ..aOB(4, 'private')
    ..hasRequiredFields = false
  ;

  NewSessionRequest() : super();
  NewSessionRequest.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  NewSessionRequest.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  NewSessionRequest clone() => new NewSessionRequest()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static NewSessionRequest create() => new NewSessionRequest();
  static $pb.PbList<NewSessionRequest> createRepeated() => new $pb.PbList<NewSessionRequest>();
  static NewSessionRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyNewSessionRequest();
    return _defaultInstance;
  }
  static NewSessionRequest _defaultInstance;
  static void $checkItem(NewSessionRequest v) {
    if (v is! NewSessionRequest) $pb.checkItemFailed(v, 'NewSessionRequest');
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

class _ReadonlyNewSessionRequest extends NewSessionRequest with $pb.ReadonlyMessageMixin {}

class ListRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ListRequest')
    ..aOS(1, 'authIdToken')
    ..a<int>(2, 'limit', $pb.PbFieldType.OU3)
    ..aOB(3, 'full')
    ..hasRequiredFields = false
  ;

  ListRequest() : super();
  ListRequest.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ListRequest.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ListRequest clone() => new ListRequest()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static ListRequest create() => new ListRequest();
  static $pb.PbList<ListRequest> createRepeated() => new $pb.PbList<ListRequest>();
  static ListRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyListRequest();
    return _defaultInstance;
  }
  static ListRequest _defaultInstance;
  static void $checkItem(ListRequest v) {
    if (v is! ListRequest) $pb.checkItemFailed(v, 'ListRequest');
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

class _ReadonlyListRequest extends ListRequest with $pb.ReadonlyMessageMixin {}

class LeaveRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('LeaveRequest')
    ..aOS(1, 'authIdToken')
    ..aOS(2, 'sessionId')
    ..hasRequiredFields = false
  ;

  LeaveRequest() : super();
  LeaveRequest.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  LeaveRequest.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  LeaveRequest clone() => new LeaveRequest()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static LeaveRequest create() => new LeaveRequest();
  static $pb.PbList<LeaveRequest> createRepeated() => new $pb.PbList<LeaveRequest>();
  static LeaveRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyLeaveRequest();
    return _defaultInstance;
  }
  static LeaveRequest _defaultInstance;
  static void $checkItem(LeaveRequest v) {
    if (v is! LeaveRequest) $pb.checkItemFailed(v, 'LeaveRequest');
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

class _ReadonlyLeaveRequest extends LeaveRequest with $pb.ReadonlyMessageMixin {}

class JoinRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('JoinRequest')
    ..aOS(1, 'authIdToken')
    ..aOS(2, 'sessionId')
    ..hasRequiredFields = false
  ;

  JoinRequest() : super();
  JoinRequest.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  JoinRequest.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  JoinRequest clone() => new JoinRequest()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static JoinRequest create() => new JoinRequest();
  static $pb.PbList<JoinRequest> createRepeated() => new $pb.PbList<JoinRequest>();
  static JoinRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyJoinRequest();
    return _defaultInstance;
  }
  static JoinRequest _defaultInstance;
  static void $checkItem(JoinRequest v) {
    if (v is! JoinRequest) $pb.checkItemFailed(v, 'JoinRequest');
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

class _ReadonlyJoinRequest extends JoinRequest with $pb.ReadonlyMessageMixin {}

class KickPlayerRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('KickPlayerRequest')
    ..aOS(1, 'authIdToken')
    ..aOS(2, 'sessionId')
    ..a<User>(3, 'user', $pb.PbFieldType.OM, User.getDefault, User.create)
    ..hasRequiredFields = false
  ;

  KickPlayerRequest() : super();
  KickPlayerRequest.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  KickPlayerRequest.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  KickPlayerRequest clone() => new KickPlayerRequest()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static KickPlayerRequest create() => new KickPlayerRequest();
  static $pb.PbList<KickPlayerRequest> createRepeated() => new $pb.PbList<KickPlayerRequest>();
  static KickPlayerRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyKickPlayerRequest();
    return _defaultInstance;
  }
  static KickPlayerRequest _defaultInstance;
  static void $checkItem(KickPlayerRequest v) {
    if (v is! KickPlayerRequest) $pb.checkItemFailed(v, 'KickPlayerRequest');
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

class _ReadonlyKickPlayerRequest extends KickPlayerRequest with $pb.ReadonlyMessageMixin {}

class SetPrivateRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('SetPrivateRequest')
    ..aOS(1, 'authIdToken')
    ..aOS(2, 'sessionId')
    ..aOB(3, 'private')
    ..hasRequiredFields = false
  ;

  SetPrivateRequest() : super();
  SetPrivateRequest.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  SetPrivateRequest.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  SetPrivateRequest clone() => new SetPrivateRequest()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static SetPrivateRequest create() => new SetPrivateRequest();
  static $pb.PbList<SetPrivateRequest> createRepeated() => new $pb.PbList<SetPrivateRequest>();
  static SetPrivateRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlySetPrivateRequest();
    return _defaultInstance;
  }
  static SetPrivateRequest _defaultInstance;
  static void $checkItem(SetPrivateRequest v) {
    if (v is! SetPrivateRequest) $pb.checkItemFailed(v, 'SetPrivateRequest');
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

class _ReadonlySetPrivateRequest extends SetPrivateRequest with $pb.ReadonlyMessageMixin {}

class SetMaxPlayersRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('SetMaxPlayersRequest')
    ..aOS(1, 'authIdToken')
    ..a<int>(2, 'number', $pb.PbFieldType.OU3)
    ..aOS(3, 'sessionId')
    ..hasRequiredFields = false
  ;

  SetMaxPlayersRequest() : super();
  SetMaxPlayersRequest.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  SetMaxPlayersRequest.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  SetMaxPlayersRequest clone() => new SetMaxPlayersRequest()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static SetMaxPlayersRequest create() => new SetMaxPlayersRequest();
  static $pb.PbList<SetMaxPlayersRequest> createRepeated() => new $pb.PbList<SetMaxPlayersRequest>();
  static SetMaxPlayersRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlySetMaxPlayersRequest();
    return _defaultInstance;
  }
  static SetMaxPlayersRequest _defaultInstance;
  static void $checkItem(SetMaxPlayersRequest v) {
    if (v is! SetMaxPlayersRequest) $pb.checkItemFailed(v, 'SetMaxPlayersRequest');
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

class _ReadonlySetMaxPlayersRequest extends SetMaxPlayersRequest with $pb.ReadonlyMessageMixin {}

class SetNameRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('SetNameRequest')
    ..aOS(1, 'authIdToken')
    ..aOS(2, 'sessionId')
    ..aOS(3, 'name')
    ..hasRequiredFields = false
  ;

  SetNameRequest() : super();
  SetNameRequest.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  SetNameRequest.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  SetNameRequest clone() => new SetNameRequest()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static SetNameRequest create() => new SetNameRequest();
  static $pb.PbList<SetNameRequest> createRepeated() => new $pb.PbList<SetNameRequest>();
  static SetNameRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlySetNameRequest();
    return _defaultInstance;
  }
  static SetNameRequest _defaultInstance;
  static void $checkItem(SetNameRequest v) {
    if (v is! SetNameRequest) $pb.checkItemFailed(v, 'SetNameRequest');
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

class _ReadonlySetNameRequest extends SetNameRequest with $pb.ReadonlyMessageMixin {}

class ListReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ListReply')
    ..pp<Session>(1, 'sessions', $pb.PbFieldType.PM, Session.$checkItem, Session.create)
    ..aOS(2, 'status')
    ..aOS(3, 'statusMessage')
    ..hasRequiredFields = false
  ;

  ListReply() : super();
  ListReply.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ListReply.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ListReply clone() => new ListReply()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static ListReply create() => new ListReply();
  static $pb.PbList<ListReply> createRepeated() => new $pb.PbList<ListReply>();
  static ListReply getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyListReply();
    return _defaultInstance;
  }
  static ListReply _defaultInstance;
  static void $checkItem(ListReply v) {
    if (v is! ListReply) $pb.checkItemFailed(v, 'ListReply');
  }

  List<Session> get sessions => $_getList(0);

  String get status => $_getS(1, '');
  set status(String v) { $_setString(1, v); }
  bool hasStatus() => $_has(1);
  void clearStatus() => clearField(2);

  String get statusMessage => $_getS(2, '');
  set statusMessage(String v) { $_setString(2, v); }
  bool hasStatusMessage() => $_has(2);
  void clearStatusMessage() => clearField(3);
}

class _ReadonlyListReply extends ListReply with $pb.ReadonlyMessageMixin {}

class LeaveReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('LeaveReply')
    ..aOS(1, 'status')
    ..aOS(2, 'statusMessage')
    ..hasRequiredFields = false
  ;

  LeaveReply() : super();
  LeaveReply.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  LeaveReply.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  LeaveReply clone() => new LeaveReply()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static LeaveReply create() => new LeaveReply();
  static $pb.PbList<LeaveReply> createRepeated() => new $pb.PbList<LeaveReply>();
  static LeaveReply getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyLeaveReply();
    return _defaultInstance;
  }
  static LeaveReply _defaultInstance;
  static void $checkItem(LeaveReply v) {
    if (v is! LeaveReply) $pb.checkItemFailed(v, 'LeaveReply');
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

class _ReadonlyLeaveReply extends LeaveReply with $pb.ReadonlyMessageMixin {}

class User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('User')
    ..aOS(1, 'uid')
    ..aOS(2, 'name')
    ..aOB(3, 'readyInThisSession')
    ..aOB(4, 'online')
    ..hasRequiredFields = false
  ;

  User() : super();
  User.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  User.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  User clone() => new User()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static User create() => new User();
  static $pb.PbList<User> createRepeated() => new $pb.PbList<User>();
  static User getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyUser();
    return _defaultInstance;
  }
  static User _defaultInstance;
  static void $checkItem(User v) {
    if (v is! User) $pb.checkItemFailed(v, 'User');
  }

  String get uid => $_getS(0, '');
  set uid(String v) { $_setString(0, v); }
  bool hasUid() => $_has(0);
  void clearUid() => clearField(1);

  String get name => $_getS(1, '');
  set name(String v) { $_setString(1, v); }
  bool hasName() => $_has(1);
  void clearName() => clearField(2);

  bool get readyInThisSession => $_get(2, false);
  set readyInThisSession(bool v) { $_setBool(2, v); }
  bool hasReadyInThisSession() => $_has(2);
  void clearReadyInThisSession() => clearField(3);

  bool get online => $_get(3, false);
  set online(bool v) { $_setBool(3, v); }
  bool hasOnline() => $_has(3);
  void clearOnline() => clearField(4);
}

class _ReadonlyUser extends User with $pb.ReadonlyMessageMixin {}

class NewCharacterRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('NewCharacterRequest')
    ..aOS(1, 'authIdToken')
    ..a<Character>(2, 'character', $pb.PbFieldType.OM, Character.getDefault, Character.create)
    ..hasRequiredFields = false
  ;

  NewCharacterRequest() : super();
  NewCharacterRequest.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  NewCharacterRequest.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  NewCharacterRequest clone() => new NewCharacterRequest()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static NewCharacterRequest create() => new NewCharacterRequest();
  static $pb.PbList<NewCharacterRequest> createRepeated() => new $pb.PbList<NewCharacterRequest>();
  static NewCharacterRequest getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyNewCharacterRequest();
    return _defaultInstance;
  }
  static NewCharacterRequest _defaultInstance;
  static void $checkItem(NewCharacterRequest v) {
    if (v is! NewCharacterRequest) $pb.checkItemFailed(v, 'NewCharacterRequest');
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

class _ReadonlyNewCharacterRequest extends NewCharacterRequest with $pb.ReadonlyMessageMixin {}

class DeleteCharacterReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('DeleteCharacterReply')
    ..aOS(1, 'status')
    ..aOS(2, 'statusMessage')
    ..hasRequiredFields = false
  ;

  DeleteCharacterReply() : super();
  DeleteCharacterReply.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  DeleteCharacterReply.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  DeleteCharacterReply clone() => new DeleteCharacterReply()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static DeleteCharacterReply create() => new DeleteCharacterReply();
  static $pb.PbList<DeleteCharacterReply> createRepeated() => new $pb.PbList<DeleteCharacterReply>();
  static DeleteCharacterReply getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyDeleteCharacterReply();
    return _defaultInstance;
  }
  static DeleteCharacterReply _defaultInstance;
  static void $checkItem(DeleteCharacterReply v) {
    if (v is! DeleteCharacterReply) $pb.checkItemFailed(v, 'DeleteCharacterReply');
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

class _ReadonlyDeleteCharacterReply extends DeleteCharacterReply with $pb.ReadonlyMessageMixin {}

class LightSession extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('LightSession')
    ..aOS(1, 'status')
    ..aOS(2, 'statusMessage')
    ..aOS(3, 'sessionId')
    ..aOS(4, 'name')
    ..a<User>(5, 'dungeonMaster', $pb.PbFieldType.OM, User.getDefault, User.create)
    ..aOS(6, 'lastUpdated')
    ..aOS(7, 'state')
    ..hasRequiredFields = false
  ;

  LightSession() : super();
  LightSession.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  LightSession.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  LightSession clone() => new LightSession()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static LightSession create() => new LightSession();
  static $pb.PbList<LightSession> createRepeated() => new $pb.PbList<LightSession>();
  static LightSession getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyLightSession();
    return _defaultInstance;
  }
  static LightSession _defaultInstance;
  static void $checkItem(LightSession v) {
    if (v is! LightSession) $pb.checkItemFailed(v, 'LightSession');
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

  String get lastUpdated => $_getS(5, '');
  set lastUpdated(String v) { $_setString(5, v); }
  bool hasLastUpdated() => $_has(5);
  void clearLastUpdated() => clearField(6);

  String get state => $_getS(6, '');
  set state(String v) { $_setString(6, v); }
  bool hasState() => $_has(6);
  void clearState() => clearField(7);
}

class _ReadonlyLightSession extends LightSession with $pb.ReadonlyMessageMixin {}

class Session extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Session')
    ..aOS(1, 'status')
    ..aOS(2, 'statusMessage')
    ..aOS(3, 'sessionId')
    ..aOS(4, 'name')
    ..a<User>(5, 'dungeonMaster', $pb.PbFieldType.OM, User.getDefault, User.create)
    ..aOS(6, 'dateCreated')
    ..a<int>(7, 'maxPlayers', $pb.PbFieldType.OU3)
    ..pp<User>(8, 'users', $pb.PbFieldType.PM, User.$checkItem, User.create)
    ..aOB(9, 'private')
    ..aOB(10, 'full')
    ..aOS(11, 'state')
    ..a<int>(12, 'stateMeta', $pb.PbFieldType.OU3)
    ..aOS(13, 'stateReadyStartTime')
    ..pp<User>(14, 'readyUsers', $pb.PbFieldType.PM, User.$checkItem, User.create)
    ..aOS(15, 'lastUpdated')
    ..a<int>(16, 'readyUpExpiryTime', $pb.PbFieldType.OU3)
    ..pp<LightCharacter>(17, 'charactersInSession', $pb.PbFieldType.PM, LightCharacter.$checkItem, LightCharacter.create)
    ..hasRequiredFields = false
  ;

  Session() : super();
  Session.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Session.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Session clone() => new Session()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static Session create() => new Session();
  static $pb.PbList<Session> createRepeated() => new $pb.PbList<Session>();
  static Session getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlySession();
    return _defaultInstance;
  }
  static Session _defaultInstance;
  static void $checkItem(Session v) {
    if (v is! Session) $pb.checkItemFailed(v, 'Session');
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

  String get state => $_getS(10, '');
  set state(String v) { $_setString(10, v); }
  bool hasState() => $_has(10);
  void clearState() => clearField(11);

  int get stateMeta => $_get(11, 0);
  set stateMeta(int v) { $_setUnsignedInt32(11, v); }
  bool hasStateMeta() => $_has(11);
  void clearStateMeta() => clearField(12);

  String get stateReadyStartTime => $_getS(12, '');
  set stateReadyStartTime(String v) { $_setString(12, v); }
  bool hasStateReadyStartTime() => $_has(12);
  void clearStateReadyStartTime() => clearField(13);

  List<User> get readyUsers => $_getList(13);

  String get lastUpdated => $_getS(14, '');
  set lastUpdated(String v) { $_setString(14, v); }
  bool hasLastUpdated() => $_has(14);
  void clearLastUpdated() => clearField(15);

  int get readyUpExpiryTime => $_get(15, 0);
  set readyUpExpiryTime(int v) { $_setUnsignedInt32(15, v); }
  bool hasReadyUpExpiryTime() => $_has(15);
  void clearReadyUpExpiryTime() => clearField(16);

  List<LightCharacter> get charactersInSession => $_getList(16);
}

class _ReadonlySession extends Session with $pb.ReadonlyMessageMixin {}

class LightCharacter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('LightCharacter')
    ..aOS(1, 'characterId')
    ..aOS(2, 'creatorId')
    ..aOS(3, 'name')
    ..a<int>(4, 'xp', $pb.PbFieldType.OS3)
    ..aOS(5, 'gender')
    ..aOS(6, 'race')
    ..aOS(7, 'characterClass')
    ..a<Hitpoints>(8, 'hitpoints', $pb.PbFieldType.OM, Hitpoints.getDefault, Hitpoints.create)
    ..aOS(9, 'lastUpdated')
    ..aOS(10, 'sessionId')
    ..hasRequiredFields = false
  ;

  LightCharacter() : super();
  LightCharacter.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  LightCharacter.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  LightCharacter clone() => new LightCharacter()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static LightCharacter create() => new LightCharacter();
  static $pb.PbList<LightCharacter> createRepeated() => new $pb.PbList<LightCharacter>();
  static LightCharacter getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyLightCharacter();
    return _defaultInstance;
  }
  static LightCharacter _defaultInstance;
  static void $checkItem(LightCharacter v) {
    if (v is! LightCharacter) $pb.checkItemFailed(v, 'LightCharacter');
  }

  String get characterId => $_getS(0, '');
  set characterId(String v) { $_setString(0, v); }
  bool hasCharacterId() => $_has(0);
  void clearCharacterId() => clearField(1);

  String get creatorId => $_getS(1, '');
  set creatorId(String v) { $_setString(1, v); }
  bool hasCreatorId() => $_has(1);
  void clearCreatorId() => clearField(2);

  String get name => $_getS(2, '');
  set name(String v) { $_setString(2, v); }
  bool hasName() => $_has(2);
  void clearName() => clearField(3);

  int get xp => $_get(3, 0);
  set xp(int v) { $_setSignedInt32(3, v); }
  bool hasXp() => $_has(3);
  void clearXp() => clearField(4);

  String get gender => $_getS(4, '');
  set gender(String v) { $_setString(4, v); }
  bool hasGender() => $_has(4);
  void clearGender() => clearField(5);

  String get race => $_getS(5, '');
  set race(String v) { $_setString(5, v); }
  bool hasRace() => $_has(5);
  void clearRace() => clearField(6);

  String get characterClass => $_getS(6, '');
  set characterClass(String v) { $_setString(6, v); }
  bool hasCharacterClass() => $_has(6);
  void clearCharacterClass() => clearField(7);

  Hitpoints get hitpoints => $_getN(7);
  set hitpoints(Hitpoints v) { setField(8, v); }
  bool hasHitpoints() => $_has(7);
  void clearHitpoints() => clearField(8);

  String get lastUpdated => $_getS(8, '');
  set lastUpdated(String v) { $_setString(8, v); }
  bool hasLastUpdated() => $_has(8);
  void clearLastUpdated() => clearField(9);

  String get sessionId => $_getS(9, '');
  set sessionId(String v) { $_setString(9, v); }
  bool hasSessionId() => $_has(9);
  void clearSessionId() => clearField(10);
}

class _ReadonlyLightCharacter extends LightCharacter with $pb.ReadonlyMessageMixin {}

class Character extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Character')
    ..aOS(1, 'characterId')
    ..a<User>(2, 'creator', $pb.PbFieldType.OM, User.getDefault, User.create)
    ..aOS(3, 'name')
    ..a<int>(4, 'strength', $pb.PbFieldType.OS3)
    ..a<int>(5, 'strengthSubscript', $pb.PbFieldType.OS3)
    ..a<int>(6, 'dexterity', $pb.PbFieldType.OS3)
    ..a<int>(7, 'dexteritySubscript', $pb.PbFieldType.OS3)
    ..a<int>(8, 'constitution', $pb.PbFieldType.OS3)
    ..a<int>(9, 'constitutionSubscript', $pb.PbFieldType.OS3)
    ..a<int>(10, 'intelligence', $pb.PbFieldType.OS3)
    ..a<int>(11, 'intelligenceSubscript', $pb.PbFieldType.OS3)
    ..a<int>(12, 'wisdom', $pb.PbFieldType.OS3)
    ..a<int>(13, 'wisdomSubscript', $pb.PbFieldType.OS3)
    ..a<int>(14, 'charisma', $pb.PbFieldType.OS3)
    ..a<int>(15, 'charismaSubscript', $pb.PbFieldType.OS3)
    ..aOS(16, 'characterClass')
    ..aOS(17, 'race')
    ..a<int>(18, 'xp', $pb.PbFieldType.OS3)
    ..aOS(19, 'alignment')
    ..aOS(20, 'background')
    ..a<int>(21, 'inspiration', $pb.PbFieldType.OS3)
    ..a<int>(22, 'proficiencyBonus', $pb.PbFieldType.OS3)
    ..a<Skills>(23, 'skills', $pb.PbFieldType.OM, Skills.getDefault, Skills.create)
    ..a<int>(24, 'passiveWisdom', $pb.PbFieldType.OS3)
    ..a<Attacks_Spellcasting>(25, 'attacksSpellcasting', $pb.PbFieldType.OM, Attacks_Spellcasting.getDefault, Attacks_Spellcasting.create)
    ..a<Hitpoints>(26, 'hitpoints', $pb.PbFieldType.OM, Hitpoints.getDefault, Hitpoints.create)
    ..aOS(27, 'personalityTraits')
    ..aOS(28, 'ideals')
    ..aOS(29, 'bonds')
    ..aOS(30, 'flaws')
    ..aOS(31, 'dateCreated')
    ..aOS(32, 'status')
    ..aOS(33, 'statusMessage')
    ..pp<Equipment>(34, 'equipment', $pb.PbFieldType.PM, Equipment.$checkItem, Equipment.create)
    ..aOS(35, 'sessionId')
    ..aOS(36, 'featuresAndTraits')
    ..a<int>(37, 'level', $pb.PbFieldType.OU3)
    ..aOS(38, 'gender')
    ..aOS(39, 'lastUpdated')
    ..hasRequiredFields = false
  ;

  Character() : super();
  Character.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Character.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Character clone() => new Character()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static Character create() => new Character();
  static $pb.PbList<Character> createRepeated() => new $pb.PbList<Character>();
  static Character getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyCharacter();
    return _defaultInstance;
  }
  static Character _defaultInstance;
  static void $checkItem(Character v) {
    if (v is! Character) $pb.checkItemFailed(v, 'Character');
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

  Skills get skills => $_getN(22);
  set skills(Skills v) { setField(23, v); }
  bool hasSkills() => $_has(22);
  void clearSkills() => clearField(23);

  int get passiveWisdom => $_get(23, 0);
  set passiveWisdom(int v) { $_setSignedInt32(23, v); }
  bool hasPassiveWisdom() => $_has(23);
  void clearPassiveWisdom() => clearField(24);

  Attacks_Spellcasting get attacksSpellcasting => $_getN(24);
  set attacksSpellcasting(Attacks_Spellcasting v) { setField(25, v); }
  bool hasAttacksSpellcasting() => $_has(24);
  void clearAttacksSpellcasting() => clearField(25);

  Hitpoints get hitpoints => $_getN(25);
  set hitpoints(Hitpoints v) { setField(26, v); }
  bool hasHitpoints() => $_has(25);
  void clearHitpoints() => clearField(26);

  String get personalityTraits => $_getS(26, '');
  set personalityTraits(String v) { $_setString(26, v); }
  bool hasPersonalityTraits() => $_has(26);
  void clearPersonalityTraits() => clearField(27);

  String get ideals => $_getS(27, '');
  set ideals(String v) { $_setString(27, v); }
  bool hasIdeals() => $_has(27);
  void clearIdeals() => clearField(28);

  String get bonds => $_getS(28, '');
  set bonds(String v) { $_setString(28, v); }
  bool hasBonds() => $_has(28);
  void clearBonds() => clearField(29);

  String get flaws => $_getS(29, '');
  set flaws(String v) { $_setString(29, v); }
  bool hasFlaws() => $_has(29);
  void clearFlaws() => clearField(30);

  String get dateCreated => $_getS(30, '');
  set dateCreated(String v) { $_setString(30, v); }
  bool hasDateCreated() => $_has(30);
  void clearDateCreated() => clearField(31);

  String get status => $_getS(31, '');
  set status(String v) { $_setString(31, v); }
  bool hasStatus() => $_has(31);
  void clearStatus() => clearField(32);

  String get statusMessage => $_getS(32, '');
  set statusMessage(String v) { $_setString(32, v); }
  bool hasStatusMessage() => $_has(32);
  void clearStatusMessage() => clearField(33);

  List<Equipment> get equipment => $_getList(33);

  String get sessionId => $_getS(34, '');
  set sessionId(String v) { $_setString(34, v); }
  bool hasSessionId() => $_has(34);
  void clearSessionId() => clearField(35);

  String get featuresAndTraits => $_getS(35, '');
  set featuresAndTraits(String v) { $_setString(35, v); }
  bool hasFeaturesAndTraits() => $_has(35);
  void clearFeaturesAndTraits() => clearField(36);

  int get level => $_get(36, 0);
  set level(int v) { $_setUnsignedInt32(36, v); }
  bool hasLevel() => $_has(36);
  void clearLevel() => clearField(37);

  String get gender => $_getS(37, '');
  set gender(String v) { $_setString(37, v); }
  bool hasGender() => $_has(37);
  void clearGender() => clearField(38);

  String get lastUpdated => $_getS(38, '');
  set lastUpdated(String v) { $_setString(38, v); }
  bool hasLastUpdated() => $_has(38);
  void clearLastUpdated() => clearField(39);
}

class _ReadonlyCharacter extends Character with $pb.ReadonlyMessageMixin {}

class Skills extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Skills')
    ..a<int>(1, 'acrobatics', $pb.PbFieldType.OS3)
    ..aOB(2, 'acrobaticsProficient')
    ..a<int>(3, 'animalHandling', $pb.PbFieldType.OS3)
    ..aOB(4, 'animalHandlingProficient')
    ..a<int>(5, 'arcana', $pb.PbFieldType.OS3)
    ..aOB(6, 'arcanaProficient')
    ..a<int>(7, 'athletics', $pb.PbFieldType.OS3)
    ..aOB(8, 'athleticsProficient')
    ..a<int>(9, 'deception', $pb.PbFieldType.OS3)
    ..aOB(10, 'deceptionProficient')
    ..a<int>(11, 'history', $pb.PbFieldType.OS3)
    ..aOB(12, 'historyProficient')
    ..a<int>(13, 'insight', $pb.PbFieldType.OS3)
    ..aOB(14, 'insightProficient')
    ..a<int>(15, 'intimidation', $pb.PbFieldType.OS3)
    ..aOB(16, 'intimidationProficient')
    ..a<int>(17, 'investigation', $pb.PbFieldType.OS3)
    ..aOB(18, 'investigationProficient')
    ..a<int>(19, 'medicine', $pb.PbFieldType.OS3)
    ..aOB(20, 'medicineProficient')
    ..a<int>(21, 'nature', $pb.PbFieldType.OS3)
    ..aOB(22, 'natureProficient')
    ..a<int>(23, 'perception', $pb.PbFieldType.OS3)
    ..aOB(24, 'perceptionProficient')
    ..a<int>(25, 'performance', $pb.PbFieldType.OS3)
    ..aOB(26, 'performanceProficient')
    ..a<int>(27, 'persuasion', $pb.PbFieldType.OS3)
    ..aOB(28, 'persuasionProficient')
    ..a<int>(29, 'religion', $pb.PbFieldType.OS3)
    ..aOB(30, 'religionProficient')
    ..a<int>(31, 'sleightOfHand', $pb.PbFieldType.OS3)
    ..aOB(32, 'sleightOfHandProficient')
    ..a<int>(33, 'stealth', $pb.PbFieldType.OS3)
    ..aOB(34, 'stealthProficient')
    ..a<int>(35, 'survival', $pb.PbFieldType.OS3)
    ..aOB(36, 'survivalProficient')
    ..hasRequiredFields = false
  ;

  Skills() : super();
  Skills.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Skills.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Skills clone() => new Skills()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static Skills create() => new Skills();
  static $pb.PbList<Skills> createRepeated() => new $pb.PbList<Skills>();
  static Skills getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlySkills();
    return _defaultInstance;
  }
  static Skills _defaultInstance;
  static void $checkItem(Skills v) {
    if (v is! Skills) $pb.checkItemFailed(v, 'Skills');
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

class _ReadonlySkills extends Skills with $pb.ReadonlyMessageMixin {}

class Attacks_Spellcasting extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Attacks_Spellcasting')
    ..aOS(1, 'name1')
    ..aOS(2, 'name2')
    ..aOS(3, 'name3')
    ..a<int>(4, 'atkBonus1', $pb.PbFieldType.OS3)
    ..a<int>(5, 'atkBonus2', $pb.PbFieldType.OS3)
    ..a<int>(6, 'atkBonus3', $pb.PbFieldType.OS3)
    ..aOS(7, 'damageType1')
    ..aOS(8, 'damageType2')
    ..aOS(9, 'damageType3')
    ..hasRequiredFields = false
  ;

  Attacks_Spellcasting() : super();
  Attacks_Spellcasting.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Attacks_Spellcasting.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Attacks_Spellcasting clone() => new Attacks_Spellcasting()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static Attacks_Spellcasting create() => new Attacks_Spellcasting();
  static $pb.PbList<Attacks_Spellcasting> createRepeated() => new $pb.PbList<Attacks_Spellcasting>();
  static Attacks_Spellcasting getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyAttacks_Spellcasting();
    return _defaultInstance;
  }
  static Attacks_Spellcasting _defaultInstance;
  static void $checkItem(Attacks_Spellcasting v) {
    if (v is! Attacks_Spellcasting) $pb.checkItemFailed(v, 'Attacks_Spellcasting');
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

class _ReadonlyAttacks_Spellcasting extends Attacks_Spellcasting with $pb.ReadonlyMessageMixin {}

class Hitpoints extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Hitpoints')
    ..a<int>(1, 'armorClass', $pb.PbFieldType.OS3)
    ..a<int>(2, 'currentHitpoints', $pb.PbFieldType.OS3)
    ..a<int>(3, 'maxHitpoints', $pb.PbFieldType.OS3)
    ..a<int>(4, 'temporaryHitpoints', $pb.PbFieldType.OS3)
    ..aOS(5, 'hitdice')
    ..hasRequiredFields = false
  ;

  Hitpoints() : super();
  Hitpoints.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Hitpoints.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Hitpoints clone() => new Hitpoints()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static Hitpoints create() => new Hitpoints();
  static $pb.PbList<Hitpoints> createRepeated() => new $pb.PbList<Hitpoints>();
  static Hitpoints getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyHitpoints();
    return _defaultInstance;
  }
  static Hitpoints _defaultInstance;
  static void $checkItem(Hitpoints v) {
    if (v is! Hitpoints) $pb.checkItemFailed(v, 'Hitpoints');
  }

  int get armorClass => $_get(0, 0);
  set armorClass(int v) { $_setSignedInt32(0, v); }
  bool hasArmorClass() => $_has(0);
  void clearArmorClass() => clearField(1);

  int get currentHitpoints => $_get(1, 0);
  set currentHitpoints(int v) { $_setSignedInt32(1, v); }
  bool hasCurrentHitpoints() => $_has(1);
  void clearCurrentHitpoints() => clearField(2);

  int get maxHitpoints => $_get(2, 0);
  set maxHitpoints(int v) { $_setSignedInt32(2, v); }
  bool hasMaxHitpoints() => $_has(2);
  void clearMaxHitpoints() => clearField(3);

  int get temporaryHitpoints => $_get(3, 0);
  set temporaryHitpoints(int v) { $_setSignedInt32(3, v); }
  bool hasTemporaryHitpoints() => $_has(3);
  void clearTemporaryHitpoints() => clearField(4);

  String get hitdice => $_getS(4, '');
  set hitdice(String v) { $_setString(4, v); }
  bool hasHitdice() => $_has(4);
  void clearHitdice() => clearField(5);
}

class _ReadonlyHitpoints extends Hitpoints with $pb.ReadonlyMessageMixin {}

class Equipment extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Equipment')
    ..aOS(1, 'name')
    ..a<int>(2, 'value', $pb.PbFieldType.OS3)
    ..hasRequiredFields = false
  ;

  Equipment() : super();
  Equipment.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Equipment.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Equipment clone() => new Equipment()..mergeFromMessage(this);
  $pb.BuilderInfo get info_ => _i;
  static Equipment create() => new Equipment();
  static $pb.PbList<Equipment> createRepeated() => new $pb.PbList<Equipment>();
  static Equipment getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyEquipment();
    return _defaultInstance;
  }
  static Equipment _defaultInstance;
  static void $checkItem(Equipment v) {
    if (v is! Equipment) $pb.checkItemFailed(v, 'Equipment');
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

class _ReadonlyEquipment extends Equipment with $pb.ReadonlyMessageMixin {}

