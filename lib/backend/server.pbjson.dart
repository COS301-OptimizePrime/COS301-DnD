///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library session_server_pbjson;

const AddCharacterToSessionRequest$json = const {
  '1': 'AddCharacterToSessionRequest',
  '2': const [
    const {'1': 'auth_id_token', '3': 1, '4': 1, '5': 9, '10': 'authIdToken'},
    const {'1': 'session_id', '3': 2, '4': 1, '5': 9, '10': 'sessionId'},
    const {'1': 'character_id', '3': 3, '4': 1, '5': 9, '10': 'characterId'},
  ],
};

const RemoveCharacterFromSessionRequest$json = const {
  '1': 'RemoveCharacterFromSessionRequest',
  '2': const [
    const {'1': 'auth_id_token', '3': 1, '4': 1, '5': 9, '10': 'authIdToken'},
    const {'1': 'session_id', '3': 2, '4': 1, '5': 9, '10': 'sessionId'},
    const {'1': 'character_id', '3': 3, '4': 1, '5': 9, '10': 'characterId'},
  ],
};

const GetCharactersInSessionRequest$json = const {
  '1': 'GetCharactersInSessionRequest',
  '2': const [
    const {'1': 'auth_id_token', '3': 1, '4': 1, '5': 9, '10': 'authIdToken'},
    const {'1': 'session_id', '3': 2, '4': 1, '5': 9, '10': 'sessionId'},
  ],
};

const GetCharactersInSessionResponse$json = const {
  '1': 'GetCharactersInSessionResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'status_message', '3': 2, '4': 1, '5': 9, '10': 'statusMessage'},
    const {'1': 'light_characters', '3': 3, '4': 3, '5': 11, '6': '.session.LightCharacter', '10': 'lightCharacters'},
  ],
};

const ChangeReadyUpExpiryTimeRequest$json = const {
  '1': 'ChangeReadyUpExpiryTimeRequest',
  '2': const [
    const {'1': 'auth_id_token', '3': 1, '4': 1, '5': 9, '10': 'authIdToken'},
    const {'1': 'session_id', '3': 2, '4': 1, '5': 9, '10': 'sessionId'},
    const {'1': 'ready_up_expiry_time', '3': 3, '4': 1, '5': 13, '10': 'readyUpExpiryTime'},
  ],
};

const ChangeReadyUpExpiryTimeResponse$json = const {
  '1': 'ChangeReadyUpExpiryTimeResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'status_message', '3': 2, '4': 1, '5': 9, '10': 'statusMessage'},
  ],
};

const ChangeStateRequest$json = const {
  '1': 'ChangeStateRequest',
  '2': const [
    const {'1': 'auth_id_token', '3': 1, '4': 1, '5': 9, '10': 'authIdToken'},
    const {'1': 'session_id', '3': 2, '4': 1, '5': 9, '10': 'sessionId'},
    const {'1': 'state', '3': 3, '4': 1, '5': 9, '10': 'state'},
  ],
};

const ReadyUpRequest$json = const {
  '1': 'ReadyUpRequest',
  '2': const [
    const {'1': 'auth_id_token', '3': 1, '4': 1, '5': 9, '10': 'authIdToken'},
    const {'1': 'session_id', '3': 2, '4': 1, '5': 9, '10': 'sessionId'},
  ],
};

const ReadyUpReply$json = const {
  '1': 'ReadyUpReply',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'status_message', '3': 2, '4': 1, '5': 9, '10': 'statusMessage'},
  ],
};

const GetCharacterByIdRequest$json = const {
  '1': 'GetCharacterByIdRequest',
  '2': const [
    const {'1': 'auth_id_token', '3': 1, '4': 1, '5': 9, '10': 'authIdToken'},
    const {'1': 'character_id', '3': 2, '4': 1, '5': 9, '10': 'characterId'},
  ],
};

