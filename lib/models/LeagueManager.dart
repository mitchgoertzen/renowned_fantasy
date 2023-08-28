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


/** This is an auto generated class representing the LeagueManager type in your schema. */
class LeagueManager extends amplify_core.Model {
  static const classType = const _LeagueManagerModelType();
  final String id;
  final League? _league;
  final Manager? _manager;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  LeagueManagerModelIdentifier get modelIdentifier {
      return LeagueManagerModelIdentifier(
        id: id
      );
  }
  
  League get league {
    try {
      return _league!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Manager get manager {
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
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const LeagueManager._internal({required this.id, required league, required manager, createdAt, updatedAt}): _league = league, _manager = manager, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory LeagueManager({String? id, required League league, required Manager manager}) {
    return LeagueManager._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      league: league,
      manager: manager);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LeagueManager &&
      id == other.id &&
      _league == other._league &&
      _manager == other._manager;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("LeagueManager {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("league=" + (_league != null ? _league!.toString() : "null") + ", ");
    buffer.write("manager=" + (_manager != null ? _manager!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  LeagueManager copyWith({League? league, Manager? manager}) {
    return LeagueManager._internal(
      id: id,
      league: league ?? this.league,
      manager: manager ?? this.manager);
  }
  
  LeagueManager copyWithModelFieldValues({
    ModelFieldValue<League>? league,
    ModelFieldValue<Manager>? manager
  }) {
    return LeagueManager._internal(
      id: id,
      league: league == null ? this.league : league.value,
      manager: manager == null ? this.manager : manager.value
    );
  }
  
  LeagueManager.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _league = json['league']?['serializedData'] != null
        ? League.fromJson(new Map<String, dynamic>.from(json['league']['serializedData']))
        : null,
      _manager = json['manager']?['serializedData'] != null
        ? Manager.fromJson(new Map<String, dynamic>.from(json['manager']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'league': _league?.toJson(), 'manager': _manager?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'league': _league,
    'manager': _manager,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<LeagueManagerModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<LeagueManagerModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final LEAGUE = amplify_core.QueryField(
    fieldName: "league",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'League'));
  static final MANAGER = amplify_core.QueryField(
    fieldName: "manager",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Manager'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "LeagueManager";
    modelSchemaDefinition.pluralName = "LeagueManagers";
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["leagueId"], name: "byLeague"),
      amplify_core.ModelIndex(fields: const ["managerId"], name: "byManager")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: LeagueManager.LEAGUE,
      isRequired: true,
      targetNames: ['leagueId'],
      ofModelName: 'League'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: LeagueManager.MANAGER,
      isRequired: true,
      targetNames: ['managerId'],
      ofModelName: 'Manager'
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

class _LeagueManagerModelType extends amplify_core.ModelType<LeagueManager> {
  const _LeagueManagerModelType();
  
  @override
  LeagueManager fromJson(Map<String, dynamic> jsonData) {
    return LeagueManager.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'LeagueManager';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [LeagueManager] in your schema.
 */
class LeagueManagerModelIdentifier implements amplify_core.ModelIdentifier<LeagueManager> {
  final String id;

  /** Create an instance of LeagueManagerModelIdentifier using [id] the primary key. */
  const LeagueManagerModelIdentifier({
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
  String toString() => 'LeagueManagerModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is LeagueManagerModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}