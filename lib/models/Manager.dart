/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';


/** This is an auto generated class representing the Manager type in your schema. */
class Manager extends amplify_core.Model {
  static const classType = const _ManagerModelType();
  final String id;
  final String? _username;
  final List<LeagueManager>? _leagues;
  final List<Team>? _teams;
  final String? _userID;
  final Record? _record;
  final String? _avatar;
  final String? _banner;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ManagerModelIdentifier get modelIdentifier {
      return ManagerModelIdentifier(
        id: id
      );
  }
  
  String get username {
    try {
      return _username!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<LeagueManager>? get leagues {
    return _leagues;
  }
  
  List<Team>? get teams {
    return _teams;
  }
  
  String get userID {
    try {
      return _userID!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Record? get record {
    return _record;
  }
  
  String? get avatar {
    return _avatar;
  }
  
  String? get banner {
    return _banner;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Manager._internal({required this.id, required username, leagues, teams, required userID, record, avatar, banner, createdAt, updatedAt}): _username = username, _leagues = leagues, _teams = teams, _userID = userID, _record = record, _avatar = avatar, _banner = banner, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Manager({String? id, required String username, List<LeagueManager>? leagues, List<Team>? teams, required String userID, Record? record, String? avatar, String? banner}) {
    return Manager._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      username: username,
      leagues: leagues != null ? List<LeagueManager>.unmodifiable(leagues) : leagues,
      teams: teams != null ? List<Team>.unmodifiable(teams) : teams,
      userID: userID,
      record: record,
      avatar: avatar,
      banner: banner);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Manager &&
      id == other.id &&
      _username == other._username &&
      DeepCollectionEquality().equals(_leagues, other._leagues) &&
      DeepCollectionEquality().equals(_teams, other._teams) &&
      _userID == other._userID &&
      _record == other._record &&
      _avatar == other._avatar &&
      _banner == other._banner;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Manager {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("username=" + "$_username" + ", ");
    buffer.write("userID=" + "$_userID" + ", ");
    buffer.write("record=" + (_record != null ? _record!.toString() : "null") + ", ");
    buffer.write("avatar=" + "$_avatar" + ", ");
    buffer.write("banner=" + "$_banner" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Manager copyWith({String? username, List<LeagueManager>? leagues, List<Team>? teams, String? userID, Record? record, String? avatar, String? banner}) {
    return Manager._internal(
      id: id,
      username: username ?? this.username,
      leagues: leagues ?? this.leagues,
      teams: teams ?? this.teams,
      userID: userID ?? this.userID,
      record: record ?? this.record,
      avatar: avatar ?? this.avatar,
      banner: banner ?? this.banner);
  }
  
  Manager copyWithModelFieldValues({
    ModelFieldValue<String>? username,
    ModelFieldValue<List<LeagueManager>?>? leagues,
    ModelFieldValue<List<Team>?>? teams,
    ModelFieldValue<String>? userID,
    ModelFieldValue<Record?>? record,
    ModelFieldValue<String?>? avatar,
    ModelFieldValue<String?>? banner
  }) {
    return Manager._internal(
      id: id,
      username: username == null ? this.username : username.value,
      leagues: leagues == null ? this.leagues : leagues.value,
      teams: teams == null ? this.teams : teams.value,
      userID: userID == null ? this.userID : userID.value,
      record: record == null ? this.record : record.value,
      avatar: avatar == null ? this.avatar : avatar.value,
      banner: banner == null ? this.banner : banner.value
    );
  }
  
  Manager.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _username = json['username'],
      _leagues = json['leagues'] is List
        ? (json['leagues'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => LeagueManager.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _teams = json['teams'] is List
        ? (json['teams'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Team.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _userID = json['userID'],
      _record = json['record']?['serializedData'] != null
        ? Record.fromJson(new Map<String, dynamic>.from(json['record']['serializedData']))
        : null,
      _avatar = json['avatar'],
      _banner = json['banner'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'username': _username, 'leagues': _leagues?.map((LeagueManager? e) => e?.toJson()).toList(), 'teams': _teams?.map((Team? e) => e?.toJson()).toList(), 'userID': _userID, 'record': _record?.toJson(), 'avatar': _avatar, 'banner': _banner, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'username': _username,
    'leagues': _leagues,
    'teams': _teams,
    'userID': _userID,
    'record': _record,
    'avatar': _avatar,
    'banner': _banner,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<ManagerModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<ManagerModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final USERNAME = amplify_core.QueryField(fieldName: "username");
  static final LEAGUES = amplify_core.QueryField(
    fieldName: "leagues",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'LeagueManager'));
  static final TEAMS = amplify_core.QueryField(
    fieldName: "teams",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Team'));
  static final USERID = amplify_core.QueryField(fieldName: "userID");
  static final RECORD = amplify_core.QueryField(fieldName: "record");
  static final AVATAR = amplify_core.QueryField(fieldName: "avatar");
  static final BANNER = amplify_core.QueryField(fieldName: "banner");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Manager";
    modelSchemaDefinition.pluralName = "Managers";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ]),
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PRIVATE,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Manager.USERNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Manager.LEAGUES,
      isRequired: false,
      ofModelName: 'LeagueManager',
      associatedKey: LeagueManager.MANAGER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Manager.TEAMS,
      isRequired: false,
      ofModelName: 'Team',
      associatedKey: Team.MANAGER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Manager.USERID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'record',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Record')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Manager.AVATAR,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Manager.BANNER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _ManagerModelType extends amplify_core.ModelType<Manager> {
  const _ManagerModelType();
  
  @override
  Manager fromJson(Map<String, dynamic> jsonData) {
    return Manager.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Manager';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Manager] in your schema.
 */
class ManagerModelIdentifier implements amplify_core.ModelIdentifier<Manager> {
  final String id;

  /** Create an instance of ManagerModelIdentifier using [id] the primary key. */
  const ManagerModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'ManagerModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ManagerModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}