const DeleteCharacterRequest$json = const {
  '1': 'DeleteCharacterRequest',
  '2': const [
    const {'1': 'auth_id_token', '3': 1, '4': 1, '5': 9, '10': 'authIdToken'},
    const {'1': 'character_id', '3': 2, '4': 1, '5': 9, '10': 'characterId'},
  ],
};

const UpdateCharacterRequest$json = const {
  '1': 'UpdateCharacterRequest',
  '2': const [
    const {'1': 'auth_id_token', '3': 1, '4': 1, '5': 9, '10': 'authIdToken'},
    const {'1': 'character', '3': 2, '4': 1, '5': 11, '6': '.session.Character', '10': 'character'},
  ],
};

const GetCharactersRequest$json = const {
  '1': 'GetCharactersRequest',
  '2': const [
    const {'1': 'auth_id_token', '3': 1, '4': 1, '5': 9, '10': 'authIdToken'},
    const {'1': 'limit', '3': 2, '4': 1, '5': 13, '10': 'limit'},
  ],
};

const GetCharactersReply$json = const {
  '1': 'GetCharactersReply',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'status_message', '3': 2, '4': 1, '5': 9, '10': 'statusMessage'},
    const {'1': 'light_characters', '3': 3, '4': 3, '5': 11, '6': '.session.LightCharacter', '10': 'lightCharacters'},
  ],
};

const GetSessionsOfUserRequest$json = const {
  '1': 'GetSessionsOfUserRequest',
  '2': const [
    const {'1': 'auth_id_token', '3': 1, '4': 1, '5': 9, '10': 'authIdToken'},
    const {'1': 'limit', '3': 2, '4': 1, '5': 13, '10': 'limit'},
  ],
};

const GetSessionsOfUserReply$json = const {
  '1': 'GetSessionsOfUserReply',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'status_message', '3': 2, '4': 1, '5': 9, '10': 'statusMessage'},
    const {'1': 'light_sessions', '3': 3, '4': 3, '5': 11, '6': '.session.LightSession', '10': 'lightSessions'},
  ],
};

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
    const {'1': 'status_message', '3': 3, '4': 1, '5': 9, '10': 'statusMessage'},
  ],
};

const LeaveReply$json = const {
  '1': 'LeaveReply',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'status_message', '3': 2, '4': 1, '5': 9, '10': 'statusMessage'},
  ],
};

const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'ready_in_this_session', '3': 3, '4': 1, '5': 8, '10': 'readyInThisSession'},
  ],
};

const NewCharacterRequest$json = const {
  '1': 'NewCharacterRequest',
  '2': const [
    const {'1': 'auth_id_token', '3': 1, '4': 1, '5': 9, '10': 'authIdToken'},
    const {'1': 'character', '3': 2, '4': 1, '5': 11, '6': '.session.Character', '10': 'character'},
  ],
};

const DeleteCharacterReply$json = const {
  '1': 'DeleteCharacterReply',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'status_message', '3': 2, '4': 1, '5': 9, '10': 'statusMessage'},
  ],
};

const LightSession$json = const {
  '1': 'LightSession',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'status_message', '3': 2, '4': 1, '5': 9, '10': 'statusMessage'},
    const {'1': 'session_id', '3': 3, '4': 1, '5': 9, '10': 'sessionId'},
    const {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'dungeon_master', '3': 5, '4': 1, '5': 11, '6': '.session.User', '10': 'dungeonMaster'},
    const {'1': 'last_updated', '3': 6, '4': 1, '5': 9, '10': 'lastUpdated'},
    const {'1': 'state', '3': 7, '4': 1, '5': 9, '10': 'state'},
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
    const {'1': 'state', '3': 11, '4': 1, '5': 9, '10': 'state'},
    const {'1': 'state_meta', '3': 12, '4': 1, '5': 13, '10': 'stateMeta'},
    const {'1': 'state_ready_start_time', '3': 13, '4': 1, '5': 9, '10': 'stateReadyStartTime'},
    const {'1': 'ready_users', '3': 14, '4': 3, '5': 11, '6': '.session.User', '10': 'readyUsers'},
    const {'1': 'last_updated', '3': 15, '4': 1, '5': 9, '10': 'lastUpdated'},
    const {'1': 'ready_up_expiry_time', '3': 16, '4': 1, '5': 13, '10': 'readyUpExpiryTime'},
    const {'1': 'charactersInSession', '3': 17, '4': 3, '5': 11, '6': '.session.LightCharacter', '10': 'charactersInSession'},
  ],
};

