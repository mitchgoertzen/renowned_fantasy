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


/** This is an auto generated class representing the BattingStats type in your schema. */
class BattingStats {
  final String? _NewField;

  String? get NewField {
    return _NewField;
  }
  
  const BattingStats._internal({NewField}): _NewField = NewField;
  
  factory BattingStats({String? NewField}) {
    return BattingStats._internal(
      NewField: NewField);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BattingStats &&
      _NewField == other._NewField;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("BattingStats {");
    buffer.write("NewField=" + "$_NewField");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  BattingStats copyWith({String? NewField}) {
    return BattingStats._internal(
      NewField: NewField ?? this.NewField);
  }
  
  BattingStats copyWithModelFieldValues({
    ModelFieldValue<String?>? NewField
  }) {
    return BattingStats._internal(
      NewField: NewField == null ? this.NewField : NewField.value
    );
  }
  
  BattingStats.fromJson(Map<String, dynamic> json)  
    : _NewField = json['NewField'];
  
  Map<String, dynamic> toJson() => {
    'NewField': _NewField
  };
  
  Map<String, Object?> toMap() => {
    'NewField': _NewField
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "BattingStats";
    modelSchemaDefinition.pluralName = "BattingStats";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'NewField',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}