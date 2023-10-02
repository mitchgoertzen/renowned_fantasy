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


/** This is an auto generated class representing the Record type in your schema. */
class Record {
  final int? _wins;
  final int? _losses;
  final int? _draws;
  final double? _totalGames;

  int? get wins {
    return _wins;
  }
  
  int? get losses {
    return _losses;
  }
  
  int? get draws {
    return _draws;
  }
  
  double? get totalGames {
    return _totalGames;
  }
  
  const Record._internal({wins, losses, draws, totalGames}): _wins = wins, _losses = losses, _draws = draws, _totalGames = totalGames;
  
  factory Record({int? wins, int? losses, int? draws, double? totalGames}) {
    return Record._internal(
      wins: wins,
      losses: losses,
      draws: draws,
      totalGames: totalGames);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Record &&
      _wins == other._wins &&
      _losses == other._losses &&
      _draws == other._draws &&
      _totalGames == other._totalGames;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Record {");
    buffer.write("wins=" + (_wins != null ? _wins!.toString() : "null") + ", ");
    buffer.write("losses=" + (_losses != null ? _losses!.toString() : "null") + ", ");
    buffer.write("draws=" + (_draws != null ? _draws!.toString() : "null") + ", ");
    buffer.write("totalGames=" + (_totalGames != null ? _totalGames!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Record copyWith({int? wins, int? losses, int? draws, double? totalGames}) {
    return Record._internal(
      wins: wins ?? this.wins,
      losses: losses ?? this.losses,
      draws: draws ?? this.draws,
      totalGames: totalGames ?? this.totalGames);
  }
  
  Record copyWithModelFieldValues({
    ModelFieldValue<int?>? wins,
    ModelFieldValue<int?>? losses,
    ModelFieldValue<int?>? draws,
    ModelFieldValue<double?>? totalGames
  }) {
    return Record._internal(
      wins: wins == null ? this.wins : wins.value,
      losses: losses == null ? this.losses : losses.value,
      draws: draws == null ? this.draws : draws.value,
      totalGames: totalGames == null ? this.totalGames : totalGames.value
    );
  }
  
  Record.fromJson(Map<String, dynamic> json)  
    : _wins = (json['wins'] as num?)?.toInt(),
      _losses = (json['losses'] as num?)?.toInt(),
      _draws = (json['draws'] as num?)?.toInt(),
      _totalGames = (json['totalGames'] as num?)?.toDouble();
  
  Map<String, dynamic> toJson() => {
    'wins': _wins, 'losses': _losses, 'draws': _draws, 'totalGames': _totalGames
  };
  
  Map<String, Object?> toMap() => {
    'wins': _wins,
    'losses': _losses,
    'draws': _draws,
    'totalGames': _totalGames
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Record";
    modelSchemaDefinition.pluralName = "Records";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'wins',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'losses',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'draws',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'totalGames',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
  });
}