const LightCharacter$json = const {
  '1': 'LightCharacter',
  '2': const [
    const {'1': 'character_id', '3': 1, '4': 1, '5': 9, '10': 'characterId'},
    const {'1': 'creator_id', '3': 2, '4': 1, '5': 9, '10': 'creatorId'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'xp', '3': 4, '4': 1, '5': 17, '10': 'xp'},
    const {'1': 'gender', '3': 5, '4': 1, '5': 9, '10': 'gender'},
    const {'1': 'race', '3': 6, '4': 1, '5': 9, '10': 'race'},
    const {'1': 'character_class', '3': 7, '4': 1, '5': 9, '10': 'characterClass'},
    const {'1': 'hitpoints', '3': 8, '4': 1, '5': 11, '6': '.session.Hitpoints', '10': 'hitpoints'},
    const {'1': 'last_updated', '3': 9, '4': 1, '5': 9, '10': 'lastUpdated'},
    const {'1': 'session_id', '3': 10, '4': 1, '5': 9, '10': 'sessionId'},
  ],
};

const Character$json = const {
  '1': 'Character',
  '2': const [
    const {'1': 'character_id', '3': 1, '4': 1, '5': 9, '10': 'characterId'},
    const {'1': 'creator', '3': 2, '4': 1, '5': 11, '6': '.session.User', '10': 'creator'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'strength', '3': 4, '4': 1, '5': 17, '10': 'strength'},
    const {'1': 'strength_subscript', '3': 5, '4': 1, '5': 17, '10': 'strengthSubscript'},
    const {'1': 'dexterity', '3': 6, '4': 1, '5': 17, '10': 'dexterity'},
    const {'1': 'dexterity_subscript', '3': 7, '4': 1, '5': 17, '10': 'dexteritySubscript'},
    const {'1': 'constitution', '3': 8, '4': 1, '5': 17, '10': 'constitution'},
    const {'1': 'constitution_subscript', '3': 9, '4': 1, '5': 17, '10': 'constitutionSubscript'},
    const {'1': 'intelligence', '3': 10, '4': 1, '5': 17, '10': 'intelligence'},
    const {'1': 'intelligence_subscript', '3': 11, '4': 1, '5': 17, '10': 'intelligenceSubscript'},
    const {'1': 'wisdom', '3': 12, '4': 1, '5': 17, '10': 'wisdom'},
    const {'1': 'wisdom_subscript', '3': 13, '4': 1, '5': 17, '10': 'wisdomSubscript'},
    const {'1': 'charisma', '3': 14, '4': 1, '5': 17, '10': 'charisma'},
    const {'1': 'charisma_subscript', '3': 15, '4': 1, '5': 17, '10': 'charismaSubscript'},
    const {'1': 'character_class', '3': 16, '4': 1, '5': 9, '10': 'characterClass'},
    const {'1': 'race', '3': 17, '4': 1, '5': 9, '10': 'race'},
    const {'1': 'xp', '3': 18, '4': 1, '5': 17, '10': 'xp'},
    const {'1': 'alignment', '3': 19, '4': 1, '5': 9, '10': 'alignment'},
    const {'1': 'background', '3': 20, '4': 1, '5': 9, '10': 'background'},
    const {'1': 'inspiration', '3': 21, '4': 1, '5': 17, '10': 'inspiration'},
    const {'1': 'proficiency_bonus', '3': 22, '4': 1, '5': 17, '10': 'proficiencyBonus'},
    const {'1': 'skills', '3': 23, '4': 1, '5': 11, '6': '.session.Skills', '10': 'skills'},
    const {'1': 'passive_wisdom', '3': 24, '4': 1, '5': 17, '10': 'passiveWisdom'},
    const {'1': 'attacks_spellcasting', '3': 25, '4': 1, '5': 11, '6': '.session.Attacks_Spellcasting', '10': 'attacksSpellcasting'},
    const {'1': 'hitpoints', '3': 26, '4': 1, '5': 11, '6': '.session.Hitpoints', '10': 'hitpoints'},
    const {'1': 'personality_traits', '3': 27, '4': 1, '5': 9, '10': 'personalityTraits'},
    const {'1': 'ideals', '3': 28, '4': 1, '5': 9, '10': 'ideals'},
    const {'1': 'bonds', '3': 29, '4': 1, '5': 9, '10': 'bonds'},
    const {'1': 'flaws', '3': 30, '4': 1, '5': 9, '10': 'flaws'},
    const {'1': 'date_created', '3': 31, '4': 1, '5': 9, '10': 'dateCreated'},
    const {'1': 'status', '3': 32, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'status_message', '3': 33, '4': 1, '5': 9, '10': 'statusMessage'},
    const {'1': 'equipment', '3': 34, '4': 3, '5': 11, '6': '.session.Equipment', '10': 'equipment'},
    const {'1': 'session_id', '3': 35, '4': 1, '5': 9, '10': 'sessionId'},
    const {'1': 'features_and_traits', '3': 36, '4': 1, '5': 9, '10': 'featuresAndTraits'},
    const {'1': 'level', '3': 37, '4': 1, '5': 13, '10': 'level'},
    const {'1': 'gender', '3': 38, '4': 1, '5': 9, '10': 'gender'},
    const {'1': 'last_updated', '3': 39, '4': 1, '5': 9, '10': 'lastUpdated'},
  ],
};

