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


/** This is an auto generated class representing the League type in your schema. */
class League extends amplify_core.Model {
  static const classType = const _LeagueModelType();
  final String id;
  final String? _name;
  final List<LeagueManager>? _managers;
  final amplify_core.TemporalDate? _creationDate;
  final List<Team>? _teams;
  final String? _owner;
  final List<Matchup>? _matchups;
  final String? _statsCatgeories;
  final List<LeaguePlayer>? _leaguePlayers;
  final int? _currentWeek;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  LeagueModelIdentifier get modelIdentifier {
      return LeagueModelIdentifier(
        id: id
      );
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<LeagueManager>? get managers {
    return _managers;
  }
  
  amplify_core.TemporalDate get creationDate {
    try {
      return _creationDate!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<Team>? get teams {
    return _teams;
  }
  
  String? get owner {
    return _owner;
  }
  
  List<Matchup>? get matchups {
    return _matchups;
  }
  
  String? get statsCatgeories {
    return _statsCatgeories;
  }
  
  List<LeaguePlayer>? get leaguePlayers {
    return _leaguePlayers;
  }
  
  int? get currentWeek {
    return _currentWeek;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const League._internal({required this.id, required name, managers, required creationDate, teams, owner, matchups, statsCatgeories, leaguePlayers, currentWeek, createdAt, updatedAt}): _name = name, _managers = managers, _creationDate = creationDate, _teams = teams, _owner = owner, _matchups = matchups, _statsCatgeories = statsCatgeories, _leaguePlayers = leaguePlayers, _currentWeek = currentWeek, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory League({String? id, required String name, List<LeagueManager>? managers, required amplify_core.TemporalDate creationDate, List<Team>? teams, String? owner, List<Matchup>? matchups, String? statsCatgeories, List<LeaguePlayer>? leaguePlayers, int? currentWeek}) {
    return League._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      name: name,
      managers: managers != null ? List<LeagueManager>.unmodifiable(managers) : managers,
      creationDate: creationDate,
      teams: teams != null ? List<Team>.unmodifiable(teams) : teams,
      owner: owner,
      matchups: matchups != null ? List<Matchup>.unmodifiable(matchups) : matchups,
      statsCatgeories: statsCatgeories,
      leaguePlayers: leaguePlayers != null ? List<LeaguePlayer>.unmodifiable(leaguePlayers) : leaguePlayers,
      currentWeek: currentWeek);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is League &&
      id == other.id &&
      _name == other._name &&
      DeepCollectionEquality().equals(_managers, other._managers) &&
      _creationDate == other._creationDate &&
      DeepCollectionEquality().equals(_teams, other._teams) &&
      _owner == other._owner &&
      DeepCollectionEquality().equals(_matchups, other._matchups) &&
      _statsCatgeories == other._statsCatgeories &&
      DeepCollectionEquality().equals(_leaguePlayers, other._leaguePlayers) &&
      _currentWeek == other._currentWeek;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("League {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("creationDate=" + (_creationDate != null ? _creationDate!.format() : "null") + ", ");
    buffer.write("owner=" + "$_owner" + ", ");
    buffer.write("matchups=" + (_matchups != null ? _matchups!.toString() : "null") + ", ");
    buffer.write("statsCatgeories=" + "$_statsCatgeories" + ", ");
    buffer.write("leaguePlayers=" + (_leaguePlayers != null ? _leaguePlayers!.toString() : "null") + ", ");
    buffer.write("currentWeek=" + (_currentWeek != null ? _currentWeek!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  League copyWith({String? name, List<LeagueManager>? managers, amplify_core.TemporalDate? creationDate, List<Team>? teams, String? owner, List<Matchup>? matchups, String? statsCatgeories, List<LeaguePlayer>? leaguePlayers, int? currentWeek}) {
    return League._internal(
      id: id,
      name: name ?? this.name,
      managers: managers ?? this.managers,
      creationDate: creationDate ?? this.creationDate,
      teams: teams ?? this.teams,
      owner: owner ?? this.owner,
      matchups: matchups ?? this.matchups,
      statsCatgeories: statsCatgeories ?? this.statsCatgeories,
      leaguePlayers: leaguePlayers ?? this.leaguePlayers,
      currentWeek: currentWeek ?? this.currentWeek);
  }
  
  League copyWithModelFieldValues({
    ModelFieldValue<String>? name,
    ModelFieldValue<List<LeagueManager>?>? managers,
    ModelFieldValue<amplify_core.TemporalDate>? creationDate,
    ModelFieldValue<List<Team>?>? teams,
    ModelFieldValue<String?>? owner,
    ModelFieldValue<List<Matchup>?>? matchups,
    ModelFieldValue<String?>? statsCatgeories,
    ModelFieldValue<List<LeaguePlayer>?>? leaguePlayers,
    ModelFieldValue<int?>? currentWeek
  }) {
    return League._internal(
      id: id,
      name: name == null ? this.name : name.value,
      managers: managers == null ? this.managers : managers.value,
      creationDate: creationDate == null ? this.creationDate : creationDate.value,
      teams: teams == null ? this.teams : teams.value,
      owner: owner == null ? this.owner : owner.value,
      matchups: matchups == null ? this.matchups : matchups.value,
      statsCatgeories: statsCatgeories == null ? this.statsCatgeories : statsCatgeories.value,
      leaguePlayers: leaguePlayers == null ? this.leaguePlayers : leaguePlayers.value,
      currentWeek: currentWeek == null ? this.currentWeek : currentWeek.value
    );
  }
  
  League.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _managers = json['managers'] is List
        ? (json['managers'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => LeagueManager.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _creationDate = json['creationDate'] != null ? amplify_core.TemporalDate.fromString(json['creationDate']) : null,
      _teams = json['teams'] is List
        ? (json['teams'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Team.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _owner = json['owner'],
      _matchups = json['matchups'] is List
        ? (json['matchups'] as List)
          .where((e) => e != null)
          .map((e) => Matchup.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _statsCatgeories = json['statsCatgeories'],
      _leaguePlayers = json['leaguePlayers'] is List
        ? (json['leaguePlayers'] as List)
          .where((e) => e != null)
          .map((e) => LeaguePlayer.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _currentWeek = (json['currentWeek'] as num?)?.toInt(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'managers': _managers?.map((LeagueManager? e) => e?.toJson()).toList(), 'creationDate': _creationDate?.format(), 'teams': _teams?.map((Team? e) => e?.toJson()).toList(), 'owner': _owner, 'matchups': _matchups?.map((Matchup? e) => e?.toJson()).toList(), 'statsCatgeories': _statsCatgeories, 'leaguePlayers': _leaguePlayers?.map((LeaguePlayer? e) => e?.toJson()).toList(), 'currentWeek': _currentWeek, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'name': _name,
    'managers': _managers,
    'creationDate': _creationDate,
    'teams': _teams,
    'owner': _owner,
    'matchups': _matchups,
    'statsCatgeories': _statsCatgeories,
    'leaguePlayers': _leaguePlayers,
    'currentWeek': _currentWeek,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<LeagueModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<LeagueModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final MANAGERS = amplify_core.QueryField(
    fieldName: "managers",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'LeagueManager'));
  static final CREATIONDATE = amplify_core.QueryField(fieldName: "creationDate");
  static final TEAMS = amplify_core.QueryField(
    fieldName: "teams",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Team'));
  static final OWNER = amplify_core.QueryField(fieldName: "owner");
  static final MATCHUPS = amplify_core.QueryField(fieldName: "matchups");
  static final STATSCATGEORIES = amplify_core.QueryField(fieldName: "statsCatgeories");
  static final LEAGUEPLAYERS = amplify_core.QueryField(fieldName: "leaguePlayers");
  static final CURRENTWEEK = amplify_core.QueryField(fieldName: "currentWeek");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "League";
    modelSchemaDefinition.pluralName = "Leagues";
    
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
      key: League.NAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: League.MANAGERS,
      isRequired: false,
      ofModelName: 'LeagueManager',
      associatedKey: LeagueManager.LEAGUE
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: League.CREATIONDATE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: League.TEAMS,
      isRequired: false,
      ofModelName: 'Team',
      associatedKey: Team.LEAGUEID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: League.OWNER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'matchups',
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'Matchup')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: League.STATSCATGEORIES,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'leaguePlayers',
      isRequired: false,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'LeaguePlayer')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: League.CURRENTWEEK,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
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

class _LeagueModelType extends amplify_core.ModelType<League> {
  const _LeagueModelType();
  
  @override
  League fromJson(Map<String, dynamic> jsonData) {
    return League.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'League';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [League] in your schema.
 */
class LeagueModelIdentifier implements amplify_core.ModelIdentifier<League> {
  final String id;

  /** Create an instance of LeagueModelIdentifier using [id] the primary key. */
  const LeagueModelIdentifier({
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
  String toString() => 'LeagueModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is LeagueModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}