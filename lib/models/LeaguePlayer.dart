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


/** This is an auto generated class representing the LeaguePlayer type in your schema. */
class LeaguePlayer {
  final String? _playerID;
  final String? _teamID;

  String? get playerID {
    return _playerID;
  }
  
  String? get teamID {
    return _teamID;
  }
  
  const LeaguePlayer._internal({playerID, teamID}): _playerID = playerID, _teamID = teamID;
  
  factory LeaguePlayer({String? playerID, String? teamID}) {
    return LeaguePlayer._internal(
      playerID: playerID,
      teamID: teamID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LeaguePlayer &&
      _playerID == other._playerID &&
      _teamID == other._teamID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("LeaguePlayer {");
    buffer.write("playerID=" + "$_playerID" + ", ");
    buffer.write("teamID=" + "$_teamID");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  LeaguePlayer copyWith({String? playerID, String? teamID}) {
    return LeaguePlayer._internal(
      playerID: playerID ?? this.playerID,
      teamID: teamID ?? this.teamID);
  }
  
  LeaguePlayer copyWithModelFieldValues({
    ModelFieldValue<String?>? playerID,
    ModelFieldValue<String?>? teamID
  }) {
    return LeaguePlayer._internal(
      playerID: playerID == null ? this.playerID : playerID.value,
      teamID: teamID == null ? this.teamID : teamID.value
    );
  }
  
  LeaguePlayer.fromJson(Map<String, dynamic> json)  
    : _playerID = json['playerID'],
      _teamID = json['teamID'];
  
  Map<String, dynamic> toJson() => {
    'playerID': _playerID, 'teamID': _teamID
  };
  
  Map<String, Object?> toMap() => {
    'playerID': _playerID,
    'teamID': _teamID
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "LeaguePlayer";
    modelSchemaDefinition.pluralName = "LeaguePlayers";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'playerID',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'teamID',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}