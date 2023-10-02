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


/** This is an auto generated class representing the Roster type in your schema. */
class Roster {
  final int? _size;
  final List<String>? _catcher;
  final List<String>? _firstBase;
  final List<String>? _secondBase;
  final List<String>? _thirdBase;
  final List<String>? _shortStop;
  final List<String>? _outfielders;
  final List<String>? _startingPitchers;
  final List<String>? _reliefPitchers;
  final List<String>? _bench;

  int? get size {
    return _size;
  }
  
  List<String> get catcher {
    try {
      return _catcher!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String> get firstBase {
    try {
      return _firstBase!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String> get secondBase {
    try {
      return _secondBase!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String> get thirdBase {
    try {
      return _thirdBase!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String> get shortStop {
    try {
      return _shortStop!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String> get outfielders {
    try {
      return _outfielders!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String> get startingPitchers {
    try {
      return _startingPitchers!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String> get reliefPitchers {
    try {
      return _reliefPitchers!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String> get bench {
    try {
      return _bench!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const Roster._internal({size, required catcher, required firstBase, required secondBase, required thirdBase, required shortStop, required outfielders, required startingPitchers, required reliefPitchers, required bench}): _size = size, _catcher = catcher, _firstBase = firstBase, _secondBase = secondBase, _thirdBase = thirdBase, _shortStop = shortStop, _outfielders = outfielders, _startingPitchers = startingPitchers, _reliefPitchers = reliefPitchers, _bench = bench;
  
  factory Roster({int? size, required List<String> catcher, required List<String> firstBase, required List<String> secondBase, required List<String> thirdBase, required List<String> shortStop, required List<String> outfielders, required List<String> startingPitchers, required List<String> reliefPitchers, required List<String> bench}) {
    return Roster._internal(
      size: size,
      catcher: catcher != null ? List<String>.unmodifiable(catcher) : catcher,
      firstBase: firstBase != null ? List<String>.unmodifiable(firstBase) : firstBase,
      secondBase: secondBase != null ? List<String>.unmodifiable(secondBase) : secondBase,
      thirdBase: thirdBase != null ? List<String>.unmodifiable(thirdBase) : thirdBase,
      shortStop: shortStop != null ? List<String>.unmodifiable(shortStop) : shortStop,
      outfielders: outfielders != null ? List<String>.unmodifiable(outfielders) : outfielders,
      startingPitchers: startingPitchers != null ? List<String>.unmodifiable(startingPitchers) : startingPitchers,
      reliefPitchers: reliefPitchers != null ? List<String>.unmodifiable(reliefPitchers) : reliefPitchers,
      bench: bench != null ? List<String>.unmodifiable(bench) : bench);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Roster &&
      _size == other._size &&
      DeepCollectionEquality().equals(_catcher, other._catcher) &&
      DeepCollectionEquality().equals(_firstBase, other._firstBase) &&
      DeepCollectionEquality().equals(_secondBase, other._secondBase) &&
      DeepCollectionEquality().equals(_thirdBase, other._thirdBase) &&
      DeepCollectionEquality().equals(_shortStop, other._shortStop) &&
      DeepCollectionEquality().equals(_outfielders, other._outfielders) &&
      DeepCollectionEquality().equals(_startingPitchers, other._startingPitchers) &&
      DeepCollectionEquality().equals(_reliefPitchers, other._reliefPitchers) &&
      DeepCollectionEquality().equals(_bench, other._bench);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Roster {");
    buffer.write("size=" + (_size != null ? _size!.toString() : "null") + ", ");
    buffer.write("catcher=" + (_catcher != null ? _catcher!.toString() : "null") + ", ");
    buffer.write("firstBase=" + (_firstBase != null ? _firstBase!.toString() : "null") + ", ");
    buffer.write("secondBase=" + (_secondBase != null ? _secondBase!.toString() : "null") + ", ");
    buffer.write("thirdBase=" + (_thirdBase != null ? _thirdBase!.toString() : "null") + ", ");
    buffer.write("shortStop=" + (_shortStop != null ? _shortStop!.toString() : "null") + ", ");
    buffer.write("outfielders=" + (_outfielders != null ? _outfielders!.toString() : "null") + ", ");
    buffer.write("startingPitchers=" + (_startingPitchers != null ? _startingPitchers!.toString() : "null") + ", ");
    buffer.write("reliefPitchers=" + (_reliefPitchers != null ? _reliefPitchers!.toString() : "null") + ", ");
    buffer.write("bench=" + (_bench != null ? _bench!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Roster copyWith({int? size, List<String>? catcher, List<String>? firstBase, List<String>? secondBase, List<String>? thirdBase, List<String>? shortStop, List<String>? outfielders, List<String>? startingPitchers, List<String>? reliefPitchers, List<String>? bench}) {
    return Roster._internal(
      size: size ?? this.size,
      catcher: catcher ?? this.catcher,
      firstBase: firstBase ?? this.firstBase,
      secondBase: secondBase ?? this.secondBase,
      thirdBase: thirdBase ?? this.thirdBase,
      shortStop: shortStop ?? this.shortStop,
      outfielders: outfielders ?? this.outfielders,
      startingPitchers: startingPitchers ?? this.startingPitchers,
      reliefPitchers: reliefPitchers ?? this.reliefPitchers,
      bench: bench ?? this.bench);
  }
  
  Roster copyWithModelFieldValues({
    ModelFieldValue<int?>? size,
    ModelFieldValue<List<String>?>? catcher,
    ModelFieldValue<List<String>?>? firstBase,
    ModelFieldValue<List<String>?>? secondBase,
    ModelFieldValue<List<String>?>? thirdBase,
    ModelFieldValue<List<String>?>? shortStop,
    ModelFieldValue<List<String>?>? outfielders,
    ModelFieldValue<List<String>?>? startingPitchers,
    ModelFieldValue<List<String>?>? reliefPitchers,
    ModelFieldValue<List<String>?>? bench
  }) {
    return Roster._internal(
      size: size == null ? this.size : size.value,
      catcher: catcher == null ? this.catcher : catcher.value,
      firstBase: firstBase == null ? this.firstBase : firstBase.value,
      secondBase: secondBase == null ? this.secondBase : secondBase.value,
      thirdBase: thirdBase == null ? this.thirdBase : thirdBase.value,
      shortStop: shortStop == null ? this.shortStop : shortStop.value,
      outfielders: outfielders == null ? this.outfielders : outfielders.value,
      startingPitchers: startingPitchers == null ? this.startingPitchers : startingPitchers.value,
      reliefPitchers: reliefPitchers == null ? this.reliefPitchers : reliefPitchers.value,
      bench: bench == null ? this.bench : bench.value
    );
  }
  
  Roster.fromJson(Map<String, dynamic> json)  
    : _size = (json['size'] as num?)?.toInt(),
      _catcher = json['catcher']?.cast<String>(),
      _firstBase = json['firstBase']?.cast<String>(),
      _secondBase = json['secondBase']?.cast<String>(),
      _thirdBase = json['thirdBase']?.cast<String>(),
      _shortStop = json['shortStop']?.cast<String>(),
      _outfielders = json['outfielders']?.cast<String>(),
      _startingPitchers = json['startingPitchers']?.cast<String>(),
      _reliefPitchers = json['reliefPitchers']?.cast<String>(),
      _bench = json['bench']?.cast<String>();
  
  Map<String, dynamic> toJson() => {
    'size': _size, 'catcher': _catcher, 'firstBase': _firstBase, 'secondBase': _secondBase, 'thirdBase': _thirdBase, 'shortStop': _shortStop, 'outfielders': _outfielders, 'startingPitchers': _startingPitchers, 'reliefPitchers': _reliefPitchers, 'bench': _bench
  };
  
  Map<String, Object?> toMap() => {
    'size': _size,
    'catcher': _catcher,
    'firstBase': _firstBase,
    'secondBase': _secondBase,
    'thirdBase': _thirdBase,
    'shortStop': _shortStop,
    'outfielders': _outfielders,
    'startingPitchers': _startingPitchers,
    'reliefPitchers': _reliefPitchers,
    'bench': _bench
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Roster";
    modelSchemaDefinition.pluralName = "Rosters";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'size',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'catcher',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'firstBase',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'secondBase',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'thirdBase',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'shortStop',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'outfielders',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'startingPitchers',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'reliefPitchers',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'bench',
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
  });
}