const Skills$json = const {
  '1': 'Skills',
  '2': const [
    const {'1': 'acrobatics', '3': 1, '4': 1, '5': 17, '10': 'acrobatics'},
    const {'1': 'acrobatics_proficient', '3': 2, '4': 1, '5': 8, '10': 'acrobaticsProficient'},
    const {'1': 'animal_handling', '3': 3, '4': 1, '5': 17, '10': 'animalHandling'},
    const {'1': 'animal_handling_proficient', '3': 4, '4': 1, '5': 8, '10': 'animalHandlingProficient'},
    const {'1': 'arcana', '3': 5, '4': 1, '5': 17, '10': 'arcana'},
    const {'1': 'arcana_proficient', '3': 6, '4': 1, '5': 8, '10': 'arcanaProficient'},
    const {'1': 'athletics', '3': 7, '4': 1, '5': 17, '10': 'athletics'},
    const {'1': 'athletics_proficient', '3': 8, '4': 1, '5': 8, '10': 'athleticsProficient'},
    const {'1': 'deception', '3': 9, '4': 1, '5': 17, '10': 'deception'},
    const {'1': 'deception_proficient', '3': 10, '4': 1, '5': 8, '10': 'deceptionProficient'},
    const {'1': 'history', '3': 11, '4': 1, '5': 17, '10': 'history'},
    const {'1': 'history_proficient', '3': 12, '4': 1, '5': 8, '10': 'historyProficient'},
    const {'1': 'insight', '3': 13, '4': 1, '5': 17, '10': 'insight'},
    const {'1': 'insight_proficient', '3': 14, '4': 1, '5': 8, '10': 'insightProficient'},
    const {'1': 'intimidation', '3': 15, '4': 1, '5': 17, '10': 'intimidation'},
    const {'1': 'intimidation_proficient', '3': 16, '4': 1, '5': 8, '10': 'intimidationProficient'},
    const {'1': 'investigation', '3': 17, '4': 1, '5': 17, '10': 'investigation'},
    const {'1': 'investigation_proficient', '3': 18, '4': 1, '5': 8, '10': 'investigationProficient'},
    const {'1': 'medicine', '3': 19, '4': 1, '5': 17, '10': 'medicine'},
    const {'1': 'medicine_proficient', '3': 20, '4': 1, '5': 8, '10': 'medicineProficient'},
    const {'1': 'nature', '3': 21, '4': 1, '5': 17, '10': 'nature'},
    const {'1': 'nature_proficient', '3': 22, '4': 1, '5': 8, '10': 'natureProficient'},
    const {'1': 'perception', '3': 23, '4': 1, '5': 17, '10': 'perception'},
    const {'1': 'perception_proficient', '3': 24, '4': 1, '5': 8, '10': 'perceptionProficient'},
    const {'1': 'performance', '3': 25, '4': 1, '5': 17, '10': 'performance'},
    const {'1': 'performance_proficient', '3': 26, '4': 1, '5': 8, '10': 'performanceProficient'},
    const {'1': 'persuasion', '3': 27, '4': 1, '5': 17, '10': 'persuasion'},
    const {'1': 'persuasion_proficient', '3': 28, '4': 1, '5': 8, '10': 'persuasionProficient'},
    const {'1': 'religion', '3': 29, '4': 1, '5': 17, '10': 'religion'},
    const {'1': 'religion_proficient', '3': 30, '4': 1, '5': 8, '10': 'religionProficient'},
    const {'1': 'sleight_of_hand', '3': 31, '4': 1, '5': 17, '10': 'sleightOfHand'},
    const {'1': 'sleight_of_hand_proficient', '3': 32, '4': 1, '5': 8, '10': 'sleightOfHandProficient'},
    const {'1': 'stealth', '3': 33, '4': 1, '5': 17, '10': 'stealth'},
    const {'1': 'stealth_proficient', '3': 34, '4': 1, '5': 8, '10': 'stealthProficient'},
    const {'1': 'survival', '3': 35, '4': 1, '5': 17, '10': 'survival'},
    const {'1': 'survival_proficient', '3': 36, '4': 1, '5': 8, '10': 'survivalProficient'},
  ],
};

