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


/** This is an auto generated class representing the Matchup type in your schema. */
class Matchup {
  final String? _teamOne;
  final String? _teamTwo;
  final int? _week;

  String? get teamOne {
    return _teamOne;
  }
  
  String? get teamTwo {
    return _teamTwo;
  }
  
  int? get week {
    return _week;
  }
  
  const Matchup._internal({teamOne, teamTwo, week}): _teamOne = teamOne, _teamTwo = teamTwo, _week = week;
  
  factory Matchup({String? teamOne, String? teamTwo, int? week}) {
    return Matchup._internal(
      teamOne: teamOne,
      teamTwo: teamTwo,
      week: week);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Matchup &&
      _teamOne == other._teamOne &&
      _teamTwo == other._teamTwo &&
      _week == other._week;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Matchup {");
    buffer.write("teamOne=" + "$_teamOne" + ", ");
    buffer.write("teamTwo=" + "$_teamTwo" + ", ");
    buffer.write("week=" + (_week != null ? _week!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Matchup copyWith({String? teamOne, String? teamTwo, int? week}) {
    return Matchup._internal(
      teamOne: teamOne ?? this.teamOne,
      teamTwo: teamTwo ?? this.teamTwo,
      week: week ?? this.week);
  }
  
  Matchup copyWithModelFieldValues({
    ModelFieldValue<String?>? teamOne,
    ModelFieldValue<String?>? teamTwo,
    ModelFieldValue<int?>? week
  }) {
    return Matchup._internal(
      teamOne: teamOne == null ? this.teamOne : teamOne.value,
      teamTwo: teamTwo == null ? this.teamTwo : teamTwo.value,
      week: week == null ? this.week : week.value
    );
  }
  
  Matchup.fromJson(Map<String, dynamic> json)  
    : _teamOne = json['teamOne'],
      _teamTwo = json['teamTwo'],
      _week = (json['week'] as num?)?.toInt();
  
  Map<String, dynamic> toJson() => {
    'teamOne': _teamOne, 'teamTwo': _teamTwo, 'week': _week
  };
  
  Map<String, Object?> toMap() => {
    'teamOne': _teamOne,
    'teamTwo': _teamTwo,
    'week': _week
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Matchup";
    modelSchemaDefinition.pluralName = "Matchups";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'teamOne',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'teamTwo',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'week',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
  });
}