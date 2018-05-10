///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library session_server_pbjson;

const GetSessionRequest$json = const {
  '1': 'GetSessionRequest',
  '2': const [
    const {'1': 'auth_id_token', '3': 1, '4': 1, '5': 9, '10': 'authIdToken'},
    const {'1': 'session_id', '3': 2, '4': 1, '5': 9, '10': 'sessionId'},
  ],
};

const NewSessionRequest$json = const {
  '1': 'NewSessionRequest',
  '2': const [
    const {'1': 'auth_id_token', '3': 1, '4': 1, '5': 9, '10': 'authIdToken'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'max_players', '3': 3, '4': 1, '5': 13, '10': 'maxPlayers'},
    const {'1': 'private', '3': 4, '4': 1, '5': 8, '10': 'private'},
  ],
};

const ListRequest$json = const {
  '1': 'ListRequest',
  '2': const [
    const {'1': 'auth_id_token', '3': 1, '4': 1, '5': 9, '10': 'authIdToken'},
    const {'1': 'limit', '3': 2, '4': 1, '5': 13, '10': 'limit'},
    const {'1': 'full', '3': 3, '4': 1, '5': 8, '10': 'full'},
  ],
};

const LeaveRequest$json = const {
  '1': 'LeaveRequest',
  '2': const [
    const {'1': 'auth_id_token', '3': 1, '4': 1, '5': 9, '10': 'authIdToken'},
    const {'1': 'session_id', '3': 2, '4': 1, '5': 9, '10': 'sessionId'},
  ],
};

const JoinRequest$json = const {
  '1': 'JoinRequest',
  '2': const [
    const {'1': 'auth_id_token', '3': 1, '4': 1, '5': 9, '10': 'authIdToken'},
    const {'1': 'session_id', '3': 2, '4': 1, '5': 9, '10': 'sessionId'},
  ],
};

const KickPlayerRequest$json = const {
  '1': 'KickPlayerRequest',
  '2': const [
    const {'1': 'auth_id_token', '3': 1, '4': 1, '5': 9, '10': 'authIdToken'},
    const {'1': 'session_id', '3': 2, '4': 1, '5': 9, '10': 'sessionId'},
    const {'1': 'user', '3': 3, '4': 1, '5': 11, '6': '.session.User', '10': 'user'},
  ],
};

const SetPrivateRequest$json = const {
  '1': 'SetPrivateRequest',
  '2': const [
    const {'1': 'auth_id_token', '3': 1, '4': 1, '5': 9, '10': 'authIdToken'},
    const {'1': 'session_id', '3': 2, '4': 1, '5': 9, '10': 'sessionId'},
    const {'1': 'private', '3': 3, '4': 1, '5': 8, '10': 'private'},
  ],
};

const SetMaxPlayersRequest$json = const {
  '1': 'SetMaxPlayersRequest',
  '2': const [
    const {'1': 'auth_id_token', '3': 1, '4': 1, '5': 9, '10': 'authIdToken'},
    const {'1': 'number', '3': 2, '4': 1, '5': 13, '10': 'number'},
    const {'1': 'session_id', '3': 3, '4': 1, '5': 9, '10': 'sessionId'},
  ],
};

const SetNameRequest$json = const {
  '1': 'SetNameRequest',
  '2': const [
    const {'1': 'auth_id_token', '3': 1, '4': 1, '5': 9, '10': 'authIdToken'},
    const {'1': 'session_id', '3': 2, '4': 1, '5': 9, '10': 'sessionId'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
};

const ListReply$json = const {
  '1': 'ListReply',
  '2': const [
    const {'1': 'sessions', '3': 1, '4': 3, '5': 11, '6': '.session.Session', '10': 'sessions'},
    const {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
  ],
};

const LeaveReply$json = const {
  '1': 'LeaveReply',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'status_message', '3': 2, '4': 1, '5': 9, '10': 'statusMessage'},
  ],
};

const Session$json = const {
  '1': 'Session',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'status_message', '3': 2, '4': 1, '5': 9, '10': 'statusMessage'},
    const {'1': 'session_id', '3': 3, '4': 1, '5': 9, '10': 'sessionId'},
    const {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'dungeon_master', '3': 5, '4': 1, '5': 11, '6': '.session.User', '10': 'dungeonMaster'},
    const {'1': 'date_created', '3': 6, '4': 1, '5': 9, '10': 'dateCreated'},
    const {'1': 'max_players', '3': 7, '4': 1, '5': 13, '10': 'maxPlayers'},
    const {'1': 'users', '3': 8, '4': 3, '5': 11, '6': '.session.User', '10': 'users'},
    const {'1': 'private', '3': 9, '4': 1, '5': 8, '10': 'private'},
    const {'1': 'full', '3': 10, '4': 1, '5': 8, '10': 'full'},
  ],
};

const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