const Attacks_Spellcasting$json = const {
  '1': 'Attacks_Spellcasting',
  '2': const [
    const {'1': 'name_1', '3': 1, '4': 1, '5': 9, '10': 'name1'},
    const {'1': 'name_2', '3': 2, '4': 1, '5': 9, '10': 'name2'},
    const {'1': 'name_3', '3': 3, '4': 1, '5': 9, '10': 'name3'},
    const {'1': 'atk_bonus_1', '3': 4, '4': 1, '5': 17, '10': 'atkBonus1'},
    const {'1': 'atk_bonus_2', '3': 5, '4': 1, '5': 17, '10': 'atkBonus2'},
    const {'1': 'atk_bonus_3', '3': 6, '4': 1, '5': 17, '10': 'atkBonus3'},
    const {'1': 'damage_type_1', '3': 7, '4': 1, '5': 9, '10': 'damageType1'},
    const {'1': 'damage_type_2', '3': 8, '4': 1, '5': 9, '10': 'damageType2'},
    const {'1': 'damage_type_3', '3': 9, '4': 1, '5': 9, '10': 'damageType3'},
  ],
};

const Hitpoints$json = const {
  '1': 'Hitpoints',
  '2': const [
    const {'1': 'armor_class', '3': 1, '4': 1, '5': 17, '10': 'armorClass'},
    const {'1': 'current_hitpoints', '3': 2, '4': 1, '5': 17, '10': 'currentHitpoints'},
    const {'1': 'max_hitpoints', '3': 3, '4': 1, '5': 17, '10': 'maxHitpoints'},
    const {'1': 'temporary_hitpoints', '3': 4, '4': 1, '5': 17, '10': 'temporaryHitpoints'},
    const {'1': 'hitdice', '3': 5, '4': 1, '5': 9, '10': 'hitdice'},
  ],
};

const Equipment$json = const {
  '1': 'Equipment',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'value', '3': 2, '4': 1, '5': 17, '10': 'value'},
  ],
};

