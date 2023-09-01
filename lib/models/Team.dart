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


/** This is an auto generated class representing the Team type in your schema. */
class Team extends amplify_core.Model {
  static const classType = const _TeamModelType();
  final String id;
  final String? _name;
  final int? _weeklyTrades;
  final String? _manager;
  final String? _leagueID;
  final String? _logo;
  final Record? _record;
  final BattingStats? _battingStats;
  final PitchingStats? _pitchingStats;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  TeamModelIdentifier get modelIdentifier {
      return TeamModelIdentifier(
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
  
  int? get weeklyTrades {
    return _weeklyTrades;
  }
  
  String get manager {
    try {
      return _manager!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get leagueID {
    try {
      return _leagueID!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get logo {
    return _logo;
  }
  
  Record? get record {
    return _record;
  }
  
  BattingStats? get battingStats {
    return _battingStats;
  }
  
  PitchingStats? get pitchingStats {
    return _pitchingStats;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Team._internal({required this.id, required name, weeklyTrades, required manager, required leagueID, logo, record, battingStats, pitchingStats, createdAt, updatedAt}): _name = name, _weeklyTrades = weeklyTrades, _manager = manager, _leagueID = leagueID, _logo = logo, _record = record, _battingStats = battingStats, _pitchingStats = pitchingStats, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Team({String? id, required String name, int? weeklyTrades, required String manager, required String leagueID, String? logo, Record? record, BattingStats? battingStats, PitchingStats? pitchingStats}) {
    return Team._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      name: name,
      weeklyTrades: weeklyTrades,
      manager: manager,
      leagueID: leagueID,
      logo: logo,
      record: record,
      battingStats: battingStats,
      pitchingStats: pitchingStats);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Team &&
      id == other.id &&
      _name == other._name &&
      _weeklyTrades == other._weeklyTrades &&
      _manager == other._manager &&
      _leagueID == other._leagueID &&
      _logo == other._logo &&
      _record == other._record &&
      _battingStats == other._battingStats &&
      _pitchingStats == other._pitchingStats;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Team {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("weeklyTrades=" + (_weeklyTrades != null ? _weeklyTrades!.toString() : "null") + ", ");
    buffer.write("manager=" + "$_manager" + ", ");
    buffer.write("leagueID=" + "$_leagueID" + ", ");
    buffer.write("logo=" + "$_logo" + ", ");
    buffer.write("record=" + (_record != null ? _record!.toString() : "null") + ", ");
    buffer.write("battingStats=" + (_battingStats != null ? _battingStats!.toString() : "null") + ", ");
    buffer.write("pitchingStats=" + (_pitchingStats != null ? _pitchingStats!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Team copyWith({String? name, int? weeklyTrades, String? manager, String? leagueID, String? logo, Record? record, BattingStats? battingStats, PitchingStats? pitchingStats}) {
    return Team._internal(
      id: id,
      name: name ?? this.name,
      weeklyTrades: weeklyTrades ?? this.weeklyTrades,
      manager: manager ?? this.manager,
      leagueID: leagueID ?? this.leagueID,
      logo: logo ?? this.logo,
      record: record ?? this.record,
      battingStats: battingStats ?? this.battingStats,
      pitchingStats: pitchingStats ?? this.pitchingStats);
  }
  
  Team copyWithModelFieldValues({
    ModelFieldValue<String>? name,
    ModelFieldValue<int?>? weeklyTrades,
    ModelFieldValue<String>? manager,
    ModelFieldValue<String>? leagueID,
    ModelFieldValue<String?>? logo,
    ModelFieldValue<Record?>? record,
    ModelFieldValue<BattingStats?>? battingStats,
    ModelFieldValue<PitchingStats?>? pitchingStats
  }) {
    return Team._internal(
      id: id,
      name: name == null ? this.name : name.value,
      weeklyTrades: weeklyTrades == null ? this.weeklyTrades : weeklyTrades.value,
      manager: manager == null ? this.manager : manager.value,
      leagueID: leagueID == null ? this.leagueID : leagueID.value,
      logo: logo == null ? this.logo : logo.value,
      record: record == null ? this.record : record.value,
      battingStats: battingStats == null ? this.battingStats : battingStats.value,
      pitchingStats: pitchingStats == null ? this.pitchingStats : pitchingStats.value
    );
  }
  
  Team.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _weeklyTrades = (json['weeklyTrades'] as num?)?.toInt(),
      _manager = json['manager'],
      _leagueID = json['leagueID'],
      _logo = json['logo'],
      _record = json['record']?['serializedData'] != null
        ? Record.fromJson(new Map<String, dynamic>.from(json['record']['serializedData']))
        : null,
      _battingStats = json['battingStats']?['serializedData'] != null
        ? BattingStats.fromJson(new Map<String, dynamic>.from(json['battingStats']['serializedData']))
        : null,
      _pitchingStats = json['pitchingStats']?['serializedData'] != null
        ? PitchingStats.fromJson(new Map<String, dynamic>.from(json['pitchingStats']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'weeklyTrades': _weeklyTrades, 'manager': _manager, 'leagueID': _leagueID, 'logo': _logo, 'record': _record?.toJson(), 'battingStats': _battingStats?.toJson(), 'pitchingStats': _pitchingStats?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'name': _name,
    'weeklyTrades': _weeklyTrades,
    'manager': _manager,
    'leagueID': _leagueID,
    'logo': _logo,
    'record': _record,
    'battingStats': _battingStats,
    'pitchingStats': _pitchingStats,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<TeamModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<TeamModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final WEEKLYTRADES = amplify_core.QueryField(fieldName: "weeklyTrades");
  static final MANAGER = amplify_core.QueryField(fieldName: "manager");
  static final LEAGUEID = amplify_core.QueryField(fieldName: "leagueID");
  static final LOGO = amplify_core.QueryField(fieldName: "logo");
  static final RECORD = amplify_core.QueryField(fieldName: "record");
  static final BATTINGSTATS = amplify_core.QueryField(fieldName: "battingStats");
  static final PITCHINGSTATS = amplify_core.QueryField(fieldName: "pitchingStats");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Team";
    modelSchemaDefinition.pluralName = "Teams";
    
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
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["manager"], name: "byManager"),
      amplify_core.ModelIndex(fields: const ["leagueID"], name: "byLeague")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Team.NAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Team.WEEKLYTRADES,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Team.MANAGER,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Team.LEAGUEID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Team.LOGO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'record',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'Record')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'battingStats',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'BattingStats')
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.embedded(
      fieldName: 'pitchingStats',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.embedded, ofCustomTypeName: 'PitchingStats')
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

class _TeamModelType extends amplify_core.ModelType<Team> {
  const _TeamModelType();
  
  @override
  Team fromJson(Map<String, dynamic> jsonData) {
    return Team.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Team';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Team] in your schema.
 */
class TeamModelIdentifier implements amplify_core.ModelIdentifier<Team> {
  final String id;

  /** Create an instance of TeamModelIdentifier using [id] the primary key. */
  const TeamModelIdentifier({
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
  String toString() => 'TeamModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is TeamModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}